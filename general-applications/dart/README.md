# Dart

Dart is used for cross-platform client applications, especially with Flutter.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Dart](#executing-dart)
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
| Dart | Statically typed, null-safe programming for client applications, servers, and Flutter. | [Dart documentation](https://dart.dev/guides) |
| Dart SDK | Compiler, runtime, analyzer, formatter, and package tools. | [Reference](https://dart.dev/guides) |
| Flutter | A UI framework using Dart; it is separate from the core language. | [Reference](https://flutter.dev/) |

## Executing Dart

### In this repository

Run: `dart run hello.dart`

Install a Dart SDK supporting sound null safety. Run dart analyze hello.dart and dart run hello.dart.

Open [hello.dart](./hello.dart) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a toolchain that matches the language version and platform described by the provider. Compiler-generated executables may need a different launch command on Windows.

## Concise introductory examples

Open [examples.dart](./examples.dart) for a short, self-contained introduction to inferred types, documentation comments, named parameters, null safety, lists/maps/sets, loops, iterable transformations, collection if/spread, and safe parsing.

With a Dart SDK supporting sound null safety (Dart 2.12 or newer), run from this directory:

```sh
dart analyze examples.dart
dart run examples.dart
```

This is a standalone Dart console program using core libraries; Flutter and a package project are unnecessary.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | var infers a static type; final fixes a binding and const describes a compile-time constant. | Change a value and predict its type and result. |
| 2. Decisions and execution | if, for, and null-aware operators handle decisions and absence. Functions have typed parameters and can use concise arrow bodies. | Exercise both outcomes of a small example. |
| 3. Data and updates | List is ordered, Map associates keys, and Set keeps unique members. Spread creates a shallow copy; const collections cannot be mutated. | Handle empty, single-item, and repeated input. |
| 4. Organization | Library-private fields and public getters keep representation behind a small API. Functions and iterable methods compose transformations without changing the input. | Separate one responsibility into a named component. |
| 5. Reliability | Use line and block comments and /// documentation on declarations. The runtime collects objects; clear retained collections and close resources you open. | Check an edge case and explain resource lifetime. |
| 6. Execution model | Future.wait coordinates async work; isolates provide independent execution for CPU work. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use sets for repeated membership checks and avoid needless toList conversions. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `final language = "Dart";` | var infers a static type; final fixes a binding and const describes a compile-time constant. |
| Control Flow Operations | `missing ?? "Guest"` | if, for, and null-aware operators handle decisions and absence. |
| Execution Blocks | `int add(int left, int right) => left + right;` | Functions have typed parameters and can use concise arrow bodies. |
| Code Health & Documentation | `/// API documentation` | Use line and block comments and /// documentation on declarations. |
| Built-In Collections | `final inventory = <String, int>{"apples": 3};` | List is ordered, Map associates keys, and Set keeps unique members. |
| Data Mutability | `final copied = [...values];` | Spread creates a shallow copy; const collections cannot be mutated. |
| Access & Encapsulation | `int _count = 0;` | Library-private fields and public getters keep representation behind a small API. |
| Design Paradigms & Patterns | `values.map((value) => value * 2).toList()` | Functions and iterable methods compose transformations without changing the input. |
| Memory Management | `cache.clear();` | The runtime collects objects; clear retained collections and close resources you open. |
| Concurrency & Parallelism | `await Future.wait([firstTask, secondTask])` | Future.wait coordinates async work; isolates provide independent execution for CPU work. |
| Performance Optimization | `allowed.contains("Ada")` | Use sets for repeated membership checks and avoid needless toList conversions. |

The code above is a compact reminder; use [hello.dart](./hello.dart) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Dart documentation](https://dart.dev/guides) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Dart language tour](https://dart.dev/language) | Learn null safety, functions, classes, and async features. | Tutorials and examples; check the provider for access terms. |
| [Dart tools](https://dart.dev/tools) | Explore DartPad, the analyzer, and debugger. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Dart certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Dart SDK tools](https://dart.dev/tools) | Format, analyze, run, and test packages. | When developing and checking examples for this language. |
| [DartPad](https://dartpad.dev/) | Try small Dart programs in a browser. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Typed inventory summary | Collections, validation, totals | Test empty data, repeated keys, and invalid values. |
| Reusable conversion library | Functions, interfaces, tests | Separate core rules from input/output. |
| Concurrent lookup demo | Tasks and error handling | Wait for all work and surface failures clearly. |

## Simple Mistakes To Avoid

- final prevents rebinding; a final collection may still be mutable.
- Use nullable types deliberately and avoid unnecessary null assertions.
- Futures do not automatically move CPU work into another isolate.
- Identifiers beginning with _ are private to a library, not just a class.
