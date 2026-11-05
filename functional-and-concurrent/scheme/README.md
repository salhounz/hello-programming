# Scheme

Scheme is a minimalist Lisp used for functional programming and computer science education.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Scheme](#executing-scheme)
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
| Scheme | A Lisp emphasizing lexical scope, procedures, recursion, and explicit evaluation rules. | [Scheme standards](https://standards.scheme.org/) |
| Scheme reports | Define language standards such as R7RS. | [Reference](https://standards.scheme.org/) |
| GNU Guile | The selected interpreter supplies modules, hash tables, and threads. | [Reference](https://www.gnu.org/software/guile/manual/) |

## Executing Scheme

### In this repository

Run: `guile hello.scm`

The command and extension examples target GNU Guile. Hash tables and threads here are Guile facilities, not promises about every Scheme implementation.

Open [hello.scm](./hello.scm) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | define names a binding and let introduces lexical locals. | Change a value and predict its type and result. |
| 2. Decisions and execution | if chooses an expression result; named let expresses a recursive loop. Procedures and lambdas organize reusable calculations. | Exercise both outcomes of a small example. |
| 3. Data and updates | Lists and vectors are core collections; Guile hash tables provide keyed storage. set! changes a binding; construct fresh lists when an independent value is needed. | Handle empty, single-item, and repeated input. |
| 4. Organization | Closures retain lexical state while exposing a procedure interface. Functional transformations use procedures as arguments without changing the input. | Separate one responsibility into a named component. |
| 5. Reliability | Semicolons introduce comments; use adjacent lines for portable multi-line notes. The implementation manages object memory; port helpers delimit stream lifetimes. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Guile's thread extension starts work and join-thread waits for completion. | Explain what can run independently and what must wait. |
| 7. Applied practice | Tail-recursive loops avoid accumulating pending calls when written in tail position. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `(let ((score 10)) (+ score 5))` | define names a binding and let introduces lexical locals. |
| Control Flow Operations | `(if condition consequent alternative)` | if chooses an expression result; named let expresses a recursive loop. |
| Execution Blocks | `(define (add left right) (+ left right))` | Procedures and lambdas organize reusable calculations. |
| Code Health & Documentation | `; comment` | Semicolons introduce comments; use adjacent lines for portable multi-line notes. |
| Built-In Collections | `(hash-set! inventory 'apples 3)` | Lists and vectors are core collections; Guile hash tables provide keyed storage. |
| Data Mutability | `(set! copied (cons 0 copied))` | set! changes a binding; construct fresh lists when an independent value is needed. |
| Access & Encapsulation | `(lambda () (set! count (+ count 1)) count)` | Closures retain lexical state while exposing a procedure interface. |
| Design Paradigms & Patterns | `(map (lambda (value) (* value 2)) values)` | Functional transformations use procedures as arguments without changing the input. |
| Memory Management | `(call-with-input-string "sample" reader)` | The implementation manages object memory; port helpers delimit stream lifetimes. |
| Concurrency & Parallelism | `(call-with-new-thread (lambda () 42))` | Guile's thread extension starts work and join-thread waits for completion. |
| Performance Optimization | `(let loop ((rest items) (sum 0)) ...)` | Tail-recursive loops avoid accumulating pending calls when written in tail position. |

The code above is a compact reminder; use [hello.scm](./hello.scm) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Scheme standards](https://standards.scheme.org/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Guile manual](https://www.gnu.org/software/guile/manual/) | Study the selected implementation and its extensions. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Scheme certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [GNU Guile](https://www.gnu.org/software/guile/) | Run scripts and use the REPL. | When developing and checking examples for this language. |
| [Scheme standards](https://standards.scheme.org/) | Check portability between Scheme implementations. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Sequence summary | Functions, folds, empty data | Compute correct results without mutating inputs. |
| Small domain model | Records, modules, invariants | Expose operations that preserve valid state. |
| Concurrent result collector | Tasks, waiting, failures | Account for every started task. |

## Simple Mistakes To Avoid

- Quoted literal data should not be destructively modified.
- Different Scheme implementations support different modules and extensions.
- Use equal? for structural comparisons where appropriate.
- Prefer named lexical bindings over uncontrolled top-level mutation.

## Concise introductory examples

[examples.scm](./examples.scm) introduces strings, symbols, booleans, comments,
procedures, association lists, vectors, named-let recursion, conditionals,
list transformations, and fresh-data updates through a shelf catalog.

From this directory, run `guile --no-auto-compile -s examples.scm` with GNU Guile
3.x. The example uses Guile's `assq-ref` and `(ice-9 format)` facilities; it is
not a claim of portability to every Scheme. It prints catalog labels, available
titles, an empty-list result, and the opening time without generating a cache.
