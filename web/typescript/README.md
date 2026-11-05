# TypeScript

## Concise introductory examples

[examples.ts](./examples.ts) introduces interfaces, literal unions, annotations, comments, functions, generics, arrays, Map, Set, optional values, and narrowing unknown input.

From this directory, run `node examples.ts` with Node.js 24 or later (built-in type stripping). This executes without type checking or packages. If TypeScript is already installed, separately check types with `tsc --noEmit --strict --target ES2022 --module commonjs examples.ts`. No project scaffolding is required.

TypeScript adds static types to JavaScript applications. The compiler checks types and emits JavaScript; runtime input still needs validation.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing TypeScript](#executing-typescript)
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
| TypeScript | Static checking for JavaScript; types are erased before execution. | [TypeScript documentation](https://www.typescriptlang.org/docs/) |
| Compiler | tsc checks types and produces JavaScript. | [Reference](https://www.typescriptlang.org/docs/) |
| Runtime | Node.js or a browser executes the emitted JavaScript. | [Reference](https://nodejs.org/en/learn/getting-started/introduction-to-nodejs) |

## Executing TypeScript

### In this repository

Run: `tsc --target ES2022 --module commonjs --strict hello.ts && node hello.js`

Install Node.js and the TypeScript compiler. This example uses modern JavaScript libraries and targets ES2022.

Open [hello.ts](./hello.ts) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | let permits reassignment; const fixes a binding, and annotations constrain accepted values. | Change a value and predict its type and result. |
| 2. Decisions and execution | Narrow union types before performing type-specific operations. Functions declare input and output types; blocks limit local bindings. | Exercise both outcomes of a small example. |
| 3. Data and updates | Arrays are ordered; Map stores typed key/value pairs and Set removes duplicates. readonly prevents writes through that type; spread copies only one level. | Handle empty, single-item, and repeated input. |
| 4. Organization | Private fields hide state; public getters can expose read-only access. Interfaces describe shape; generics retain the relationship between inputs and outputs. | Separate one responsibility into a named component. |
| 5. Reliability | Use line comments, block comments, and JSDoc to explain contracts. JavaScript garbage collection handles objects; WeakMap does not retain its keys. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Promises coordinate asynchronous work; they do not create CPU worker threads. | Explain what can run independently and what must wait. |
| 7. Applied practice | Reuse lookup structures; measure before adding caches or complex abstractions. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `let score: number = 10;` | let permits reassignment; const fixes a binding, and annotations constrain accepted values. |
| Control Flow Operations | `typeof identifier === "string"` | Narrow union types before performing type-specific operations. |
| Execution Blocks | `function greet(name: string): string` | Functions declare input and output types; blocks limit local bindings. |
| Code Health & Documentation | `// comment; /* block comment */` | Use line comments, block comments, and JSDoc to explain contracts. |
| Built-In Collections | `new Map<string, number>()` | Arrays are ordered; Map stores typed key/value pairs and Set removes duplicates. |
| Data Mutability | `Readonly<{ theme: string }>` | readonly prevents writes through that type; spread copies only one level. |
| Access & Encapsulation | `#count = 0;` | Private fields hide state; public getters can expose read-only access. |
| Design Paradigms & Patterns | `function first<T>(items: readonly T[]): T \| undefined` | Interfaces describe shape; generics retain the relationship between inputs and outputs. |
| Memory Management | `new WeakMap<object, { visits: number }>()` | JavaScript garbage collection handles objects; WeakMap does not retain its keys. |
| Concurrency & Parallelism | `Promise.all([firstTask, secondTask])` | Promises coordinate asynchronous work; they do not create CPU worker threads. |
| Performance Optimization | `allowed.has("Ada")` | Reuse lookup structures; measure before adding caches or complex abstractions. |

The code above is a compact reminder; use [hello.ts](./hello.ts) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [TypeScript documentation](https://www.typescriptlang.org/docs/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) | Types, narrowing, generics, and modules. | Tutorials and examples; check the provider for access terms. |
| [TypeScript Playground](https://www.typescriptlang.org/play) | Experiment with compiler diagnostics and emitted JavaScript. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone TypeScript certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [TypeScript compiler](https://www.typescriptlang.org/docs/) | Check with strict options and compile. | When developing and checking examples for this language. |
| [TypeScript Playground](https://www.typescriptlang.org/play) | Inspect type errors and generated code. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Typed expense summary | Interfaces, arrays, narrowing | Reject invalid input and calculate totals. |
| API response validator | unknown, guards, error handling | Check actual runtime data before using typed fields. |
| Generic lookup helper | Generics and Map | Handle missing keys explicitly. |

## Simple Mistakes To Avoid

- Type annotations do not validate JSON at runtime; narrow unknown input before using it.
- Avoid using any to silence errors; prefer specific types or unknown with checks.
- A readonly property is a type-system restriction, not a deep runtime freeze.
- Match target and library settings to the JavaScript runtime you deploy.
