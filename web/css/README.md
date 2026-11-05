# CSS

## Concise introductory examples

[examples.css](./examples.css) introduces custom properties, selector lists, grid, CSS value functions, focus states, and media queries. CSS has no general-purpose functions, collections, or loops.

Use a modern browser. In this directory, create a local HTML host containing the following markup and open that host in the browser. Resize the window, hover a link, and press Tab to inspect focus styling. No build command is needed.

```html
<!doctype html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CSS reading card</title>
<link rel="stylesheet" href="./examples.css">
<article class="reading-card">
  <h2>Reading list</h2>
  <ul>
    <li data-read="true"><a href="#web">Web basics</a></li>
    <li><a href="#scripts">Useful scripts</a></li>
  </ul>
</article>
</html>
```

CSS styles the presentation of web documents. CSS describes presentation; its conditionals and custom properties differ from general-purpose programming constructs.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing CSS](#executing-css)
- [Example Learning Path](#example-learning-path)
- [Quick Reference](#quick-reference)
- [Available Learning Resources](#available-learning-resources)
- [Available Certificates & Certifications](#available-certificates--certifications)
- [Helpful Developer Tools](#helpful-developer-tools)
- [Simple Project Examples](#simple-project-examples)
- [Simple Mistakes To Avoid](#simple-mistakes-to-avoid)

## Understanding the Ecosystem

| Term | What it means | Where to learn more |
| --- | --- | --- |
| CSS | A declarative styling language based on selectors, the cascade, inheritance, and layout. | [CSS documentation](https://developer.mozilla.org/docs/Web/CSS) |
| Cascade | Origin, importance, specificity, layers, and order determine which declaration applies. | [Reference](https://developer.mozilla.org/docs/Web/CSS) |
| Layout | Normal flow, flexbox, and grid arrange document boxes. | [Reference](https://developer.mozilla.org/docs/Web/CSS) |

## Executing CSS

### In this repository

Use: Add `style.css` to an HTML page containing an element with `class="hello"`.

Link style.css from an HTML page, then add an element with class="hello". Use browser developer tools to inspect applied rules.

Open [style.css](./style.css) for the 11 annotated topic sections. The 11 topics are expressed through CSS concepts such as custom properties, conditional rules, selector scope, and rendering.

The stylesheet is browser code. CSS has no standalone command-line execution step and does not define a general-purpose thread or allocation API.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Custom properties hold token values resolved through the cascade; they are not typed local variables. | Change a value and predict its type and result. |
| 2. Decisions and execution | Media and feature queries conditionally apply styles; CSS has no general-purpose loop. A rule groups declarations for matched elements; it is not a function call or lexical scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | Selector lists group targets; grid tracks and value lists are not runtime collections. States and overrides change computed values; declarations are resolved by cascade rules. | Handle empty, single-item, and repeated input. |
| 4. Organization | Naming conventions reduce collisions; selectors do not create private class members. Reusable classes compose layout and presentation without duplicating whole components. | Separate one responsibility into a named component. |
| 5. Reliability | Use block comments for both short and multi-line documentation. The browser manages rendering resources; hiding content is not explicit deallocation. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Animations are scheduled by the browser; they do not promise a dedicated CPU thread. | Explain what can run independently and what must wait. |
| 7. Applied practice | Containment may limit layout and paint work but can change layout behavior; profile first. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `--accent-color: #2457a7;` | Custom properties hold token values resolved through the cascade; they are not typed local variables. |
| Control Flow Operations | `@media (min-width: 48rem) { ... }` | Media and feature queries conditionally apply styles; CSS has no general-purpose loop. |
| Execution Blocks | `.example-card { padding: 1rem; }` | A rule groups declarations for matched elements; it is not a function call or lexical scope. |
| Code Health & Documentation | `/* comment */` | Use block comments for both short and multi-line documentation. |
| Built-In Collections | `.example-card, .example-panel { ... }` | Selector lists group targets; grid tracks and value lists are not runtime collections. |
| Data Mutability | `.example-button:hover { --button-color: #17396e; }` | States and overrides change computed values; declarations are resolved by cascade rules. |
| Access & Encapsulation | `.profile-card__title { ... }` | Naming conventions reduce collisions; selectors do not create private class members. |
| Design Paradigms & Patterns | `.stack > * + * { margin-block-start: 1rem; }` | Reusable classes compose layout and presentation without duplicating whole components. |
| Memory Management | `display: none;` | The browser manages rendering resources; hiding content is not explicit deallocation. |
| Concurrency & Parallelism | `@keyframes example-fade { from { opacity: 0; } to { opacity: 1; } }` | Animations are scheduled by the browser; they do not promise a dedicated CPU thread. |
| Performance Optimization | `contain: layout paint;` | Containment may limit layout and paint work but can change layout behavior; profile first. |

The code above is a compact reminder; use [style.css](./style.css) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [CSS documentation](https://developer.mozilla.org/docs/Web/CSS) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [MDN Learn](https://developer.mozilla.org/en-US/docs/Learn_web_development) | Learn styling, layout, and responsive design. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

The table distinguishes language assessments, course-completion certificates, and related platform credentials. A platform credential can involve this language without being a language-only certification.

| Provider and credential | Level / scope | Assessment or completion requirement | Cost model |
| --- | --- | --- | --- |
| [freeCodeCamp Responsive Web Design](https://www.freecodecamp.org/learn/responsive-web-design-v9) | HTML and CSS together | Follow the current projects and final assessment requirements. | Free curriculum and certification. |

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Browser DevTools](https://developer.chrome.com/docs/devtools/) | Inspect computed styles, layout, and cascade. | When developing and checking examples for this language. |
| [W3C CSS Validator](https://jigsaw.w3.org/css-validator/) | Check stylesheet syntax against supported profiles. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Responsive profile card | Box model, typography, layout | Works at narrow and wide viewport sizes. |
| Accessible form styling | Focus indicators, labels, contrast | Keyboard focus remains clearly visible. |
| Grid gallery | Grid, responsive sizing | Cards fit without horizontal overflow. |

## Simple Mistakes To Avoid

- CSS comments use /* ... */; // is not a CSS comment.
- Custom properties participate in the cascade and may inherit.
- More specificity can make overrides harder; inspect the cascade before adding !important.
- display: none hides an element's box but does not remove its DOM node.
- Consider reduced-motion preferences when adding animations.
