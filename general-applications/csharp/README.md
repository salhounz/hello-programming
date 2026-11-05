# C#

C# is used for .NET web, desktop, cloud, and game applications.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing C#](#executing-c)
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
| C# | Statically typed .NET programming with classes, generics, LINQ, and asynchronous tasks. | [C# documentation](https://learn.microsoft.com/dotnet/csharp/) |
| .NET | Runtime, base libraries, and SDK tooling. | [Reference](https://learn.microsoft.com/dotnet/csharp/) |
| LINQ | Query and transform typed sequences using library methods. | [Reference](https://learn.microsoft.com/dotnet/csharp/) |

## Executing C#

### In this repository

Run: `csc Hello.cs && Hello.exe`

The original csc command requires a configured C# compiler environment. With a .NET SDK, create a console project in a separate working directory, replace its generated program with this source, and use dotnet run.

Open [Hello.cs](./Hello.cs) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.cs](./examples.cs) for a short, self-contained introduction to static types, XML comments, methods, lists/dictionaries/sets, branching, LINQ lambdas, shallow copies, and safe dictionary lookup.

Use a configured Windows C# compiler environment with .NET Framework 4 or newer. From this directory, run in PowerShell:

```powershell
csc /out:examples.exe examples.cs
.\examples.exe
```

Compile only this file; compiling both sources together would introduce two entry points. No project or third-party packages are needed.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | var infers a static type; const defines a compile-time constant. | Change a value and predict its type and result. |
| 2. Decisions and execution | if and foreach handle decisions and iteration. Delegates and lambdas group operations; braces introduce local scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | List grows dynamically, Dictionary maps keys, and HashSet stores unique values. Reference assignments share mutable objects; a new list copies elements shallowly. | Handle empty, single-item, and repeated input. |
| 4. Organization | private restricts members; the Counter type exposes methods and a getter. LINQ and delegates compose transformations without changing the input collection. | Separate one responsibility into a named component. |
| 5. Reliability | Use line comments, block comments, and XML documentation on declarations. The GC handles managed objects; using disposes external or disposable resources. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Task.Run schedules worker work; this synchronous entry point waits for its result. | Explain what can run independently and what must wait. |
| 7. Applied practice | Reuse appropriate lookup collections and reserve capacity for known batches. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `const string Language = "C#";` | var infers a static type; const defines a compile-time constant. |
| Control Flow Operations | `foreach (int value in values)` | if and foreach handle decisions and iteration. |
| Execution Blocks | `Func<int, int, int> add = (left, right) => left + right;` | Delegates and lambdas group operations; braces introduce local scope. |
| Code Health & Documentation | `// comment; /// <summary>...</summary>` | Use line comments, block comments, and XML documentation on declarations. |
| Built-In Collections | `new Dictionary<string, int>()` | List grows dynamically, Dictionary maps keys, and HashSet stores unique values. |
| Data Mutability | `new List<int>(values)` | Reference assignments share mutable objects; a new list copies elements shallowly. |
| Access & Encapsulation | `private int count;` | private restricts members; the Counter type exposes methods and a getter. |
| Design Paradigms & Patterns | `values.Select(value => value * 2).ToList()` | LINQ and delegates compose transformations without changing the input collection. |
| Memory Management | `using (var reader = new StringReader("sample"))` | The GC handles managed objects; using disposes external or disposable resources. |
| Concurrency & Parallelism | `Task.Run(() => 42)` | Task.Run schedules worker work; this synchronous entry point waits for its result. |
| Performance Optimization | `new List<int>(100)` | Reuse appropriate lookup collections and reserve capacity for known batches. |

The code above is a compact reminder; use [Hello.cs](./Hello.cs) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [C# documentation](https://learn.microsoft.com/dotnet/csharp/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [C# language guide](https://learn.microsoft.com/dotnet/csharp/) | Study types, classes, collections, and async behavior. | Tutorials and examples; check the provider for access terms. |
| [.NET CLI](https://learn.microsoft.com/dotnet/core/tools/) | Learn project creation, build, and test commands. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

The table distinguishes language assessments, course-completion certificates, and related platform credentials. A platform credential can involve this language without being a language-only certification.

| Provider and credential | Level / scope | Assessment or completion requirement | Cost model |
| --- | --- | --- | --- |
| [Foundational C# with Microsoft](https://www.freecodecamp.org/learn/foundational-c-sharp-with-microsoft/) | Foundational C# programming | Complete the provider's learning and certification requirements. | Free learning and certification route. |

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [.NET SDK](https://learn.microsoft.com/dotnet/core/tools/) | Create, build, run, and test console projects. | When developing and checking examples for this language. |
| [C# compiler](https://learn.microsoft.com/dotnet/csharp/) | Check types and compile language examples. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Typed inventory summary | Collections, validation, totals | Test empty data, repeated keys, and invalid values. |
| Reusable conversion library | Functions, interfaces, tests | Separate core rules from input/output. |
| Concurrent lookup demo | Tasks and error handling | Wait for all work and surface failures clearly. |

## Simple Mistakes To Avoid

- var infers a static type; it is not dynamic typing.
- A read-only binding or getter does not make nested objects immutable.
- Dispose resources with using or a finally block.
- Await asynchronous operations in application code rather than blocking unnecessarily.
