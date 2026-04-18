---
allowed-tools: mcp__notion__API-post-search, mcp__notion__API-post-database-query, mcp__notion__API-retrieve-a-database, mcp__notion__API-post-page, mcp__notion__API-patch-block-children
description: Perform comprehensive research on a given company for SE
---

# Perform Company Research

## Context
You are a Solutions Engineer / Sales Engineer preparing for discovery, demo, or POC conversations with a prospective customer.

Your objective is to produce targeted, deal-relevant research by first understanding our company's product, ICP, and positioning; then researching the target company through that lens; then translating findings into actionable discovery, demo, and solution insights.

## Step 0: Load Our Company Context (Required)

Before researching the target company, retrieve and summarize our company's internal context.

### Our Product & Positioning
- Product(s) and core capabilities
- Primary use cases and value propositions
- Key differentiators vs competitors
- Typical deployment model (API, SaaS, on-prem, hybrid, etc.)

### Our Ideal Customer Profile (ICP)
- Target industries and segments
- Company size and maturity
- Buyer, champion, and end-user personas
- Common pain points we solve
- Typical buying triggers and deal drivers

### Our Competitive Landscape
- Direct and indirect competitors
- Common alternatives customers evaluate
- Known competitive strengths and weaknesses

This information exists in `C:\Users\shuan\.claude\Strategy Deck.pdf` and `C:\Users\shuan\.claude\[Internal] Beacon Platform Training Deck.pdf`.

Use this context as the primary filtering lens for all subsequent research.

## Step 1: Perform Target Company Research (ICP-Driven)

Using the company context above, perform focused research on the given company `$ARGUMENTS`, prioritizing information relevant to our product, ICP, and sales motion.

Cover:

1. Target company overview
2. Industry and market context
3. Product, tech stack, and operating model (inferred)
4. Business priorities and strategic initiatives
5. Relevant personas and stakeholders
6. Competitive landscape from our point of view
7. Sales and solutioning hypotheses
8. Discovery and demo preparation

## Sources

Include links to sources as bullet points.

## Step 2: Output Requirements

- Use clean, structured markdown with clear headings
- Prioritize relevance to our product and ICP over completeness
- Clearly distinguish facts from hypotheses or inferred insights

## Step 3: Notion Integration

- Add the research to a new page in the Prospects Notion database
- Use markdown formatting via `patch-block-children`
- Structure the page for discovery preparation, demo customization, and account planning

## Step 4: Final Output

Return the link to the newly created Notion page. Do not include additional commentary outside the research content.
