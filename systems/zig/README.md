# Zig

Zig is a systems language focused on explicit control and straightforward cross-compilation.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Zig](#executing-zig)
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
| Zig | Compiled systems programming with explicit allocation, error unions, and compile-time evaluation. | [Zig documentation](https://ziglang.org/documentation/master/) |
| Compiler | Builds, tests, and cross-compiles native code. | [Reference](https://ziglang.org/documentation/master/) |
| Allocator | Passed explicitly to operations that need dynamic memory. | [Reference](https://ziglang.org/documentation/master/) |

## Executing Zig

### In this repository

Run: `zig run hello.zig`

Install Zig and use its matching version of the language reference. Standard-library APIs can change between releases; this example stays close to core language and allocator operations.

Open [hello.zig](./hello.zig) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.zig](./examples.zig) for a standalone introduction: Struct defaults, string slices, fixed arrays, optional capture, functions, loops, explicit integer types, and array copies.

Use Zig 0.15.x. From this directory:

```sh
zig run examples.zig
```

No build project or packages are required. The example uses fixed storage and `std.debug.print` (stderr), so it needs no allocator or version-sensitive file I/O setup. Prints a `Completed: 2/3` report and checks the count with a debug assertion.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | var allows mutation; const fixes a binding and types can be inferred. | Change a value and predict its type and result. |
| 2. Decisions and execution | if is an expression; for loops visit sequence values. Blocks can return values using a label and break. | Exercise both outcomes of a small example. |
| 3. Data and updates | Arrays have fixed length; slices are pointer-and-length views over elements. Const bindings and read-only pointees are different; array assignment copies elements. | Handle empty, single-item, and repeated input. |
| 4. Organization | pub controls declaration visibility; a struct groups data and associated functions. comptime evaluates known expressions during compilation and supports generic designs. | Separate one responsibility into a named component. |
| 5. Reliability | Zig uses line comments and /// documentation; there is no C-style block-comment syntax. Allocation is explicit; defer ensures the allocation is freed at scope exit. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Atomic operations coordinate shared state; they do not start threads. | Explain what can run independently and what must wait. |
| 7. Applied practice | Prefer clear bounds and allocation behavior; measure before changing optimization modes. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `var score: u32 = 10;` | var allows mutation; const fixes a binding and types can be inferred. |
| Control Flow Operations | `for (values) \|value\| { ... }` | if is an expression; for loops visit sequence values. |
| Execution Blocks | `break :calculation left + 3;` | Blocks can return values using a label and break. |
| Code Health & Documentation | `// comment; /// declaration documentation` | Zig uses line comments and /// documentation; there is no C-style block-comment syntax. |
| Built-In Collections | `const view: []const u8 = values[0..];` | Arrays have fixed length; slices are pointer-and-length views over elements. |
| Data Mutability | `var copied = values;` | Const bindings and read-only pointees are different; array assignment copies elements. |
| Access & Encapsulation | `pub fn increment(self: *@This()) void` | pub controls declaration visibility; a struct groups data and associated functions. |
| Design Paradigms & Patterns | `const doubled = comptime 21 * 2;` | comptime evaluates known expressions during compilation and supports generic designs. |
| Memory Management | `defer allocator.free(buffer);` | Allocation is explicit; defer ensures the allocation is freed at scope exit. |
| Concurrency & Parallelism | `@atomicLoad(u32, &shared, .seq_cst)` | Atomic operations coordinate shared state; they do not start threads. |
| Performance Optimization | `for (view) \|value\| { total += value; }` | Prefer clear bounds and allocation behavior; measure before changing optimization modes. |

The code above is a compact reminder; use [hello.zig](./hello.zig) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Zig documentation](https://ziglang.org/documentation/master/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Zig language reference](https://ziglang.org/documentation/master/) | Read the reference matching your installed Zig release. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Zig certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Zig compiler](https://ziglang.org/documentation/) | Use zig run, zig test, and zig fmt. | When developing and checking examples for this language. |
| [Zig reference](https://ziglang.org/documentation/master/) | Check version-specific syntax and library changes. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Unit converter | Types, functions, input validation | Reject invalid values and test boundary cases. |
| Inventory summary | Collections and transformations | Handle empty data and repeated keys correctly. |
| Bounded cache | Ownership and lookup behavior | Limit retained entries and explain cleanup. |

## Simple Mistakes To Avoid

- Use const unless the variable itself changes; mutable elements can still be reached through suitable pointers.
- Free an allocation with the allocator that created it.
- try propagates an error; catch handles it.
- Match the reference to your installed compiler version.
