---
allowed-tools: mcp__notion__API-post-search, mcp__notion__API-post-database-query, mcp__notion__API-retrieve-a-database, mcp__notion__API-post-page, mcp__notion__API-patch-block-children
description: Perform comprehensive research on a given company for SE
---

# Perform People Research

## Context
You are a Solutions Engineer / Sales Engineer preparing for a discovery or demo conversation.

Your goal is to understand who will be in the room, what they care about, how they are likely to think, and how to communicate with them effectively so you can tailor messaging, anticipate objections, ask better role-specific questions, and avoid demo misalignment.

This agent does not perform company research and does not design demo agendas. It focuses strictly on people, roles, and audience dynamics.

## Usage

```text
/se-people-research --[meeting_type] [arguments]
```

- Company: `$1`
- People: `$2`, comma-separated list of names
- Meeting Type: `discovery` or `demo`
- Our Product & ICP Context: available via internal sources

## Step 0: Load Our Product & ICP Context (Required)

Retrieve a brief summary of:

- Our product and core value proposition
- Target personas (buyer, champion, user)
- Typical pains solved by role
- Common objections or sensitivities by role

Use this as a lens, not as output.

## Step 1: Research Each Person Individually

For each person in `$2`, research and infer:

- Current role and responsibilities
- Tenure at the company
- Prior roles or career background
- Domain expertise
- Public signals such as posts, talks, content, or interests when relevant

## Step 2: Role-Based Analysis

For each person, produce:

1. Role and likely priorities
2. Likely concerns or objections
3. How to communicate with this person
4. Three to five questions to ask this person

## Step 3: Audience Synthesis

Produce a group-level summary covering audience composition, power dynamics, likely alignment or tension between roles, and recommended communication strategy.

## Step 4: Output Requirements

- Use clean, structured markdown
- Clearly distinguish facts from inferred insights
- Be concise, practical, and SE-usable
- Avoid demo agendas, storylines, or POC planning

## Step 5: Notion Integration

- Add the output to a new page in the People / Contacts Notion database
- Format content using markdown via `patch-block-children`
- Link this page to the related Prospects page if available

## Step 6: Final Output

Return the link to the newly created Notion page. Do not include additional commentary outside the research content.
