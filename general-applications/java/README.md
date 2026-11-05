# Java

Java is used for enterprise, server, desktop, and Android applications.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Java](#executing-java)
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
| Java | Statically typed programming compiled to JVM bytecode, with classes, generics, and managed memory. | [Java documentation](https://docs.oracle.com/en/java/) |
| JDK | Includes compiler, JVM tools, and standard class libraries. | [Reference](https://docs.oracle.com/en/java/) |
| JVM | Executes bytecode and manages object memory. | [Reference](https://docs.oracle.com/en/java/) |

## Executing Java

### In this repository

Run: `javac Hello.java && java Hello`

Use a JDK with javac and java on PATH. These examples use Java 8 language/library facilities and compile as a single source file.

Open [Hello.java](./Hello.java) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.java](./examples.java) for a short, self-contained introduction to static types, Javadoc, methods, generic collections, branching, loops, streams/lambdas, shallow copies, and Optional defaults.

With JDK 8 or newer and both tools on PATH, run these commands separately from this directory:

```sh
javac examples.java
java examples
```

The public class is deliberately lowercase `examples` to match the requested lowercase filename; `javac` requires the public class and filename to match. Compile this source independently. It needs only the JDK standard library.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Declarations specify static types; final prevents reassignment of a binding. | Change a value and predict its type and result. |
| 2. Decisions and execution | if, switch, and loops direct execution. Methods group operations; braces restrict local scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | List is ordered, Map associates keys, and Set stores distinct members. References can share mutable objects; collection constructors make shallow copies. | Handle empty, single-item, and repeated input. |
| 4. Organization | Private fields hide state; the Counter helper exposes only selected operations. Streams and lambdas support declarative transformations; interfaces define contracts. | Separate one responsibility into a named component. |
| 5. Reliability | Use //, block comments, and Javadoc for public contracts. Garbage collection handles object storage; try-with-resources closes AutoCloseable resources. | Check an edge case and explain resource lifetime. |
| 6. Execution model | CompletableFuture can schedule work; join waits and propagates a failure. | Explain what can run independently and what must wait. |
| 7. Applied practice | Preallocate suitable collections and measure before changing algorithms or allocations. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `final String language = "Java";` | Declarations specify static types; final prevents reassignment of a binding. |
| Control Flow Operations | `for (int index = 0; index < 3; index++)` | if, switch, and loops direct execution. |
| Execution Blocks | `private static int add(int left, int right)` | Methods group operations; braces restrict local scope. |
| Code Health & Documentation | `// comment; /** Javadoc */` | Use //, block comments, and Javadoc for public contracts. |
| Built-In Collections | `Map<String, Integer> inventory = new HashMap<>();` | List is ordered, Map associates keys, and Set stores distinct members. |
| Data Mutability | `new ArrayList<>(values)` | References can share mutable objects; collection constructors make shallow copies. |
| Access & Encapsulation | `private int count;` | Private fields hide state; the Counter helper exposes only selected operations. |
| Design Paradigms & Patterns | `values.stream().mapToInt(Integer::intValue).sum()` | Streams and lambdas support declarative transformations; interfaces define contracts. |
| Memory Management | `try (StringReader reader = new StringReader("sample"))` | Garbage collection handles object storage; try-with-resources closes AutoCloseable resources. |
| Concurrency & Parallelism | `CompletableFuture.supplyAsync(() -> 42)` | CompletableFuture can schedule work; join waits and propagates a failure. |
| Performance Optimization | `new ArrayList<>(100)` | Preallocate suitable collections and measure before changing algorithms or allocations. |

The code above is a compact reminder; use [Hello.java](./Hello.java) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Java documentation](https://docs.oracle.com/en/java/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Dev.java tutorials](https://dev.java/learn/) | Learn language basics, collections, streams, and tools. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Java certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [JDK tools](https://docs.oracle.com/en/java/) | Compile, run, debug, and inspect Java applications. | When developing and checking examples for this language. |
| [Dev.java learning tools](https://dev.java/learn/) | Explore JShell and project workflows with a suitable JDK. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Typed inventory summary | Collections, validation, totals | Test empty data, repeated keys, and invalid values. |
| Reusable conversion library | Functions, interfaces, tests | Separate core rules from input/output. |
| Concurrent lookup demo | Tasks and error handling | Wait for all work and surface failures clearly. |

## Simple Mistakes To Avoid

- Use equals for object content comparisons; == compares reference identity.
- Generics describe element types but cannot prevent all runtime input errors.
- Close resources with try-with-resources.
- Do not mutate shared collections concurrently without the right synchronization.
