# Set Up Tailwind v4 Design System

**Goal**  
Set up a maintainable design system in **Tailwind CSS v4** using CSS variables for design tokens and `@theme inline` for Tailwind utilities.  
Supports light/dark mode and runtime theming (no rebuild). Includes base typography and component classes for buttons, cards, inputs, badges, etc., plus a quick theme toggle.

## Instructions

1) Install Tailwind v4 + PostCSS deps if needed
2) Create PostCSS config (skip if you already have it)
```js
// postcss.config.js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
```

3) Remove any existing `tailwind.config.*` (unless you need legacy plugins). v4 uses the inline theme approach.
4) Create a global stylesheet at `src/styles/index.css` with the content below.
5) Import the stylesheet in your app entry

## Constraints

- Create placeholders for alternative font families (system default now, easy to swap later).
- Provide base typography for headings/body and component classes for buttons, cards, inputs, selects, textareas, labels, badges.
- No inline styles in components; only Tailwind utilities and the classes defined below.

## Details & Acceptance Criteria:

- Token model via CSS vars (HSL for colors):
    - --background, --foreground
    - --muted, --muted-foreground
    - --primary, --primary-foreground
    - --secondary, --secondary-foreground
    - --accent, --accent-foreground
    - --destructive, --destructive-foreground
    - --success, --success-foreground
    - --warning, --warning-foreground
    - --border, --input, --ring
    - Fonts: --font-sans, --font-serif, --font-mono (default to system fonts; leave TODO comments for swapping)
    - Spacing scale delegated to Tailwind; can add aliases if needed.

- Extend Tailwind theme to map colors to these vars, e.g. primary.DEFAULT: 'hsl(var(--primary))'.
- Component classes in @layer base (typography reset) and @layer components:
    - .btn (base), .btn-primary, .btn-secondary, .btn-ghost, .btn-destructive, .btn-outline
    - .card, .card-header, .card-body, .card-footer
    - .input, .textarea, .select, .label, .badge

- Respect prefers-reduced-motion for transitions.
- No raw hex/rgba anywhere—only hsl(var(--token)) and Tailwind spacing/typography.
- Include a short “How to change fonts/colors later” section as code comments.

## Example

1. `src/styles/index.css`

```css
@import "tailwindcss";

/* ============================================================
   1) Runtime Design Tokens (CSS variables)
   - Store raw HSL components (e.g., 266 86% 52%)
   - Wrap with hsl(var(--token) / <alpha?>) when using
   ============================================================ */
@layer base {
  :root {
    /* Background & foreground */
    --background: 0 0% 100%;
    --foreground: 222 47% 11%;

    /* Muted */
    --muted: 210 20% 96%;
    --muted-foreground: 215 16% 47%;

    /* Brand */
    --primary: 266 86% 52%;
    --primary-foreground: 0 0% 100%;

    --secondary: 24 92% 52%;
    --secondary-foreground: 0 0% 100%;

    --accent: 206 100% 50%;
    --accent-foreground: 0 0% 100%;

    /* Danger */
    --destructive: 0 84% 60%;
    --destructive-foreground: 0 0% 100%;

    /* Success */
    --success: 145 100% 50%;
    --success-foreground: 0 0% 100%;

    /* Warning */
    --warning: 26 100% 50%;
    --warning-foreground: 0 0% 100%;

    /* UI */
    --border: 214 32% 91%;
    --input: 214 32% 91%;
    --ring: 266 86% 52%;

    /* Radii */
    --radius-xs: 0.125rem;
    --radius-sm: 0.25rem;
    --radius-md: 0.5rem;
    --radius-lg: 0.75rem;
    --radius-xl: 1rem;
    --radius-2xl: 1.25rem;
    --radius-full: 9999px;

    /* Fonts (TODO: swap with brand fonts later) */
    --font-sans: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, "Noto Sans";
    --font-serif: ui-serif, Georgia, Cambria, "Times New Roman", Times, serif;
    --font-mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas,
      "Liberation Mono";
  }

  .dark {
    --background: 222 47% 11%;
    --foreground: 210 20% 98%;

    --muted: 223 10% 20%;
    --muted-foreground: 215 16% 70%;

    --primary: 266 86% 60%;
    --primary-foreground: 222 47% 11%;

    --secondary: 24 92% 58%;
    --secondary-foreground: 222 47% 11%;

    --accent: 206 100% 56%;
    --accent-foreground: 222 47% 11%;

    --destructive: 0 84% 66%;
    --destructive-foreground: 222 47% 11%;

    --success: 145 100% 56%;
    --success-foreground: 222 47% 11%;

    --warning: 26 100% 56%;
    --warning-foreground: 222 47% 11%;

    --border: 223 10% 25%;
    --input: 223 10% 25%;
    --ring: 266 86% 60%;
  }
}

/* ============================================================
   2) Tailwind Theme Mapping (v4 inline theme)
   - Expose theme variables that Tailwind uses to generate utilities
   - Map them to your runtime tokens above
   ============================================================ */
@theme inline {
  /* Colors */
  --color-background: hsl(var(--background));
  --color-foreground: hsl(var(--foreground));

  --color-muted: hsl(var(--muted));
  --color-muted-foreground: hsl(var(--muted-foreground));

  --color-primary: hsl(var(--primary));
  --color-primary-foreground: hsl(var(--primary-foreground));

  --color-secondary: hsl(var(--secondary));
  --color-secondary-foreground: hsl(var(--secondary-foreground));

  --color-accent: hsl(var(--accent));
  --color-accent-foreground: hsl(var(--accent-foreground));

  --color-destructive: hsl(var(--destructive));
  --color-destructive-foreground: hsl(var(--destructive-foreground));

  --color-success: hsl(var(--success));
  --color-success-foreground: hsl(var(--success-foreground));

  --color-warning: hsl(var(--warning));
  --color-warning-foreground: hsl(var(--warning-foreground));

  --color-border: hsl(var(--border));
  --color-input: hsl(var(--input));
  --color-ring: hsl(var(--ring));

  /* Radii */
  --radius-xs: var(--radius-xs);
  --radius-sm: var(--radius-sm);
  --radius-md: var(--radius-md);
  --radius-lg: var(--radius-lg);
  --radius-xl: var(--radius-xl);
  --radius-2xl: var(--radius-2xl);
  --radius-full: var(--radius-full);

  /* Fonts */
  --font-sans: var(--font-sans);
  --font-serif: var(--font-serif);
  --font-mono: var(--font-mono);
}

/* ============================================================
   3) Base: Normalize + Typography
   ============================================================ */
@layer base {
  html,
  body {
    @apply bg-background text-foreground font-sans antialiased;
  }
  h1 {
    @apply scroll-m-20 text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight leading-tight;
  }
  h2 {
    @apply scroll-m-20 text-2xl sm:text-3xl md:text-4xl font-semibold tracking-tight leading-snug;
  }
  h3 {
    @apply scroll-m-20 text-xl sm:text-2xl md:text-3xl font-semibold leading-snug;
  }
  h4 {
    @apply scroll-m-20 text-lg sm:text-xl md:text-2xl font-medium leading-snug;
  }
  h5 {
    @apply scroll-m-20 text-base sm:text-lg font-medium leading-normal;
  }
  h6 {
    @apply scroll-m-20 text-sm sm:text-base font-medium leading-normal;
  }
  p {
    @apply text-xs sm:text-sm md:text-base leading-relaxed text-muted-foreground;
  }
  span {
    @apply text-xs text-muted-foreground;
  }
  a {
    @apply underline-offset-4 transition-colors duration-150 hover:underline hover:text-primary;
  }
  hr {
    @apply border-border;
  }

  /* Make native buttons clickable by default */
  button,
  [type="button"],
  [type="submit"],
  [role="button"] {
    @apply cursor-pointer;
  }
}

/* ============================================================
   4) Components (with hover/active states)
   ============================================================ */
@layer components {
  /* Buttons */
  .btn {
    @apply cursor-pointer inline-flex items-center justify-center gap-2 whitespace-nowrap
           rounded-md px-4 py-2 text-sm font-medium
           transition-colors duration-150
           focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring
           disabled:opacity-50 disabled:cursor-not-allowed;
  }
  .btn-primary {
    @apply bg-primary text-primary-foreground hover:bg-primary/90 active:bg-primary/85;
  }
  .btn-secondary {
    @apply bg-secondary text-secondary-foreground hover:bg-secondary/90 active:bg-secondary/85;
  }
  .btn-accent {
    @apply bg-accent text-accent-foreground hover:bg-accent/90 active:bg-accent/85;
  }
  .btn-destructive {
    @apply bg-destructive text-destructive-foreground hover:bg-destructive/90 active:bg-destructive/85;
  }
  .btn-ghost {
    @apply bg-transparent text-foreground hover:bg-muted/70 active:bg-muted;
  }
  .btn-outline {
    @apply border border-border bg-transparent text-foreground hover:bg-muted active:bg-muted;
  }
  .btn-sm {
    @apply h-8 px-3 text-xs;
  }
  .btn-lg {
    @apply h-11 px-6 text-base;
  }

  /* Card */
  .card {
    @apply p-4 bg-background text-foreground border border-border rounded-lg shadow-md;
  }
  .card-header {
    @apply p-4 border-b border-border;
  }
  .card-body {
    @apply p-4;
  }
  .card-footer {
    @apply p-4 border-t border-border;
  }
  .card.hoverable {
    @apply transition-shadow transition-colors hover:shadow-lg hover:border-border/80;
  }

  /* Form controls */
  .label {
    @apply mb-1 block text-sm font-medium text-foreground;
  }
  .input,
  .textarea,
  .select {
    @apply w-full rounded-md border border-input bg-background text-foreground
           px-3 py-2 text-sm shadow-sm transition-colors
           focus-visible:outline-none focus-visible:ring-0 focus-visible:ring-ring
           placeholder:text-muted-foreground;
  }
  .input:hover,
  .textarea:hover,
  .select:hover {
    @apply border-foreground/20;
  }
  .input {
    @apply h-10;
  }
  .textarea {
    @apply min-h-[120px] resize-y;
  }
  .select {
    @apply h-10;
  }

  /* Badge */
  .badge {
    @apply inline-flex items-center rounded-full px-2.5 py-1 text-xs font-medium bg-muted text-muted-foreground;
  }
}

/* ============================================================
   5) Utilities (optional)
   ============================================================ */
@layer utilities {
  .elev-0 {
    box-shadow: none;
  }
  .elev-1 {
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.06);
  }
  .elev-2 {
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
  }
}

/* Accessibility: reduced motion */
@media (prefers-reduced-motion: reduce) {
  * {
    animation: none !important;
    transition: none !important;
  }
}
```


2. Tiny theme toggle (Optional, drop into any React/JS file or inline)
If specified with `--toggle`, adds a tiny theme toggle button.

```html
<!-- Add a toggle button somewhere -->
<button id="themeToggle" class="btn btn-outline">Toggle Theme</button>

<script>
  const root = document.documentElement;
  const btn = document.getElementById('themeToggle');
  const KEY = 'prefers-theme'; // 'light' | 'dark'

  function applyTheme(mode) {
    if (mode === 'dark') root.classList.add('dark');
    else root.classList.remove('dark');
  }

  // init from storage or media
  const saved = localStorage.getItem(KEY);
  const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  applyTheme(saved || (prefersDark ? 'dark' : 'light'));

  btn?.addEventListener('click', () => {
    const isDark = root.classList.toggle('dark');
    localStorage.setItem(KEY, isDark ? 'dark' : 'light');
  });
</script>
```

