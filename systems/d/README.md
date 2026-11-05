# D

D combines systems-programming performance with high-level language features.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing D](#executing-d)
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
| D | Compiled programming with templates, ranges, optional garbage collection, and explicit qualifiers. | [D language specification](https://dlang.org/spec/spec.html) |
| Phobos | The standard library supplies ranges, algorithms, and concurrency. | [Reference](https://dlang.org/spec/spec.html) |
| DUB | The ecosystem's package and build tooling. | [Reference](https://dub.pm/) |

## Executing D

### In this repository

Run: `dmd hello.d && ./hello`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.d](./hello.d) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.d](./examples.d) for a standalone introduction: Structs, strings, dynamic arrays, ref iteration, functions, lazy ranges, associative arrays, and explicit array duplication.

Use DMD with its bundled Phobos standard library. From this directory in a Unix-like shell:

```sh
dmd examples.d -of=examples
./examples
```

On Windows use `dmd examples.d -of=examples.exe`, then `.\examples.exe` in PowerShell. Prints the task report, pending names, and the independent draft.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | auto infers a static type; immutable fixes data, while const provides read-only access. | Change a value and predict its type and result. |
| 2. Decisions and execution | if and foreach express decisions and iteration. Functions and delegates organize reusable calculations. | Exercise both outcomes of a small example. |
| 3. Data and updates | Dynamic arrays are slices; associative arrays map typed keys to values. Array assignment shares elements; dup creates an independent mutable copy. | Handle empty, single-item, and repeated input. |
| 4. Organization | private restricts access at module scope; methods provide a controlled interface. Ranges and templates compose lazy transformations; array materializes a result. | Separate one responsibility into a named component. |
| 5. Reliability | D has line comments, block comments, nested /+ +/ comments, and Ddoc. The GC manages ordinary arrays; scope(exit) guarantees lexical cleanup actions. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Message passing communicates between threads without sharing mutable local arrays. | Explain what can run independently and what must wait. |
| 7. Applied practice | Reserve or reuse data when useful; avoid materializing lazy ranges unnecessarily. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `immutable string language = "D";` | auto infers a static type; immutable fixes data, while const provides read-only access. |
| Control Flow Operations | `foreach (value; 0 .. 3)` | if and foreach express decisions and iteration. |
| Execution Blocks | `int add(int left, int right)` | Functions and delegates organize reusable calculations. |
| Code Health & Documentation | `/// Ddoc documentation` | D has line comments, block comments, nested /+ +/ comments, and Ddoc. |
| Built-In Collections | `int[string] inventory;` | Dynamic arrays are slices; associative arrays map typed keys to values. |
| Data Mutability | `auto copied = values.dup;` | Array assignment shares elements; dup creates an independent mutable copy. |
| Access & Encapsulation | `private int count;` | private restricts access at module scope; methods provide a controlled interface. |
| Design Paradigms & Patterns | `values.map!(value => value * 2).array` | Ranges and templates compose lazy transformations; array materializes a result. |
| Memory Management | `scope(exit) cleanup();` | The GC manages ordinary arrays; scope(exit) guarantees lexical cleanup actions. |
| Concurrency & Parallelism | `spawn(&worker, thisTid)` | Message passing communicates between threads without sharing mutable local arrays. |
| Performance Optimization | `values.map!(value => value + 1)` | Reserve or reuse data when useful; avoid materializing lazy ranges unnecessarily. |

The code above is a compact reminder; use [hello.d](./hello.d) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [D language specification](https://dlang.org/spec/spec.html) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [D tour](https://tour.dlang.org/) | Learn types, arrays, functions, and ranges. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone D certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [D compiler documentation](https://dlang.org/documentation.html) | Select a compiler and review language/library APIs. | When developing and checking examples for this language. |
| [DUB](https://dub.pm/) | Manage package-based projects. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Unit converter | Types, functions, input validation | Reject invalid values and test boundary cases. |
| Inventory summary | Collections and transformations | Handle empty data and repeated keys correctly. |
| Bounded cache | Ownership and lookup behavior | Limit retained entries and explain cleanup. |

## Simple Mistakes To Avoid

- const and immutable describe different guarantees; immutable data cannot be changed through another alias.
- Dynamic-array slices can share underlying storage; use dup for an independent copy.
- private is module-level protection in D.
- Garbage collection does not replace explicit handling of external resources.
