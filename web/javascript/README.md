# JavaScript

## Concise introductory examples

[examples.js](./examples.js) introduces values, comments, functions, arrays, objects, iteration, filtering, Map, Set, optional chaining, immutable updates, and JSON error handling.

From this directory, run `node examples.js` with Node.js 18 or later. It prints a reading list and lookup/update results, needs no packages, and changes no files. It also works when pasted into a modern browser's developer console.

JavaScript is the programming language used to make web pages interactive, handle events, work with data, and communicate with APIs. It also runs outside the browser through environments such as Node.js, where it can power servers, command-line tools, and automation.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing JavaScript](#executing-javascript)
- [Example Learning Path](#example-learning-path)
- [Quick Reference](#quick-reference)
- [Available Learning Resources](#available-learning-resources)
- [Available Certificates & Certifications](#available-certificates--certifications)
- [Helpful Developer Tools](#helpful-developer-tools)
- [Simple Project Examples](#simple-project-examples)
- [Simple Mistakes To Avoid](#simple-mistakes-to-avoid)

## Understanding the Ecosystem

| Term | What it means | Where to learn more |
|---|---|---|
| JavaScript | The language: values, functions, objects, classes, modules, and asynchronous programming. | [MDN Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide) |
| ECMAScript | The standard that defines the core language. ES2015, also called ES6, introduced features such as `let`, `const`, classes, and modules. | [ECMAScript specification](https://tc39.es/ecma262/) |
| Browser APIs | Features supplied by the browser, including the DOM for interacting with a page. Their availability depends on the environment. | [MDN web development lessons](https://developer.mozilla.org/en-US/docs/Learn_web_development) |
| Node.js | A runtime for executing JavaScript outside the browser, with APIs for tasks such as file access and server development. | [Node.js introduction](https://nodejs.org/en/learn/getting-started/introduction-to-nodejs) |
| npm | A package registry and command-line tool for installing dependencies and running project scripts. | [About npm](https://docs.npmjs.com/about-npm/) |

JavaScript is dynamically typed: values have types, and a variable can hold values of different types over time. It supports procedural, functional, and object-oriented programming. Promises and `async`/`await` help coordinate asynchronous work; they do not automatically run CPU-heavy code on additional threads.

## Executing JavaScript

### In this repository

Install a supported **LTS** release from the [Node.js download page](https://nodejs.org/en/download). Open a terminal in this directory, then run:

Run: `node hello.js`

```sh
node --version
node --check hello.js
node hello.js
```

`--check` validates syntax without executing the file. [hello.js](./hello.js) contains annotated examples; many results are explained in comments rather than printed. Add `console.log(...)` around a value you want to inspect. No packages are required for these examples.

### In a browser

Open the browser's developer tools and select **Console**, then try:

```js
const name = "World";
console.log(`Hello, ${name}!`);
```

For page interactions, use an HTML page with a script. For example, this self-contained page updates a counter when clicked:

```html
<!doctype html>
<html lang="en">
  <meta charset="utf-8">
  <title>JavaScript counter</title>
  <button type="button">Clicks: 0</button>
  <script>
    const button = document.querySelector("button");
    let clicks = 0;
    button.addEventListener("click", () => {
      clicks += 1;
      button.textContent = `Clicks: ${clicks}`;
    });
  </script>
</html>
```

## Example Learning Path

Use this suggested order to turn individual concepts into working projects. For browser projects, learn basic [HTML](../html/README.md) and [CSS](../css/README.md) alongside JavaScript.

| Stage | Focus | Practice milestone |
|---|---|---|
| 1. Foundations | Variables, primitive types, operators, comparisons, conditionals, and loops. | Write a unit converter that validates its input. |
| 2. Functions and data | Parameters, return values, scope, arrays, objects, `Map`, and `Set`. | Filter and summarize a list of expenses. |
| 3. Browser interactions | DOM selection, events, forms, and browser storage. | Build a task list with add, complete, delete, and save actions. |
| 4. Asynchronous work | Promises, `async`/`await`, requests, JSON, and error handling. | Build an API search page with loading, empty, and error states. |
| 5. Code organization | Modules, closures, classes, composition, and immutable updates. | Split a growing application into focused modules. |
| 6. Reliability | Debugging, tests, linting, accessibility, and profiling. | Test edge cases and fix a bug using a breakpoint. |
| 7. Specialization | Front-end frameworks, Node.js back ends, or TypeScript. | Extend a finished project toward the area you want to pursue. |

## Quick Reference

| Task | Example | Helpful detail |
|---|---|---|
| Declare values | `const limit = 10; let count = 0;` | Prefer `const`; use `let` when reassignment is needed. |
| Compare values | `count === limit` | Strict equality avoids implicit type conversion. |
| Supply a default | `name ?? "Guest"` | Uses the default for `null` or `undefined`; preserves `0`, `false`, and `""`. |
| Read optional data | `user?.address?.city` | Returns `undefined` if an intermediate value is nullish; the root variable must exist. |
| Build text | `` `Hello, ${name}!` `` | Template literals interpolate expressions. |
| Transform an array | `[1, 2, 3].map((n) => n * 2)` | Produces a new array: `[2, 4, 6]`. |
| Filter an array | `[1, 2, 3].filter((n) => n > 1)` | Keeps matching values: `[2, 3]`. |
| Find a value | `[1, 2, 3].find((n) => n > 1)` | Returns the first match, or `undefined`. |
| Summarize values | `[1, 2, 3].reduce((sum, n) => sum + n, 0)` | Produces `6`; the second argument supplies the initial accumulator. |
| Remove duplicates | `[...new Set([1, 1, 2])]` | Produces `[1, 2]`; objects are compared by identity. |
| Copy and update | `const updated = { ...user, active: true };` | Makes a shallow copy; nested objects remain shared. |
| Convert JSON | `JSON.parse('{"ready":true}')` | Parses text; `JSON.stringify(...)` converts supported values into JSON text. |
| Export a function | `export const double = (n) => n * 2;` | ES module syntax; import it from another module. |
| Import a function | `import { double } from "./math.js";` | Browser scripts need `type="module"`; Node.js can use `.mjs` or package configuration. |

For exact behavior, parameters, and compatibility, use the [MDN JavaScript Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference).

## Available Learning Resources

| Resource | Best for | Format and access |
|---|---|---|
| [freeCodeCamp JavaScript](https://www.freecodecamp.org/learn/javascript-v9) | A structured starting point with practice and a certification goal. | Free interactive curriculum with lessons, labs, workshops, quizzes, and certification requirements. |
| [MDN JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide) | Understanding the language and revisiting unfamiliar concepts. | Free explanations with examples; pair with the [reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference) for method details. |
| [javascript.info](https://javascript.info/) | Studying core JavaScript, objects, asynchronous code, and browser interactions in sequence. | Online tutorial organized by topic, with exercises. |
| [The Odin Project: Full Stack JavaScript](https://www.theodinproject.com/paths/full-stack-javascript) | Building larger projects and learning a broader web development workflow. | Free project-based curriculum; start with its Foundations path if you are new to web development. |
| [Eloquent JavaScript](https://eloquentjavascript.net/) | Learning through longer explanations, exercises, and substantial examples. | Book available to read online for free; print edition available separately. |
| [Exercism: JavaScript](https://exercism.org/tracks/javascript) | Practicing focused problems and improving fluency. | Free exercises and feedback, with community mentoring. |
| [Node.js Learn](https://nodejs.org/en/learn/getting-started/introduction-to-nodejs) | Moving into command-line tools, servers, and runtime-specific behavior. | Official tutorials and documentation. |

Choose one main curriculum and use the others when you need a different explanation or extra practice. A useful starting combination is freeCodeCamp for structure, MDN for reference, and a small project of your own after each topic.

## Available Certificates & Certifications

A course-completion certificate records completion of a provider's coursework. An exam-based certification also requires passing an assessment under that provider's rules. Compare the actual curriculum and assessment rather than relying on the credential's name alone.

| Provider and credential | Level / scope | Assessment or completion requirement | Cost model |
|---|---|---|---|
| [freeCodeCamp JavaScript Certification](https://www.freecodecamp.org/learn/javascript-v9) | JavaScript fundamentals and application skills. | Required certification projects followed by a final exam; see the [release and exam FAQ](https://www.freecodecamp.org/news/freecodecamps-new-javascript-certification-is-now-live/). | Free curriculum and certification. |
| [Codecademy Learn JavaScript](https://www.codecademy.com/learn/introduction-to-javascript) | Beginner language fundamentals. | Course-completion certificate; see the [certificate policy](https://help.codecademy.com/hc/en-us/articles/12943864221851-Codecademy-Certificates). | Free course access; completion certificate requires Plus or Pro. |
| [Meta Programming with JavaScript on Coursera](https://www.coursera.org/learn/programming-with-javascript) | Beginner JavaScript, objects, functions, and introductory testing. | Complete the course's graded assessments for a shareable course certificate. | Paid certificate experience; financial aid may be available. |
| [OpenEDG JS Institute: JSE](https://jsinstitute.org/jse-certification) | Entry-level JavaScript programming. | Pass the provider's JSE certification exam. | Paid exam; preparation and voucher options are listed by the provider. |
| [OpenEDG JS Institute: JSA](https://jsinstitute.org/jsa-certification) | Associate-level objects, functions, and asynchronous programming. | Pass the provider's JSA certification exam. | Paid exam; review its syllabus before choosing this level. |

The Odin Project emphasizes projects and [does not issue completion certificates](https://www.theodinproject.com/faq). You can still use its projects to demonstrate your skills. Pair any credential you pursue with finished work whose design, code, and tradeoffs you can explain.

Resource and credential information checked **October 30, 2026**. Follow the provider links for current requirements, access terms, and pricing. freeCodeCamp's current JavaScript track is linked above; older Algorithms and Data Structures tracks may appear as legacy curricula.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
|---|---|---|
| [Browser DevTools](https://developer.chrome.com/docs/devtools/javascript) | Inspect values, pause at breakpoints, step through functions, and investigate browser behavior. | As soon as you start browser exercises. |
| [Node.js](https://nodejs.org/en/download) | Run JavaScript locally outside a browser. | For the examples in this directory, command-line scripts, and server projects. |
| [npm](https://docs.npmjs.com/about-npm/) | Manage packages and project scripts. | When a project needs dependencies or repeatable development commands. |
| [ESLint](https://eslint.org/docs/latest/use/getting-started) | Find likely mistakes and enforce configured code rules. | When exercises grow into a maintained project. |
| [Prettier](https://prettier.io/docs/) | Apply consistent code formatting. | When you want formatting handled automatically. |
| [Vitest](https://vitest.dev/guide/) | Test functions and application behavior. | When you need repeatable checks for expected results and edge cases. |
| [Vite](https://vite.dev/guide/) | Provide a development server and production build workflow. | When browser projects need modules, assets, or a framework setup. |

Start with a runtime and debugger. Add other tools as your project needs them.

## Simple Project Examples

These are suggested practice projects, independent of any provider's certification requirements.

| Project | Skills to practice | A useful definition of done |
|---|---|---|
| Unit converter | Functions, arithmetic, validation, and formatting. | Handles valid input, empty input, invalid values, and zero correctly. |
| Expense summary | Arrays, objects, filtering, grouping, and totals. | Produces correct totals for an empty list and multiple categories. |
| Task tracker | DOM events, forms, state, and browser storage. | Tasks can be added, completed, deleted, and restored after refresh. |
| API search page | Requests, promises, JSON, and UI state. | Shows loading, results, no matches, and network failures clearly. |
| Node.js command-line tool | Arguments, file operations, modules, and errors. | Explains usage and handles missing inputs without an unexplained crash. |

For each finished project, include setup instructions, a short explanation of your choices, and a few meaningful checks of its behavior.

## Simple Mistakes To Avoid

- **Reassignment versus mutation:** `const` prevents reassignment of the variable, but object properties and array elements can still change.
- **Shallow versus deep copying:** Spread syntax copies one level. `structuredClone` supports deep copying many data types, but cannot clone every JavaScript value, including functions.
- **Numbers from forms:** Form input values are usually strings. Convert and validate them before doing arithmetic.
- **Async iteration:** `forEach` does not wait for an async callback. Use `for...of` with `await` for sequential work, or `Promise.all(items.map(...))` for concurrent work.
- **Request failures:** With `fetch`, check `response.ok` before treating a response as successful; HTTP error statuses do not automatically reject the promise.
- **Runtime differences:** Browser code can use `document`; Node.js scripts do not have a browser DOM by default.
- **Errors and cleanup:** Handle rejected promises and release timers, event listeners, or other resources when they are no longer needed.
- **Performance assumptions:** Measure a real bottleneck before adding caches or complex optimizations.
