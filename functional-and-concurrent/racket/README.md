# Racket

Racket is a Lisp-family language used for language-oriented programming and education.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Racket](#executing-racket)
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
| Racket | A language-oriented Lisp with modules, immutable data, contracts, and a broad runtime library. | [Racket documentation](https://docs.racket-lang.org/) |
| Modules | A #lang declaration selects the language and module behavior. | [Reference](https://docs.racket-lang.org/) |
| Raco | Command-line tooling builds, tests, and manages packages. | [Reference](https://docs.racket-lang.org/) |

## Executing Racket

### In this repository

Run: `racket hello.rkt`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.rkt](./hello.rkt) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | define names values; let creates lexical bindings, and types are checked dynamically here. | Change a value and predict its type and result. |
| 2. Decisions and execution | if and cond choose expressions; for iterates through sequences. Functions are definitions with argument lists and lexical scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | Lists, vectors, hashes, and sets cover sequential and keyed data. Persistent updates create new values; set! changes a binding deliberately. | Handle empty, single-item, and repeated input. |
| 4. Organization | Lexical closures hide state; module provide declarations choose exported APIs. Higher-order operations compose transformations over immutable sequences. | Separate one responsibility into a named component. |
| 5. Reliability | Use semicolon notes, #\| \|# block comments, and #; to skip a form. The runtime manages object memory; port helpers delimit resource lifetime. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Threads can communicate through channels; CPU parallelism requires suitable facilities such as places. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use suitable sequence operations and avoid unnecessary intermediate lists. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `(define score 10)` | define names values; let creates lexical bindings, and types are checked dynamically here. |
| Control Flow Operations | `(for/sum ([value values]) value)` | if and cond choose expressions; for iterates through sequences. |
| Execution Blocks | `(define (add left right) (+ left right))` | Functions are definitions with argument lists and lexical scope. |
| Code Health & Documentation | `; comment; #\| block comment \|#` | Use semicolon notes, #\| \|# block comments, and #; to skip a form. |
| Built-In Collections | `(hash 'apples 3)` | Lists, vectors, hashes, and sets cover sequential and keyed data. |
| Data Mutability | `(hash-set inventory 'apples 4)` | Persistent updates create new values; set! changes a binding deliberately. |
| Access & Encapsulation | `(lambda () (set! count (add1 count)) count)` | Lexical closures hide state; module provide declarations choose exported APIs. |
| Design Paradigms & Patterns | `(map (lambda (value) (* value 2)) values)` | Higher-order operations compose transformations over immutable sequences. |
| Memory Management | `(call-with-input-string "sample" read-char)` | The runtime manages object memory; port helpers delimit resource lifetime. |
| Concurrency & Parallelism | `(thread (lambda () ...))` | Threads can communicate through channels; CPU parallelism requires suitable facilities such as places. |
| Performance Optimization | `(for/sum ([value (in-list values)]) ...)` | Use suitable sequence operations and avoid unnecessary intermediate lists. |

The code above is a compact reminder; use [hello.rkt](./hello.rkt) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Racket documentation](https://docs.racket-lang.org/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Racket Guide](https://docs.racket-lang.org/guide/) | Learn expressions, functions, modules, and language design. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Racket certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [DrRacket](https://docs.racket-lang.org/drracket/) | Edit, run, and debug programs interactively. | When developing and checking examples for this language. |
| [raco](https://docs.racket-lang.org/raco/) | Build modules, run tests, and manage packages. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Sequence summary | Functions, folds, empty data | Compute correct results without mutating inputs. |
| Small domain model | Records, modules, invariants | Expose operations that preserve valid state. |
| Concurrent result collector | Tasks, waiting, failures | Account for every started task. |

## Simple Mistakes To Avoid

- #lang selects a language; not every Racket-family language has identical forms.
- Lists are immutable by default; mutable pairs are a distinct facility.
- Module exports determine API visibility.
- Threads and parallel execution are different concepts; choose the runtime facility deliberately.

## Concise introductory examples

[examples.rkt](./examples.rkt) introduces structures, strings, symbols, booleans,
comments, functions, lists, higher-order operations, pattern matching, immutable
record updates, hashes, iteration, and comprehensions using a shelf catalog.

From this directory, run `racket examples.rkt` with the standard Racket
distribution. The `#lang racket` module needs no external packages and prints
catalog labels, available titles, lookup results, and fiction titles.
