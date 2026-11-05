# PHP

## Concise introductory examples

[examples.php](./examples.php) introduces typed functions, values, comments, associative arrays, foreach, closures, copy-on-write array updates, nullish defaults, match, and JSON exceptions.

From this directory, use PHP 8 or later: check syntax with `php -l examples.php`, then run `php examples.php`. It prints a reading list in the terminal; no web server or extensions beyond the standard JSON support are needed.

PHP is commonly used to build server-rendered web applications. PHP can generate web responses or run local command-line scripts.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing PHP](#executing-php)
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
| PHP | A server-side scripting language with dynamic values and optional type declarations. | [PHP documentation](https://www.php.net/manual/en/) |
| CLI | Runs scripts directly in a terminal. | [Reference](https://www.php.net/manual/en/) |
| Standard library | Arrays, strings, iterators, and SPL collections are included. | [Reference](https://www.php.net/manual/en/) |

## Executing PHP

### In this repository

Run: `php hello.php`

Use PHP 8 or later for the typed examples. The command-line example needs no web server or external packages.

Open [hello.php](./hello.php) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Variables use $; const defines constants and type declarations document boundaries. | Change a value and predict its type and result. |
| 2. Decisions and execution | if, foreach, and match express decisions and iteration. Functions can declare parameter and return types; closures capture chosen values. | Exercise both outcomes of a small example. |
| 3. Data and updates | PHP arrays are ordered maps; SPL supplies specialized collection objects. Arrays use value semantics with copy-on-write; assigned objects share identity. | Handle empty, single-item, and repeated input. |
| 4. Organization | Visibility controls class members; private state can be exposed through methods. Higher-order functions implement reusable transformations without changing the input. | Separate one responsibility into a named component. |
| 5. Reliability | PHP supports //, #, block comments, and documentation comments. Reference counting and cycle collection manage memory; close external resources explicitly. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Generators yield values lazily; fibers are cooperative and need scheduling, not automatic parallelism. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use keyed lookups for repeated membership checks and profile before caching. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `$score = 10;` | Variables use $; const defines constants and type declarations document boundaries. |
| Control Flow Operations | `match ($result) { "pass" => "continue", default => "practice" }` | if, foreach, and match express decisions and iteration. |
| Execution Blocks | `function greet(string $name = "World"): string` | Functions can declare parameter and return types; closures capture chosen values. |
| Code Health & Documentation | `// comment; /* block comment */` | PHP supports //, #, block comments, and documentation comments. |
| Built-In Collections | `["apples" => 3]` | PHP arrays are ordered maps; SPL supplies specialized collection objects. |
| Data Mutability | `$updated = $settings;` | Arrays use value semantics with copy-on-write; assigned objects share identity. |
| Access & Encapsulation | `private int $count = 0;` | Visibility controls class members; private state can be exposed through methods. |
| Design Paradigms & Patterns | `$discounted = array_map($strategy, $prices);` | Higher-order functions implement reusable transformations without changing the input. |
| Memory Management | `try { /* use resource */ } finally { fclose($stream); }` | Reference counting and cycle collection manage memory; close external resources explicitly. |
| Concurrency & Parallelism | `yield "first";` | Generators yield values lazily; fibers are cooperative and need scheduling, not automatic parallelism. |
| Performance Optimization | `isset($allowedNames["Ada"])` | Use keyed lookups for repeated membership checks and profile before caching. |

The code above is a compact reminder; use [hello.php](./hello.php) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [PHP documentation](https://www.php.net/manual/en/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [PHP tutorial](https://www.php.net/manual/en/tutorial.php) | Start with requests, scripts, and basic syntax. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone PHP certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [PHP CLI and linter](https://www.php.net/manual/en/features.commandline.php) | Use php -l hello.php to check syntax. | When developing and checking examples for this language. |
| [PHP manual](https://www.php.net/manual/en/) | Look up built-in functions and extension requirements. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Expense report | Arrays, filtering, formatting | Calculate totals from validated data. |
| Form handler | Requests and output escaping | Display invalid input safely and explain validation failures. |
| CLI text summary | Files and functions | Close resources and report missing files. |

## Simple Mistakes To Avoid

- Use === when both value and type should match.
- Escape untrusted HTML output and use prepared database statements.
- An array copy and an object assignment have different sharing behavior.
- Extensions and PHP versions affect which APIs are available.
