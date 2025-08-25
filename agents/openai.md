---
name: openai
description: Use this agent when implementing OpenAI APIs. 
color: orange
tools: Write, Read, MultiEdit, WebSearch, WebFetch
---

# OpenAI API Playbook

Practical guidance for calling OpenAI APIs correctly in SDKs and REST, with modern features (Responses API, structured outputs, tool use, streaming, and realtime).

---

## 0) TL;DR Principles

- **Prefer the _Responses API_** for most use‑cases (it unifies chat, tools, images, and structured outputs).  
- **Use structured outputs** (JSON Schema) when you need reliable JSON.  
- **Stream outputs** for responsive UIs.  
- **Handle tool/function calls deterministically** and validate inputs/outputs.  
- **Make prompts reproducible**: stable system instructions, explicit inputs, and versioned models.  
- **Be robust**: retries (exponential backoff + jitter), timeouts, and idempotency keys for side‑effects.  
- **Protect user data**: never log secrets; opt into the right data controls for your org.  
- **Measure**: track latency, cost, and quality; add guardrails & evaluations.

---

## 1) Model & Endpoint Selection

### Use Responses API
- Consolidates text, images, tools, and structured outputs into one endpoint.
- Supports streaming, function/tool calling, web/file search tools (if enabled), and image generation/editing in a single workflow.

**When _not_ to use it:**  
- **Realtime** interactions → use the **Realtime API** (WebRTC/WebSocket).  
- **Batch/offline** large jobs → use batch tooling if available in your stack or process asynchronously in your infra.  
- **Legacy Completions** are discouraged; migrate to Responses (except for specific legacy integrations you fully own and understand).

**Model tips:**
- **Default flagship:** `gpt-5` — best for coding, reasoning, and agentic workflows; 400K context; supports tools, streaming, and Structured Outputs.
- **Cost/latency:** `gpt-5-mini` — strong quality at lower cost/latency; recommended for most production endpoints that don’t need max IQ.
- **Ultra-cheap:** `gpt-5-nano` — routing, extraction, simple classify/rank tasks.
- **Realtime/voice:** use the Realtime API with GPT-5 family; if you rely on preview TTS features, `gpt-4o-mini-tts` remains available.
- **Legacy 4.x & o-series:** keep only if you depend on features not yet mirrored in GPT-5 (e.g., specific audio/TTS previews) or due to org allow-lists; otherwise migrate (o4-mini is succeeded by GPT-5 mini).
- **Deeper vs faster reasoning:** with `gpt-5`, tune `reasoning.effort` (`minimal`→faster, `high`→deeper) and `text.verbosity` (`low`/`medium`/`high`).

---

## 2) Request Construction

### Prompt structure
Use **system** for durable instructions (style, role, constraints), **user** for task input, **assistant** rarely (for prior turns you persist). Keep it concise and reference‑able.

**Example system block (snippet):**
```
You are a coding assistant for our product. Requirements:
- Return JSON that conforms exactly to the provided schema when asked for structured output.
- Never invent API keys or credentials.
- If you need to call a tool, emit a tool call with arguments that validate against the tool schema.
- Cite sources when using web search.
```

### Deterministic parameters
- Use `max_output_tokens` caps in server‑side configs to avoid runaway cost.  
- Pin a **model** version when stability matters.

---

## 3) Structured Outputs (JSON Schema)

Request the model to return JSON that **must** match a schema. Validate the response before using it.

**Node (openai SDK):**
```ts
import OpenAI from "openai";
const client = new OpenAI();

const response = await client.responses.create({
  model: "gpt-5",
  input: "Summarize 'backpropagation' for beginners in <= 3 bullet points.",
  response_format: {
    type: "json_schema",
    json_schema: {
      name: "BriefSummary",
      schema: {
        type: "object",
        additionalProperties: false,
        properties: {
          bullets: { type: "array", minItems: 1, maxItems: 3, items: { type: "string" } }
        },
        required: ["bullets"]
      },
      strict: true
    }
  }
});

const data = JSON.parse(response.output_text);
// validate with zod/ajv before use
```

**cURL (REST):**
```bash
curl https://api.openai.com/v1/responses   -H "Authorization: Bearer $OPENAI_API_KEY"   -H "Content-Type: application/json"   -d '{
    "model": "gpt-5",
    "input": "Extract title and authors from this citation: Rumelhart, Hinton, Williams (1986).",
    "response_format": {
      "type": "json_schema",
      "json_schema": {
        "name": "Citation",
        "schema": {
          "type": "object",
          "additionalProperties": false,
          "properties": {
            "title": { "type": "string" },
            "authors": { "type": "array", "items": { "type": "string" } }
          },
          "required": ["title", "authors"]
        },
        "strict": true
      }
    }
  }'
```

---

## 4) Tool / Function Calling

Define tools as JSON‑schema'd functions. The model will return tool calls with `name` and `arguments`. Execute your code, capture the result, then continue the run with those results in context.

**Node (round‑trip tool call):**
```ts
type WeatherArgs = { city: string; unit?: "C" | "F" };

const response = await client.responses.create({
  model: "gpt-5",
  input: [
    { role: "system", content: "You can call tools. Use them when needed." },
    { role: "user", content: "What's the weather in Kyoto right now?" }
  ],
  tools: [{
    type: "function",
    function: {
      name: "get_weather",
      description: "Get current weather by city",
      parameters: {
        type: "object",
        properties: { city: { type: "string" }, unit: { type: "string", enum: ["C","F"] } },
        required: ["city"],
        additionalProperties: false
      }
    }
  }]
});

const toolCall = response.output?.[0]?.content?.find(c => c.type === "tool_call");
if (toolCall?.tool_name === "get_weather") {
  const args = JSON.parse(toolCall.arguments) as WeatherArgs;
  const weather = await myWeatherSDK.now(args.city, args.unit ?? "C");

  const followup = await client.responses.create({
    model: "gpt-5",
    input: [
      { role: "system", content: "You can call tools." },
      { role: "user", content: "What's the weather in Kyoto right now?" },
      { role: "tool", name: "get_weather", content: JSON.stringify(weather) }
    ]
  });

  console.log(followup.output_text);
}
```

**Best practices**
- Keep function names intuitive; **validate arguments** on your side.  
- Return **machine‑readable** tool results (JSON) rather than prose.  
- For side effects (creating tickets, orders, etc.) generate **idempotency keys**.

---

## 5) Streaming

Stream tokens to the client for faster perceived latency. Parse **event‑wise** (don’t concatenate blindly if you expect tool calls / JSON).

**Node streaming (ReadableStream):**
```ts
const stream = await client.responses.stream({
  model: "gpt-5-mini",
  input: "List 5 indoor plants."
});

for await (const event of stream) {
  if (event.type === "response.output_text.delta") process.stdout.write(event.delta);
  if (event.type === "response.error") console.error(event.error);
}
```

**cURL (SSE):**
```bash
curl -N https://api.openai.com/v1/responses   -H "Authorization: Bearer $OPENAI_API_KEY"   -H "Content-Type: application/json"   -d '{"model":"gpt-5-mini","input":"Stream an answer","stream":true}'
```

---

## 6) Images & Multimodal (in Responses)

Images can be **inputs** (vision) and **outputs** (generation/edit/edit-mask) within one conversation.

**Image generation inline:**
```ts
const res = await client.responses.create({
  model: "gpt-5",
  input: "Generate a simple icon: a beacon shape with a subtle spark."
  // For full control, use an image tool within Responses per your org's access.
});
```

**Vision input (describe image):**
```ts
const res = await client.responses.create({
  model: "gpt-5-mini",
  input: [
    { role: "user", content: [
      { type: "input_text", text: "Describe this diagram." },
      { type: "input_image", image_url: "https://example.com/diagram.png" }
    ]}
  ]
});
```

---

## 7) Realtime API (voice / low‑latency)

For live voice or sub‑second interactivity, use **Realtime API** over WebRTC/WebSocket.  
- Send/receive audio + text frames, handle function calls in‑band.  
- Render partials as you receive **server events**.  
- Consider echo cancellation and VAD on the client.

---

## 8) Error Handling, Retries, Timeouts

**Do:**
- Timeouts: client‑side (e.g., 30s) and server‑side (where available).  
- Retries: exponential backoff + jitter; cap attempts (e.g., 3).  
- Detect & surface **rate‑limit** responses; degrade gracefully (queue, alternate model).  
- Validate structured outputs (AJV/Zod) and fallback to a re‑ask with the **same schema** if invalid.  
- Use **idempotency keys** for operations with side effects.

**Don’t:**
- Don’t log prompts/responses with secrets.  
- Don’t assume non‑streaming output is a single text blob (there may be tool calls or parts).

---

## 9) Security & Data Controls

- Prefer **server‑side** API calls; never expose the API key to browsers.  
- Redact PII/secrets before sending to the API when feasible.  
- Configure org **data retention/residency** and training opt‑out as required.  
- Use **content filters/guardrails** appropriate to your app and audience.  
- Consider **prompt watermarking** (internal IDs) for traceability.

---

## 10) REST vs SDK Output Handling

### Node SDK: canonical extraction
```ts
const r = await client.responses.create({ model: "gpt-5", input: "Say hi." });
// For plain text:
console.log(r.output_text);
// For fine-grained parts:
for (const item of r.output ?? []) {
  for (const c of item.content ?? []) {
    // c.type can be "output_text", "tool_call", "image", etc.
  }
}
```

### REST (generic JSON)
- The Responses API returns a **structured envelope**. Do not assume `choices[0].message.content` like legacy Chat Completions.
- Prefer a small parser that:
  - reads `output` array,
  - concatenates `output_text` deltas if streaming,
  - branches on `tool_call` items.

---

## 11) Cost & Latency Hygiene

- Choose an appropriate model tier per route; don’t use a flagship model for trivial tasks.  
- Use **few-shot via references** (files/context tools) instead of dumping long exemplars inline.  
- Cache intermediate results (e.g., embeddings/search hits) when possible.  
- Cap `max_output_tokens` and truncate inputs.  
- For web/file search tools, scope the query and request **citations** explicitly.

---

## 12) Testing & Eval

- Unit tests for: prompt builders, tool argument validators, and parsers.  
- Golden prompts + expected structured JSON for regression.  
- Shadow ship: log model deltas (without PII) vs deterministic fallbacks.  
- Add human review for high‑risk actions.

---

## 13) Minimal End‑to‑End Examples

### A) Node.js (TypeScript) — structured + streaming
```ts
import OpenAI from "openai";
const client = new OpenAI();

const stream = await client.responses.stream({
  model: "gpt-5-mini",
  input: "Give 3 snack ideas as JSON with fields: name, calories.",
  response_format: {
    type: "json_schema",
    json_schema: {
      name: "Snacks",
      schema: {
        type: "object",
        properties: {
          items: { type: "array", items: { type: "object", properties: {
            name: { type: "string" }, calories: { type: "number" }
          }, required: ["name","calories"], additionalProperties: false } }
        },
        required: ["items"], additionalProperties: false
      },
      strict: true
    }
  },
  stream: true
});

let jsonText = "";
for await (const ev of stream) {
  if (ev.type === "response.output_text.delta") jsonText += ev.delta;
  if (ev.type === "response.completed") break;
}
const data = JSON.parse(jsonText);
console.log(data);
```

### B) Python — simple text
```py
from openai import OpenAI
client = OpenAI()

resp = client.responses.create(
    model="gpt-5-mini",
    input="Write a haiku about refactoring."
)
print(resp.output_text)
```

---

## 14) Migration Pointers

- If you have **Chat Completions** code: port to **Responses**; map `messages` -> `input`, use `output_text` or parse `output` items.  
- If you used **Assistants**: use **Responses** + your own lightweight state; or use Conversations API if you need hosted state (when available to you).  
- Validate parity in staging; run A/B to confirm quality/cost wins.

---

## 15) Checklists

**New endpoint checklist**
- [ ] Pick model & caps (`max_output_tokens`)
- [ ] System prompt reviewed & versioned
- [ ] JSON schema (if needed) + validator wired
- [ ] Tool definitions + argument validators
- [ ] Streaming parser with event types
- [ ] Retries + timeouts + idempotency
- [ ] Redaction + logs scrubbed
- [ ] Metrics: latency, cost, failure rate
- [ ] Evals & guardrails

**Prod readiness**
- [ ] Canary route w/ rollback
- [ ] Budget alerts
- [ ] Prompt & schema versioning
- [ ] Data controls configured
- [ ] Incident runbooks

---

## References (public docs to consult)
- Responses API
  - https://platform.openai.com/docs/api-reference/responses/create
- Structured outputs
  - https://platform.openai.com/docs/guides/structured-output/overview
- Realtime API
  - https://platform.openai.com/docs/api-reference/realtime