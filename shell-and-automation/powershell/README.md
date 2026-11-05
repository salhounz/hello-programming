# PowerShell

PowerShell is used for cross-platform shell automation and systems administration.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing PowerShell](#executing-powershell)
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
| PowerShell | Object-based shell automation with cmdlets, functions, .NET types, pipelines, and jobs. | [PowerShell documentation](https://learn.microsoft.com/powershell/) |
| Cmdlets | Commands consume and emit structured objects. | [Reference](https://learn.microsoft.com/powershell/) |
| .NET | Supplies collection, I/O, and runtime types. | [Reference](https://learn.microsoft.com/powershell/) |

## Executing PowerShell

### In this repository

Run: `powershell -File hello.ps1`

This example supports Windows PowerShell 5.1 or PowerShell 7. Use powershell -File hello.ps1 on Windows PowerShell, or pwsh -File hello.ps1 with PowerShell 7.

Open [hello.ps1](./hello.ps1) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.ps1](./examples.ps1) for a standalone introduction: Type constraints, booleans, PSCustomObject, arrays, functions, object pipelines, ordered hashtables, formatting, and independent object copies.

Use Windows PowerShell 5.1 or PowerShell 7. From this directory, choose the command for your installed host:

```powershell
powershell.exe -NoProfile -File .\examples.ps1
# Or, with PowerShell 7:
pwsh -NoProfile -File ./examples.ps1
```

Local execution policy must permit scripts. Prints a `Completed: 2/3` report and original/draft names. It changes only in-memory objects and starts no jobs.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Variables use $; type constraints and constants are available when useful. | Change a value and predict its type and result. |
| 2. Decisions and execution | if, foreach, and Where-Object express decisions and selection. Functions and parameter blocks define named operations with typed inputs. | Exercise both outcomes of a small example. |
| 3. Data and updates | Arrays hold ordered objects; hashtables and generic collections support keyed and typed data. Arrays and hashtables are reference objects; Clone makes a shallow hashtable copy. | Handle empty, single-item, and repeated input. |
| 4. Organization | Scope and functions organize state; hidden class members are not a security boundary. Pipelines compose object transformations rather than only text streams. | Separate one responsibility into a named component. |
| 5. Reliability | Use # comments, <# #> block comments, and comment-based help. Managed objects use .NET garbage collection; dispose external resources in finally. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Start-Job runs a background process job; wait, receive, and remove its bookkeeping. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use a generic list for repeated appends rather than repeatedly copying an array with +=. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `[int]$score = 10` | Variables use $; type constraints and constants are available when useful. |
| Control Flow Operations | `if ($score -ge 10) { ... }` | if, foreach, and Where-Object express decisions and selection. |
| Execution Blocks | `param([int]$Left, [int]$Right)` | Functions and parameter blocks define named operations with typed inputs. |
| Code Health & Documentation | `# comment; <# block comment #>` | Use # comments, <# #> block comments, and comment-based help. |
| Built-In Collections | `$inventory = @{ apples = 3 }` | Arrays hold ordered objects; hashtables and generic collections support keyed and typed data. |
| Data Mutability | `$copied = $settings.Clone()` | Arrays and hashtables are reference objects; Clone makes a shallow hashtable copy. |
| Access & Encapsulation | `hidden [int]$count = 0` | Scope and functions organize state; hidden class members are not a security boundary. |
| Design Paradigms & Patterns | `$values \| ForEach-Object { $_ * 2 }` | Pipelines compose object transformations rather than only text streams. |
| Memory Management | `finally { $reader.Dispose() }` | Managed objects use .NET garbage collection; dispose external resources in finally. |
| Concurrency & Parallelism | `Start-Job -ScriptBlock { 42 }` | Start-Job runs a background process job; wait, receive, and remove its bookkeeping. |
| Performance Optimization | `[System.Collections.Generic.List[int]]::new()` | Use a generic list for repeated appends rather than repeatedly copying an array with +=. |

The code above is a compact reminder; use [hello.ps1](./hello.ps1) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [PowerShell documentation](https://learn.microsoft.com/powershell/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [PowerShell scripting documentation](https://learn.microsoft.com/powershell/scripting/overview) | Learn syntax, modules, providers, and pipelines. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone PowerShell certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [PowerShell](https://learn.microsoft.com/powershell/) | Run scripts and inspect help and command metadata. | When developing and checking examples for this language. |
| [PSScriptAnalyzer](https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview) | Analyze common script problems and style issues. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Argument validator | Quoting, conditions, exit codes | Handle missing and empty arguments predictably. |
| Text inventory report | Lists, iteration, formatting | Handle names containing spaces without splitting them. |
| Background task demo | Processes and completion | Wait for child work and report its exit status. |

## Simple Mistakes To Avoid

- Use -eq for comparisons; = assigns a value.
- Suppress incidental pipeline output when a function should return only one result.
- Some cmdlet errors are non-terminating; use -ErrorAction Stop when catch should handle them.
- Use -LiteralPath when input is a literal file path that may contain wildcard characters.
