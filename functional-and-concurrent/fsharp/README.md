# F#

F# is a functional-first .NET language used for applications and data-intensive software.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing F#](#executing-f)
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
| F# | A functional-first .NET language with inferred static types, records, unions, and async workflows. | [F# documentation](https://learn.microsoft.com/dotnet/fsharp/) |
| .NET | Runtime, libraries, packages, and SDK tooling. | [Reference](https://learn.microsoft.com/dotnet/fsharp/) |
| F# Interactive | Evaluates script files and expressions through dotnet fsi. | [Reference](https://learn.microsoft.com/dotnet/fsharp/) |

## Executing F#

### In this repository

Run: `dotnet fsi hello.fsx`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.fsx](./hello.fsx) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | let binds an inferred static type; mutable permits reassignment. | Change a value and predict its type and result. |
| 2. Decisions and execution | if is an expression and match handles alternatives explicitly. Functions are values and indentation groups expressions. | Exercise both outcomes of a small example. |
| 3. Data and updates | Lists are immutable sequences; arrays are mutable, Map is keyed, and Set stores unique values. Record updates create a new record; arrays support explicit element mutation. | Handle empty, single-item, and repeated input. |
| 4. Organization | Private fields and members encapsulate object state when an object model is useful. Pipelines, functions, and discriminated unions model transformations and alternatives. | Separate one responsibility into a named component. |
| 5. Reliability | Use // comments, (* *) blocks, and /// XML documentation. The GC manages objects; use disposes resources when a function scope exits. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Async.Parallel coordinates workflows; it does not automatically parallelize arbitrary CPU work. | Explain what can run independently and what must wait. |
| 7. Applied practice | Prefer sequence or collection operations suited to the workload and benchmark hotspots. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `let mutable score = 10` | let binds an inferred static type; mutable permits reassignment. |
| Control Flow Operations | `if score >= 10 then "pass" else "retry"` | if is an expression and match handles alternatives explicitly. |
| Execution Blocks | `let add left right = left + right` | Functions are values and indentation groups expressions. |
| Code Health & Documentation | `// comment; (* block comment *)` | Use // comments, (* *) blocks, and /// XML documentation. |
| Built-In Collections | `Map.ofList [("apples", 3)]` | Lists are immutable sequences; arrays are mutable, Map is keyed, and Set stores unique values. |
| Data Mutability | `{ settings with Theme = "dark" }` | Record updates create a new record; arrays support explicit element mutation. |
| Access & Encapsulation | `type Counter() = ...` | Private fields and members encapsulate object state when an object model is useful. |
| Design Paradigms & Patterns | `values \|> List.map (fun value -> value * 2)` | Pipelines, functions, and discriminated unions model transformations and alternatives. |
| Memory Management | `use reader = new StringReader("sample")` | The GC manages objects; use disposes resources when a function scope exits. |
| Concurrency & Parallelism | `tasks \|> Async.Parallel \|> Async.RunSynchronously` | Async.Parallel coordinates workflows; it does not automatically parallelize arbitrary CPU work. |
| Performance Optimization | `Set.contains "Ada" allowed` | Prefer sequence or collection operations suited to the workload and benchmark hotspots. |

The code above is a compact reminder; use [hello.fsx](./hello.fsx) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [F# documentation](https://learn.microsoft.com/dotnet/fsharp/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [F# language guide](https://learn.microsoft.com/dotnet/fsharp/language-reference/) | Study type inference, pattern matching, and modules. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone F# certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [F# Interactive](https://learn.microsoft.com/dotnet/fsharp/tools/fsharp-interactive/) | Run scripts and explore types. | When developing and checking examples for this language. |
| [.NET SDK](https://learn.microsoft.com/dotnet/core/tools/) | Build and test package-based projects. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Sequence summary | Functions, folds, empty data | Compute correct results without mutating inputs. |
| Small domain model | Records, modules, invariants | Expose operations that preserve valid state. |
| Concurrent result collector | Tasks, waiting, failures | Account for every started task. |

## Simple Mistakes To Avoid

- Bindings are immutable unless explicitly marked mutable.
- Use exhaustive pattern matching for union values.
- Async workflows describe work and need to be started or awaited.
- use should appear in an appropriate scope so resources are disposed predictably.

## Concise introductory examples

[examples.fsx](./examples.fsx) introduces typed records, lists, comments and
documentation, functions, pipelines, option matching, immutable record updates,
maps, iteration, and explicitly executed async workflows through a shelf catalog.

From this directory, run `dotnet fsi examples.fsx` with a .NET SDK that includes
F# Interactive. It uses only SDK libraries, requires no project or package restore,
and prints catalog entries, lookup outcomes, and asynchronously produced labels.
