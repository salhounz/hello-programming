# Clojure

Clojure is a functional Lisp used for data-oriented applications on the JVM.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Clojure](#executing-clojure)
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
| Clojure | A JVM Lisp with persistent data structures, sequences, and explicit state-management tools. | [Clojure learning guides](https://clojure.org/guides/learn/clojure) |
| Persistent collections | Updates produce new values while safely sharing unchanged structure. | [Reference](https://clojure.org/guides/learn/clojure) |
| JVM | Supplies runtime services and Java interoperation. | [Reference](https://clojure.org/guides/learn/clojure) |

## Executing Clojure

### In this repository

Run: `clojure -M hello.clj`

Install the compiler, interpreter, or host described in the linked documentation, then use the command above from this directory.

Open [hello.clj](./hello.clj) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | let creates lexical bindings; def names namespace-level values and types belong to values. | Change a value and predict its type and result. |
| 2. Decisions and execution | if returns a value; doseq iterates for effects while map transforms sequences. Functions and lexical let blocks group reusable expressions. | Exercise both outcomes of a small example. |
| 3. Data and updates | Vectors are indexed, lists are sequential, maps associate keys, and sets store unique values. Persistent updates return a new collection; atoms provide controlled mutable references. | Handle empty, single-item, and repeated input. |
| 4. Organization | Namespaces organize APIs; defn- marks a namespace-private function. Pure functions and higher-order sequence operations separate computation from effects. | Separate one responsibility into a named component. |
| 5. Reliability | Semicolons introduce comments; docstrings document functions and comment forms skip evaluation. JVM GC handles objects; with-open closes resources that implement the close contract. | Check an edge case and explain resource lifetime. |
| 6. Execution model | future starts work through a thread pool; dereferencing waits for the result. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use sets for membership and avoid realizing large lazy sequences unnecessarily. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `(let [score 10] (+ score 5))` | let creates lexical bindings; def names namespace-level values and types belong to values. |
| Control Flow Operations | `(if condition :pass :retry)` | if returns a value; doseq iterates for effects while map transforms sequences. |
| Execution Blocks | `(defn add [left right] (+ left right))` | Functions and lexical let blocks group reusable expressions. |
| Code Health & Documentation | `;; comment; defn docstring; (comment ...)` | Semicolons introduce comments; docstrings document functions and comment forms skip evaluation. |
| Built-In Collections | `{:apples 3}` | Vectors are indexed, lists are sequential, maps associate keys, and sets store unique values. |
| Data Mutability | `(conj values 4)` | Persistent updates return a new collection; atoms provide controlled mutable references. |
| Access & Encapsulation | `(defn- double-value [value] ...)` | Namespaces organize APIs; defn- marks a namespace-private function. |
| Design Paradigms & Patterns | `(reduce + 0 values)` | Pure functions and higher-order sequence operations separate computation from effects. |
| Memory Management | `(with-open [reader ...] ...)` | JVM GC handles objects; with-open closes resources that implement the close contract. |
| Concurrency & Parallelism | `(future (+ 20 22))` | future starts work through a thread pool; dereferencing waits for the result. |
| Performance Optimization | `(contains? allowed "Ada")` | Use sets for membership and avoid realizing large lazy sequences unnecessarily. |

The code above is a compact reminder; use [hello.clj](./hello.clj) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Clojure learning guides](https://clojure.org/guides/learn/clojure) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Clojure reference](https://clojure.org/reference/reader) | Understand reader forms, literals, and evaluation. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Clojure certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Clojure CLI](https://clojure.org/guides/deps_and_cli) | Run scripts and manage dependencies. | When developing and checking examples for this language. |
| [Clojure REPL](https://clojure.org/guides/repl/introduction) | Explore expressions and inspect function documentation. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Sequence summary | Functions, folds, empty data | Compute correct results without mutating inputs. |
| Small domain model | Records, modules, invariants | Expose operations that preserve valid state. |
| Concurrent result collector | Tasks, waiting, failures | Account for every started task. |

## Simple Mistakes To Avoid

- Bindings and persistent values are not ordinary mutable variables.
- Lazy sequences may defer work and retain references until consumed.
- Atoms coordinate individual state changes; use the appropriate abstraction for coordinated state.
- future uses a thread pool; shut down agents in a one-shot CLI script when needed.

## Concise introductory examples

[examples.clj](./examples.clj) introduces values, comments and docstrings, functions,
map destructuring, vectors, sets, pipelines, immutable updates, branching, iteration,
and atom state through a small shelf catalog.

From this directory, with Clojure CLI and a compatible JDK available, run
`clojure -M examples.clj`. It uses only Clojure's standard library and prints the
catalog, available titles, and the difference between an original and updated book.
