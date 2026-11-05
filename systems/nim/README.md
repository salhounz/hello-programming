# Nim

Nim is a compiled language used for efficient systems and application development.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Nim](#executing-nim)
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
| Nim | Compiled, statically typed programming with inference, procedures, sequences, and metaprogramming. | [Nim manual](https://nim-lang.org/docs/manual.html) |
| Compiler | Usually generates C and invokes a native toolchain. | [Reference](https://nim-lang.org/docs/manual.html) |
| Standard library | Sequences, tables, sets, async operations, and system interfaces. | [Reference](https://nim-lang.org/docs/manual.html) |

## Executing Nim

### In this repository

Run: `nim c -r hello.nim`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.nim](./hello.nim) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.nim](./examples.nim) for a standalone introduction: Object types, const/let/var bindings, procedures, sequences, Option, tables, sequence templates, and value updates.

Use Nim 2.x and its configured native C toolchain. From this directory:

```sh
nim c -r examples.nim
```

Only Nim's standard library is imported; no Nimble packages are needed. Prints a task report and checks that `Share notes` remains pending.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | var is mutable, let binds a value once, and const is evaluated at compile time. | Change a value and predict its type and result. |
| 2. Decisions and execution | if can produce a value; for iterates through a range or collection. Procedures declare parameters and results; named blocks provide local scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | seq grows dynamically; Table maps keys and HashSet keeps unique values. Value-style sequence assignment preserves independent updates under normal Nim semantics. | Handle empty, single-item, and repeated input. |
| 4. Organization | Unexported object fields stay private to their module; * marks exported declarations. Sequence operations and procedures support reusable transformations. | Separate one responsibility into a named component. |
| 5. Reliability | Use # notes, #[ ... ]# block comments, and ## documentation comments. Managed values use the configured memory manager; deterministic cleanup can use defer. | Check an edge case and explain resource lifetime. |
| 6. Execution model | asyncdispatch schedules cooperative async procedures; it is not automatic CPU parallelism. | Explain what can run independently and what must wait. |
| 7. Applied practice | Reserve sequence capacity for known workloads; measure before changing abstractions. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `var score: int = 10` | var is mutable, let binds a value once, and const is evaluated at compile time. |
| Control Flow Operations | `if score >= 10: "pass" else: "retry"` | if can produce a value; for iterates through a range or collection. |
| Execution Blocks | `proc add(left, right: int): int` | Procedures declare parameters and results; named blocks provide local scope. |
| Code Health & Documentation | `## API documentation` | Use # notes, #[ ... ]# block comments, and ## documentation comments. |
| Built-In Collections | `var values = @[1, 2, 3]` | seq grows dynamically; Table maps keys and HashSet keeps unique values. |
| Data Mutability | `var copied = values` | Value-style sequence assignment preserves independent updates under normal Nim semantics. |
| Access & Encapsulation | `proc increment(counter: var Counter)` | Unexported object fields stay private to their module; * marks exported declarations. |
| Design Paradigms & Patterns | `values.mapIt(it * 2)` | Sequence operations and procedures support reusable transformations. |
| Memory Management | `defer: cleanup()` | Managed values use the configured memory manager; deterministic cleanup can use defer. |
| Concurrency & Parallelism | `{.async.}; await sleepAsync(1)` | asyncdispatch schedules cooperative async procedures; it is not automatic CPU parallelism. |
| Performance Optimization | `newSeqOfCap[int](100)` | Reserve sequence capacity for known workloads; measure before changing abstractions. |

The code above is a compact reminder; use [hello.nim](./hello.nim) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Nim manual](https://nim-lang.org/docs/manual.html) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Nim tutorial](https://nim-lang.org/docs/tut1.html) | Learn syntax, declarations, procedures, and collections. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Nim certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Nim compiler](https://nim-lang.org/docs/nimc.html) | Compile, check, and choose memory-management settings. | When developing and checking examples for this language. |
| [Nim standard library](https://nim-lang.org/docs/lib.html) | Look up collection and runtime modules. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Unit converter | Types, functions, input validation | Reject invalid values and test boundary cases. |
| Inventory summary | Collections and transformations | Handle empty data and repeated keys correctly. |
| Bounded cache | Ownership and lookup behavior | Limit retained entries and explain cleanup. |

## Simple Mistakes To Avoid

- Indentation defines structure; keep it consistent.
- let fixes a binding; const is evaluated at compile time.
- A seq is not a fixed-size array; distinguish their allocation and length behavior.
- Memory-management and threading options affect runtime behavior.
