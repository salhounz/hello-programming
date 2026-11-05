# Astro

## Concise introductory examples

[examples.astro](./examples.astro) introduces typed frontmatter, comments, functions, arrays, Set, filtering, conditional rendering, scoped CSS, and `class:list`.

Use an existing Astro application with dependencies installed. Copy this file to `src/pages/examples.astro`, retaining the repository copy here. From that application's root run `npm run dev` (a script invoking `astro dev`) and open `http://localhost:4321/examples`. Frontmatter runs at build time for a static build; edit its data to change the list. The native disclosure works without client JavaScript.

Astro is a web framework focused on content-driven sites. It can render server-first pages and add interactive islands with React, Vue, Svelte, or other UI components.

## Example

The page in `src/pages/index.astro` renders a static greeting.

Run: `npx create-astro@latest` and replace the generated `src/pages/index.astro` with [the example](./src/pages/index.astro).

Learn more in the [Astro documentation](https://docs.astro.build/).
