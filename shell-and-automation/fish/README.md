# Fish

Fish is an interactive Unix shell with a user-friendly scripting language.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Fish](#executing-fish)
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
| Fish | Interactive shell scripting with list-valued variables, explicit scopes, and a distinct non-POSIX syntax. | [Fish documentation](https://fishshell.com/docs/current/) |
| Variables | set declares list values with local, global, or universal scope. | [Reference](https://fishshell.com/docs/current/) |
| Functions and jobs | Functions encapsulate commands; job control manages child processes. | [Reference](https://fishshell.com/docs/current/) |

## Executing Fish

### In this repository

Run: `fish hello.fish`

Run with fish, not sh or Bash. Variables are lists and indexing begins at one.

Open [hello.fish](./hello.fish) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.fish](./examples.fish) for a standalone introduction: List-valued strings, one-based indexing, named function arguments, command-status conditions, contains, list copies, string operations, and switch.

Use Fish 3.6+ in a Unix-like environment. From this directory:

```sh
fish -n examples.fish
fish examples.fish
```

The first command checks syntax; the second prints the task report. Use Fish explicitly; it is not POSIX shell syntax. No persistent universal variables, external commands, or filesystem changes are used.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | set stores list-valued variables; math performs numeric evaluation. | Change a value and predict its type and result. |
| 2. Decisions and execution | if uses command exit status; for iterates through list elements. Functions take arguments through argv and can declare local state. | Exercise both outcomes of a small example. |
| 3. Data and updates | Variables can hold lists; Fish has no native general-purpose hash-map type. Copy list elements into another variable before making independent updates. | Handle empty, single-item, and repeated input. |
| 4. Organization | Function-local variables reduce collisions; functions do not provide private object fields. Small functions compose through output and command exit status. | Separate one responsibility into a named component. |
| 5. Reliability | Fish uses # line comments; use adjacent lines for multi-line documentation. set -e removes a variable; resource cleanup belongs to the script that creates it. | Check an edge case and explain resource lifetime. |
| 6. Execution model | & starts background work; wait observes all or selected child jobs. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use list operations and builtins when they avoid unnecessary process creation. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `set -l score 10` | set stores list-valued variables; math performs numeric evaluation. |
| Control Flow Operations | `if test $score -ge 10` | if uses command exit status; for iterates through list elements. |
| Execution Blocks | `function example_add ... end` | Functions take arguments through argv and can declare local state. |
| Code Health & Documentation | `# comment` | Fish uses # line comments; use adjacent lines for multi-line documentation. |
| Built-In Collections | `set -l values 1 2 3` | Variables can hold lists; Fish has no native general-purpose hash-map type. |
| Data Mutability | `set -l copied $values` | Copy list elements into another variable before making independent updates. |
| Access & Encapsulation | `set -l label "local value"` | Function-local variables reduce collisions; functions do not provide private object fields. |
| Design Paradigms & Patterns | `set -l doubled (example_double 3)` | Small functions compose through output and command exit status. |
| Memory Management | `set -e temporary` | set -e removes a variable; resource cleanup belongs to the script that creates it. |
| Concurrency & Parallelism | `sleep 0.01 &; wait` | & starts background work; wait observes all or selected child jobs. |
| Performance Optimization | `contains -- 2 $values` | Use list operations and builtins when they avoid unnecessary process creation. |

The code above is a compact reminder; use [hello.fish](./hello.fish) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Fish documentation](https://fishshell.com/docs/current/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Fish tutorial](https://fishshell.com/docs/current/tutorial.html) | Learn variables, loops, functions, and command substitution. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Fish certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Fish](https://fishshell.com/docs/current/) | Run scripts and check syntax with fish -n. | When developing and checking examples for this language. |
| [fish_indent](https://fishshell.com/docs/current/cmds/fish_indent.html) | Format Fish source consistently. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Argument validator | Quoting, conditions, exit codes | Handle missing and empty arguments predictably. |
| Text inventory report | Lists, iteration, formatting | Handle names containing spaces without splitting them. |
| Background task demo | Processes and completion | Wait for child work and report its exit status. |

## Simple Mistakes To Avoid

- Fish syntax differs from POSIX sh and Bash; use its own function and condition syntax.
- List indexing starts at one.
- set -l, set -g, and set -U have different lifetimes and persistence.
- Do not interpolate untrusted strings into an evaluated command.
