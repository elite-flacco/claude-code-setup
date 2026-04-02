---
name: html-to-email
description: Convert an HTML file into email-client-safe HTML. Use when the user provides an HTML file path and wants it transformed into a version that renders correctly across email clients (Outlook desktop/mobile, Gmail desktop/mobile, Apple Mail, Yahoo). Handles layout conversion to tables, CSS inlining, dark mode support, Outlook conditionals, and image fixes. Triggers on requests like "make this email safe", "convert to email HTML", "email-compatible HTML".
---

# HTML to Email Converter

Convert a source HTML file into email-client-safe HTML, outputting a new file.

## Process

1. Read the source HTML file
2. Read [references/email-html-rules.md](references/email-html-rules.md) for the full compatibility ruleset
3. Analyze the source HTML — identify what needs transformation:
   - Layout method (flexbox/grid/div → tables)
   - CSS location (external/`<style>` → inline)
   - Unsupported properties to remove or replace
   - Images missing attributes
   - Missing email boilerplate (DOCTYPE, meta tags, MSO conditionals)
4. Transform the HTML applying all rules below
5. Write the output to `{original-name}-email.html` in the same directory

## Transformation Checklist

### Structure
- Wrap in XHTML Transitional DOCTYPE with MSO XML namespaces
- Add `<meta>` tags: charset, viewport, color-scheme, format-detection
- Add CSS reset block in `<head>` (progressive enhancement)
- Convert all layout to nested `<table role="presentation">` with `cellpadding="0" cellspacing="0" border="0"`
- Wrap content in 100%-width outer table → centered 600px inner table
- Set `background-color` inline on the outer wrapper table (not just on `<body>`) — Outlook and copy-paste workflows strip body-level styles
- Replace all `margin` spacing with `padding` on `<td>` elements
- Replace `<br>`-based spacing with padded `<td>` elements

### Styles
- Inline ALL CSS onto each element's `style` attribute
- Keep a `<style>` block in `<head>` ONLY for dark mode media queries and resets
- Replace unsupported properties (flexbox, grid, position, float, CSS variables, calc) with table-based equivalents
- Use longhand CSS properties where possible
- Add `mso-table-lspace:0pt; mso-table-rspace:0pt` on all tables
- Add `mso-line-height-rule:exactly` alongside any `line-height`

### Dark Mode
- Add `color-scheme` and `supported-color-schemes` meta tags
- Add class attributes to elements needing dark mode overrides
- Add `@media (prefers-color-scheme: dark)` rules with `!important`
- Add Outlook-specific `[data-ogsc]` / `[data-ogsb]` selectors
- Ensure transparent PNGs have appropriate dark-mode treatment

### Outlook
- Add MSO conditional wrappers around the container table for fixed-width fallback
- Add MSO `<style>` block for Outlook-specific fixes
- Convert buttons to bulletproof table-based buttons; add VML version for Outlook rounded corners if the source uses `border-radius`
- Replace any `<div>` background images with VML

### Images
- Set `width`, `height`, `alt`, `border="0"`, `style="display:block"` on every `<img>`
- Replace SVG with a note/comment that a PNG/JPG alternative is needed
- Ensure all `src` URLs are absolute

### Typography
- Replace web fonts with safe font stacks as fallback
- Keep web font `<link>` as progressive enhancement if present
- Set all `font-size` in `px`
- Enforce minimum 13px font size

### Links
- Set `color`, `text-decoration` inline on all `<a>` tags
- Add `target="_blank"` to all links

### Final Checks
- Estimate total HTML size — warn if approaching Gmail's 102KB clip threshold
- Validate no unsupported CSS properties remain
- Confirm all layout is table-based
- Add a comment at the top: `<!-- Email-safe HTML generated from {source-file} -->`
