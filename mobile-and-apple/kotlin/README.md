# Kotlin

Kotlin is used for Android, server-side, and multiplatform applications.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Kotlin](#executing-kotlin)
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
| Kotlin | Statically typed programming with null safety, extension functions, collections, and JVM interoperability. | [Kotlin documentation](https://kotlinlang.org/docs/home.html) |
| Kotlin/JVM | Compiles to JVM bytecode and can call Java APIs. | [Reference](https://kotlinlang.org/docs/home.html) |
| Multiplatform | Other Kotlin targets have different platform APIs and threading facilities. | [Reference](https://kotlinlang.org/docs/home.html) |

## Executing Kotlin

### In this repository

Run: `kotlinc Hello.kt -include-runtime -d hello.jar && java -jar hello.jar`

Use Kotlin/JVM with a JDK. This standalone example uses Java's executor service and does not require kotlinx.coroutines.

Open [Hello.kt](./Hello.kt) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.kt](./examples.kt) for a short, self-contained introduction to static/nullable types, KDoc, functions, data classes, read-only/mutable collections, loops, lambdas, when expressions, copies, and safe parsing.

With the Kotlin/JVM compiler and a compatible JDK on PATH, run these commands separately from this directory:

```sh
kotlinc examples.kt -include-runtime -d examples.jar
java -jar examples.jar
```

Compile only this source, which has its own main function. This console example requires neither Android nor kotlinx.coroutines.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | var is reassignable; val fixes a binding, and nullable types end in ?. | Change a value and predict its type and result. |
| 2. Decisions and execution | if and when are expressions; for iterates through ranges and collections. Functions can use expression bodies and default arguments. | Exercise both outcomes of a small example. |
| 3. Data and updates | List is ordered, Map associates keys, and Set removes duplicate members. Read-only and mutable collection interfaces differ; toMutableList makes a shallow copy. | Handle empty, single-item, and repeated input. |
| 4. Organization | Visibility and private setters keep updates behind explicit operations. Higher-order collection operations and lambdas support functional composition. | Separate one responsibility into a named component. |
| 5. Reliability | Use //, nested block comments, and KDoc on declarations. JVM garbage collection handles objects; use closes a supported resource after the block. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Executor services run tasks on JVM worker threads; shutdown releases the service. | Explain what can run independently and what must wait. |
| 7. Applied practice | Reuse sets for membership checks and avoid intermediate collections in large pipelines. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `val missingName: String? = null` | var is reassignable; val fixes a binding, and nullable types end in ?. |
| Control Flow Operations | `missingName ?: "Guest"` | if and when are expressions; for iterates through ranges and collections. |
| Execution Blocks | `fun add(left: Int, right: Int): Int` | Functions can use expression bodies and default arguments. |
| Code Health & Documentation | `/** KDoc documentation */` | Use //, nested block comments, and KDoc on declarations. |
| Built-In Collections | `mapOf("apples" to 3)` | List is ordered, Map associates keys, and Set removes duplicate members. |
| Data Mutability | `values.toMutableList()` | Read-only and mutable collection interfaces differ; toMutableList makes a shallow copy. |
| Access & Encapsulation | `private set` | Visibility and private setters keep updates behind explicit operations. |
| Design Paradigms & Patterns | `values.map { it * 2 }` | Higher-order collection operations and lambdas support functional composition. |
| Memory Management | `resource.use { ... }` | JVM garbage collection handles objects; use closes a supported resource after the block. |
| Concurrency & Parallelism | `executor.submit<Int> { 42 }` | Executor services run tasks on JVM worker threads; shutdown releases the service. |
| Performance Optimization | `"Ada" in allowed` | Reuse sets for membership checks and avoid intermediate collections in large pipelines. |

The code above is a compact reminder; use [Hello.kt](./Hello.kt) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Kotlin documentation](https://kotlinlang.org/docs/home.html) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Kotlin Tour](https://kotlinlang.org/docs/kotlin-tour-welcome.html) | Work through language basics and exercises. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Kotlin certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Kotlin compiler](https://kotlinlang.org/docs/command-line.html) | Compile source and package the JVM runtime. | When developing and checking examples for this language. |
| [Kotlin Playground](https://play.kotlinlang.org/) | Try small language examples in a browser. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Validated converter | Types, functions, optional values | Reject invalid input and handle absent values. |
| Inventory summary | Collections and transformations | Calculate totals for empty and repeated entries. |
| Small asynchronous task | Scheduling and cleanup | Wait for completion and explain execution order. |

## Simple Mistakes To Avoid

- val prevents reassignment but does not freeze an object's contents.
- Prefer safe calls and Elvis defaults over unchecked !! assertions.
- List is a read-only interface, not a guarantee of deep immutability.
- JVM APIs do not work unchanged on every Kotlin target.
