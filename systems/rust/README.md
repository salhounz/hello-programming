# Rust

Rust is used for reliable, memory-safe systems and application software.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Rust](#executing-rust)
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
| Rust | Statically typed programming with ownership, borrowing, and trait-based abstraction. | [Rust documentation](https://doc.rust-lang.org/) |
| Cargo | Builds projects, runs tests, and resolves crates. | [Reference](https://doc.rust-lang.org/cargo/) |
| Ownership | The borrow checker verifies access and lifetime constraints. | [Reference](https://doc.rust-lang.org/) |

## Executing Rust

### In this repository

Run: `rustc --edition=2021 hello.rs && ./hello`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.rs](./hello.rs) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.rs](./examples.rs) for a standalone introduction: Owned strings, borrowed references, structs, Vec, Option/Result matching, iterator closures, and ordered maps.

Use a Rust compiler supporting edition 2021; no Cargo project or external crates are required. From this directory in a Unix-like shell:

```sh
rustc --edition=2021 examples.rs -o examples
./examples
```

On Windows use `rustc --edition=2021 examples.rs -o examples.exe`, then `.\examples.exe` in PowerShell. Prints tasks, pending names, counts, and a parsed limit.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Bindings are immutable by default; mut enables reassignment or mutable access. | Change a value and predict its type and result. |
| 2. Decisions and execution | if is an expression; loops can iterate through values without indexing. Functions declare parameter types; a final expression becomes the return value. | Exercise both outcomes of a small example. |
| 3. Data and updates | Vec grows dynamically; HashMap associates keys with values and HashSet stores unique values. Borrowing shares access without copying; clone makes an explicit owned copy. | Handle empty, single-item, and repeated input. |
| 4. Organization | Fields are private outside their module by default; pub controls visibility. Iterators and closures express transformations; enums model alternatives explicitly. | Separate one responsibility into a named component. |
| 5. Reliability | Use // for notes, block comments for spans, and /// for generated API documentation. Owners drop values at scope exit; Box owns heap allocation without a garbage collector. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Threads can run in parallel; joining waits for completion and reports a panic. | Explain what can run independently and what must wait. |
| 7. Applied practice | Preallocate when size is known and avoid needless allocations after measuring. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `let mut score: i32 = 10;` | Bindings are immutable by default; mut enables reassignment or mutable access. |
| Control Flow Operations | `if score >= 10 { "pass" } else { "retry" }` | if is an expression; loops can iterate through values without indexing. |
| Execution Blocks | `fn add(left: i32, right: i32) -> i32` | Functions declare parameter types; a final expression becomes the return value. |
| Code Health & Documentation | `/// API documentation` | Use // for notes, block comments for spans, and /// for generated API documentation. |
| Built-In Collections | `let values = vec![1, 2, 3];` | Vec grows dynamically; HashMap associates keys with values and HashSet stores unique values. |
| Data Mutability | `let borrowed = &values;` | Borrowing shares access without copying; clone makes an explicit owned copy. |
| Access & Encapsulation | `pub struct Counter { count: u32 }` | Fields are private outside their module by default; pub controls visibility. |
| Design Paradigms & Patterns | `values.iter().map(\|value\| value * 2)` | Iterators and closures express transformations; enums model alternatives explicitly. |
| Memory Management | `let owned = Box::new(42);` | Owners drop values at scope exit; Box owns heap allocation without a garbage collector. |
| Concurrency & Parallelism | `thread::spawn(\|\| 42)` | Threads can run in parallel; joining waits for completion and reports a panic. |
| Performance Optimization | `Vec::with_capacity(100)` | Preallocate when size is known and avoid needless allocations after measuring. |

The code above is a compact reminder; use [hello.rs](./hello.rs) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Rust documentation](https://doc.rust-lang.org/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [The Rust Book](https://doc.rust-lang.org/book/) | Learn ownership, enums, traits, and errors. | Tutorials and examples; check the provider for access terms. |
| [Rust By Example](https://doc.rust-lang.org/rust-by-example/) | Practice small compilable examples. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Rust certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [rustc](https://doc.rust-lang.org/) | Compile individual source files. | When developing and checking examples for this language. |
| [Cargo](https://doc.rust-lang.org/cargo/) | Build, test, format, and lint package projects. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Unit converter | Types, functions, input validation | Reject invalid values and test boundary cases. |
| Inventory summary | Collections and transformations | Handle empty data and repeated keys correctly. |
| Bounded cache | Ownership and lookup behavior | Limit retained entries and explain cleanup. |

## Simple Mistakes To Avoid

- Moves transfer ownership; use a borrow when you do not need ownership.
- Handle Result and Option rather than assuming success or presence.
- Borrowing constraints apply across threads as well as ordinary functions.
- Choose clone deliberately; it can allocate or copy large data.
