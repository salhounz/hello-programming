# Ruby

Ruby is used for web applications, automation, and general-purpose scripting.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Ruby](#executing-ruby)
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
| Ruby | Object-oriented scripting with dynamic values, blocks, enumerable collections, and garbage collection. | [Ruby documentation](https://www.ruby-lang.org/en/documentation/) |
| Interpreter and IRB | Run source or explore expressions interactively. | [Reference](https://www.ruby-lang.org/en/documentation/) |
| Gems | Reusable packages installed and managed within the Ruby ecosystem. | [Reference](https://www.ruby-lang.org/en/documentation/) |

## Executing Ruby

### In this repository

Run: `ruby hello.rb`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.rb](./hello.rb) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.rb](./examples.rb) for a short, self-contained introduction to dynamic values, comments, methods with keyword arguments, arrays/hashes, blocks, Enumerable transformations, truthiness, shallow copies, safe navigation, and conversion exceptions.

With Ruby 2.3 or newer, run from this directory:

```sh
ruby -c examples.rb
ruby examples.rb
```

The first command checks syntax; the second runs the standalone script. No gems are required.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Local variables hold dynamic values; uppercase names conventionally identify constants. | Change a value and predict its type and result. |
| 2. Decisions and execution | if and each express decisions and collection iteration. Methods and blocks group reusable behavior. | Exercise both outcomes of a small example. |
| 3. Data and updates | Array is ordered, Hash maps keys, and Set keeps unique members. dup makes a shallow copy; freeze makes a particular object unmodifiable. | Handle empty, single-item, and repeated input. |
| 4. Organization | Instance variables hold object state; public methods can expose selected operations. Enumerable methods and blocks compose transformations. | Separate one responsibility into a named component. |
| 5. Reliability | Use # for notes and =begin/=end at the start of lines for a block comment. The runtime collects objects; ensure performs cleanup when leaving a protected body. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Thread starts concurrent work; value waits and returns its result. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use suitable lookup structures and avoid creating intermediate collections unnecessarily. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `score = 10` | Local variables hold dynamic values; uppercase names conventionally identify constants. |
| Control Flow Operations | `[1, 2, 3].each { \|value\| ... }` | if and each express decisions and collection iteration. |
| Execution Blocks | `def greet(name = "World")` | Methods and blocks group reusable behavior. |
| Code Health & Documentation | `# comment; =begin ... =end` | Use # for notes and =begin/=end at the start of lines for a block comment. |
| Built-In Collections | `Set.new([1, 1, 2])` | Array is ordered, Hash maps keys, and Set keeps unique members. |
| Data Mutability | `copied = values.dup` | dup makes a shallow copy; freeze makes a particular object unmodifiable. |
| Access & Encapsulation | `attr_reader :value` | Instance variables hold object state; public methods can expose selected operations. |
| Design Paradigms & Patterns | `values.reduce(0) { \|sum, value\| sum + value }` | Enumerable methods and blocks compose transformations. |
| Memory Management | `begin ... ensure ... end` | The runtime collects objects; ensure performs cleanup when leaving a protected body. |
| Concurrency & Parallelism | `Thread.new { 42 }.value` | Thread starts concurrent work; value waits and returns its result. |
| Performance Optimization | `allowed.include?("Ada")` | Use suitable lookup structures and avoid creating intermediate collections unnecessarily. |

The code above is a compact reminder; use [hello.rb](./hello.rb) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Ruby documentation](https://www.ruby-lang.org/en/documentation/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Ruby language reference](https://docs.ruby-lang.org/en/) | Find the reference matching your Ruby version. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Ruby certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Ruby and IRB](https://www.ruby-lang.org/en/documentation/) | Run scripts, check syntax with ruby -c, and explore values. | When developing and checking examples for this language. |
| [RubyGems](https://guides.rubygems.org/) | Install and package reusable libraries. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Validated converter | Values, functions, error handling | Handle empty, invalid, and boundary inputs. |
| Inventory summary | Collections, grouping, transformations | Calculate correct results for empty and repeated data. |
| Text-processing tool | Iteration and resource handling | Give clear results and explain failure cases. |

## Simple Mistakes To Avoid

- Assignment shares mutable objects; dup is a shallow copy.
- freeze prevents mutation of that object, not all nested objects.
- Symbols and strings are distinct key types in hashes.
- Thread behavior depends on the Ruby implementation; threads do not guarantee CPU parallelism.
