# C++

C++ is used for systems, games, desktop applications, and other performance-sensitive software.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing C++](#executing-c)
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
| C++ | Compiled programming with templates, classes, value semantics, and deterministic resource cleanup. | [ISO C++ documentation](https://isocpp.org/std/the-standard) |
| Standard library | Containers, algorithms, smart pointers, and concurrency facilities. | [Reference](https://isocpp.org/std/the-standard) |
| RAII | Resources are acquired by objects and released by their destructors. | [Reference](https://isocpp.org/std/the-standard) |

## Executing C++

### In this repository

Run: `c++ -std=c++17 -Wall -Wextra -pthread hello.cpp -o hello && ./hello`

Use a C++17-capable compiler. -pthread is for toolchains such as GCC and Clang on Unix-like hosts; adapt thread-linking flags for your platform.

Open [hello.cpp](./hello.cpp) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.cpp](./examples.cpp) for a standalone introduction: Value types, strings, structs, vectors, maps, references, lambdas, standard algorithms, structured bindings, and container copies.

Use a C++17 compiler and standard library. From this directory in a Unix-like shell:

```sh
c++ -std=c++17 -Wall -Wextra -pedantic examples.cpp -o examples
./examples
```

On Windows, launch the resulting executable with `.\examples.exe` in PowerShell. No thread library or external package is needed. Prints tasks, counts, and independent original/draft names.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | auto infers a static type; const prevents writes to the declared object. | Change a value and predict its type and result. |
| 2. Decisions and execution | Range-based loops visit collection elements; if handles decisions. Lambdas are callable objects and braces delimit local scope. | Exercise both outcomes of a small example. |
| 3. Data and updates | vector is a dynamic sequence, map orders keys, and unordered_set stores unique values. Containers copy their elements; references alias existing objects. | Handle empty, single-item, and repeated input. |
| 4. Organization | Classes can keep state private and expose a small public interface. Algorithms and callables support generic, composable operations. | Separate one responsibility into a named component. |
| 5. Reliability | Use line comments, block comments, and documentation tools for public contracts. RAII releases resources on scope exit; unique_ptr expresses exclusive ownership. | Check an edge case and explain resource lifetime. |
| 6. Execution model | std::async with launch::async requests asynchronous execution; get waits and propagates errors. | Explain what can run independently and what must wait. |
| 7. Applied practice | Reserve capacity when a useful size is known; measure allocations and runtime. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `const int limit = 20;` | auto infers a static type; const prevents writes to the declared object. |
| Control Flow Operations | `for (int value : values)` | Range-based loops visit collection elements; if handles decisions. |
| Execution Blocks | `[](int left, int right) { return left + right; }` | Lambdas are callable objects and braces delimit local scope. |
| Code Health & Documentation | `// comment; /* block comment */` | Use line comments, block comments, and documentation tools for public contracts. |
| Built-In Collections | `std::vector<int> values{1, 2, 3};` | vector is a dynamic sequence, map orders keys, and unordered_set stores unique values. |
| Data Mutability | `auto copied = values; auto& alias = values;` | Containers copy their elements; references alias existing objects. |
| Access & Encapsulation | `class Counter { /* private by default */ };` | Classes can keep state private and expose a small public interface. |
| Design Paradigms & Patterns | `std::accumulate(values.begin(), values.end(), 0)` | Algorithms and callables support generic, composable operations. |
| Memory Management | `std::make_unique<int>(42)` | RAII releases resources on scope exit; unique_ptr expresses exclusive ownership. |
| Concurrency & Parallelism | `std::async(std::launch::async, task)` | std::async with launch::async requests asynchronous execution; get waits and propagates errors. |
| Performance Optimization | `batch.reserve(100);` | Reserve capacity when a useful size is known; measure allocations and runtime. |

The code above is a compact reminder; use [hello.cpp](./hello.cpp) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [ISO C++ documentation](https://isocpp.org/std/the-standard) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [ISO C++ getting started](https://isocpp.org/get-started) | Choose a compiler and learning route. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone C++ certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [GCC C++](https://gcc.gnu.org/onlinedocs/) | Build and check programs with warnings enabled. | When developing and checking examples for this language. |
| [GDB](https://sourceware.org/gdb/documentation/) | Inspect state, stack frames, and failures. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Unit converter | Types, functions, input validation | Reject invalid values and test boundary cases. |
| Inventory summary | Collections and transformations | Handle empty data and repeated keys correctly. |
| Bounded cache | Ownership and lookup behavior | Limit retained entries and explain cleanup. |

## Simple Mistakes To Avoid

- Prefer standard containers and smart pointers over owning raw pointers.
- A reference can dangle when its referent is destroyed or invalidated.
- Do not share mutable state across threads without synchronization.
- Check iterator invalidation rules before modifying a container while iterating.
