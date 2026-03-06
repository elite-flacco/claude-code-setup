---
name: frontend-rules
description: Rules and constraints for all frontend development in Next.js/React/Tailwind projects. INVOKE THIS SKILL before writing or modifying any UI file, component, CSS, or Tailwind class. Also invoke when scaffolding a new frontend project or reviewing existing UI code for compliance.
---

# Frontend Rules

This skill is **rigid** — follow every rule exactly. Do not adapt or skip.

## 1. Design System Setup (Non-Negotiable Sequence)

**New projects:** Run `/cc-setup-design-system-tw-v4` as a **standalone step before writing any UI code or dispatching any UI subagent.** Subagents receive instructions, not skill invocations — globals.css with semantic tokens must exist before the UI prompt is written.

**Existing projects:** Read `globals.css` before touching anything. Check what tokens and `@layer components` classes already exist. Never add new raw values — add a token first.

## 2. Tailwind Color Rules

- **Never** use Tailwind's default color palette directly: `text-gray-500`, `bg-blue-200`, `border-red-300`, etc.
- **Always** use semantic tokens: `text-muted-foreground`, `bg-card`, `border-border`, etc.
- If a semantic token doesn't exist for the use case, add it to `:root` in `globals.css` and map it in `@theme inline` first.

## 3. No Arbitrary Values

- **Never** use Tailwind arbitrary values: `text-[32px]`, `mt-[22px]`, `text-[#333]`, `w-[420px]`
- If a value isn't in the design system, add it as a token. Then use the token.

## 4. No Inline Styles

- **Never** use `style={{ }}` on any element.
- Always use Tailwind utility classes or `@layer components` classes referencing design tokens.

## 5. No className on @layer base Elements

- `@layer base` styles h1–h6, p, a, hr, code, etc. automatically.
- **Never** add `className` to these elements to re-apply typography or color.
- Use `.h1`–`.h6` aliases on non-heading elements when you need heading styles.
- For UI chrome that needs non-standard sizing (e.g. a compact app header), use `<p>` or `<div>` with a named `@layer components` class — not a styled `<h1>`.

## 6. No dark: Variants

- **Never** use `dark:text-white`, `dark:bg-gray-900`, etc.
- Dark mode is handled automatically via CSS variable swapping on `.dark`. Semantic tokens already flip. Using `dark:` utilities fights the design system.

## 7. Component Class Extraction

- **Check `@layer components` first** before writing inline utility combinations. If `.btn`, `.card`, `.badge` etc. exist, use them.
- **Extract to `@layer components`** when a utility combination repeats 3+ times across the codebase. One-off patterns stay inline.

## 8. TypeScript

- **Always** use TypeScript for Next.js apps. Never scaffold with `--js` or plain JavaScript.
- Prop interfaces for every component. `Record<string, T>` for dynamic key maps.

## Quick Self-Check Before Committing

- [ ] No `text-{color}-{shade}` or `bg-{color}-{shade}` from Tailwind's default palette
- [ ] No `text-[...]`, `mt-[...]`, or any other arbitrary value
- [ ] No `style={{ }}` anywhere
- [ ] No `className` on h1–h6, p, or other `@layer base` elements
- [ ] No `dark:` variants
- [ ] Repeated patterns extracted to `@layer components`
- [ ] TypeScript throughout
