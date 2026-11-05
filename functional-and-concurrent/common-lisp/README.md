# Common Lisp

Common Lisp is a general-purpose, multi-paradigm member of the Lisp family.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Common Lisp](#executing-common-lisp)
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
| Common Lisp | A Lisp with dynamic types, lexical scope, generic functions, macros, and implementation-specific runtime features. | [Common Lisp HyperSpec](https://www.lispworks.com/documentation/HyperSpec/Front/) |
| ANSI Common Lisp | Defines the portable core language and standard library. | [Reference](https://www.lispworks.com/documentation/HyperSpec/Front/) |
| Implementation extensions | Compilers supply threading, profiling, and deployment facilities. | [Reference](https://www.lispworks.com/documentation/HyperSpec/Front/) |

## Executing Common Lisp

### In this repository

Run: `sbcl --script hello.lisp`

The run command targets SBCL. The threading example is guarded by the sb-thread feature; threading is not part of ANSI Common Lisp.

Open [hello.lisp](./hello.lisp) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | let creates lexical bindings; defparameter defines a special variable by convention named with *. | Change a value and predict its type and result. |
| 2. Decisions and execution | if returns a value; loop and dolist express iteration. defun declares a function and let provides local bindings. | Exercise both outcomes of a small example. |
| 3. Data and updates | Lists are linked sequences, vectors are indexed, and hash tables map keys. copy-list copies the list spine; nested objects remain shared. | Handle empty, single-item, and repeated input. |
| 4. Organization | Lexical closures can hide state without publishing its storage. Higher-order functions and generic operations support several programming paradigms. | Separate one responsibility into a named component. |
| 5. Reliability | Semicolons mark line comments; #\| \|# supports block comments and functions can have docstrings. The implementation manages objects; resource macros guarantee cleanup on control transfer. | Check an edge case and explain resource lifetime. |
| 6. Execution model | SBCL threads are an implementation extension; join-thread waits and returns results. | Explain what can run independently and what must wait. |
| 7. Applied practice | Choose data structures and allocation patterns using measured compiler/runtime behavior. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `(let ((score 10)) (+ score 5))` | let creates lexical bindings; defparameter defines a special variable by convention named with *. |
| Control Flow Operations | `(dolist (value values) ...)` | if returns a value; loop and dolist express iteration. |
| Execution Blocks | `(defun add (left right) (+ left right))` | defun declares a function and let provides local bindings. |
| Code Health & Documentation | `; comment; #\| block comment \|#` | Semicolons mark line comments; #\| \|# supports block comments and functions can have docstrings. |
| Built-In Collections | `(make-hash-table :test 'equal)` | Lists are linked sequences, vectors are indexed, and hash tables map keys. |
| Data Mutability | `(copy-list *values*)` | copy-list copies the list spine; nested objects remain shared. |
| Access & Encapsulation | `(lambda () (incf count))` | Lexical closures can hide state without publishing its storage. |
| Design Paradigms & Patterns | `(mapcar function values)` | Higher-order functions and generic operations support several programming paradigms. |
| Memory Management | `(with-input-from-string (stream "sample") ...)` | The implementation manages objects; resource macros guarantee cleanup on control transfer. |
| Concurrency & Parallelism | `(sb-thread:make-thread (lambda () 42))` | SBCL threads are an implementation extension; join-thread waits and returns results. |
| Performance Optimization | `(gethash "Ada" *allowed*)` | Choose data structures and allocation patterns using measured compiler/runtime behavior. |

The code above is a compact reminder; use [hello.lisp](./hello.lisp) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Common Lisp HyperSpec](https://www.lispworks.com/documentation/HyperSpec/Front/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [SBCL manual](https://www.sbcl.org/manual/) | Learn the runtime, debugger, compiler, and thread extensions. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Common Lisp certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [SBCL](https://www.sbcl.org/manual/) | Run scripts or use the interactive compiler and debugger. | When developing and checking examples for this language. |
| [Common Lisp HyperSpec](https://www.lispworks.com/documentation/HyperSpec/Front/) | Check portable language contracts. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Sequence summary | Functions, folds, empty data | Compute correct results without mutating inputs. |
| Small domain model | Records, modules, invariants | Expose operations that preserve valid state. |
| Concurrent result collector | Tasks, waiting, failures | Account for every started task. |

## Simple Mistakes To Avoid

- Use equal for structural comparisons when appropriate; eq tests identity-like behavior.
- Quoted literal lists should not be destructively modified.
- setf can update many places; mutation should be deliberate.
- Threads and package libraries may be implementation-specific.

## Concise introductory examples

[examples.lisp](./examples.lisp) introduces structures, strings, symbols, booleans,
comments, documented functions, lists, filtering, loops, hash tables, multiple
return values, structure copying, and a lexical closure using a shelf catalog.

From this directory, run `sbcl --script examples.lisp` with SBCL installed.
The example needs no third-party libraries or thread extensions and prints book
statuses, available titles, lookup results, and closure state.
