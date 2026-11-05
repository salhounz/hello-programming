# Objective-C

Objective-C is used primarily in legacy Apple platform applications and frameworks.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Objective-C](#executing-objective-c)
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
| Objective-C | C-based object-oriented programming using the Objective-C runtime and Foundation frameworks. | [Objective-C documentation](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/) |
| Foundation | Strings, arrays, dictionaries, sets, and operation queues. | [Reference](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/) |
| Objective-C runtime | Message dispatch, class metadata, and object behavior. | [Reference](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/) |

## Executing Objective-C

### In this repository

Run: `clang -fobjc-arc -fblocks -framework Foundation hello.m -o hello && ./hello` on macOS.

Use macOS with Xcode Command Line Tools. This example uses Foundation, blocks, and automatic reference counting.

Open [hello.m](./hello.m) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

The Foundation framework and compiler flags here target Apple's platform. GNUstep environments need their own compiler and linker configuration.

## Concise introductory examples

Open [examples.m](./examples.m) for a short, self-contained introduction to scalar/object values, comments, a C function, Foundation collection literals, boxed booleans, fast enumeration, branching, mutable copies, ARC, and blocks.

On macOS with Xcode Command Line Tools and the Foundation SDK available, run these commands separately from this directory:

```sh
clang -fobjc-arc -fblocks -framework Foundation examples.m -o examples
./examples
```

Compile this file independently because it defines its own main function. This is a Foundation console program; it requires no iOS app host. The Apple framework flags do not apply unchanged to Windows or GNUstep.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | C types describe scalars; Objective-C pointers refer to dynamically messaged objects. | Change a value and predict its type and result. |
| 2. Decisions and execution | C flow-control statements and fast enumeration handle decisions and iteration. Methods group object behavior and blocks are callable values. | Exercise both outcomes of a small example. |
| 3. Data and updates | NSArray is ordered, NSDictionary maps keys, and NSSet stores distinct objects. Immutable and mutable Foundation collections differ; mutableCopy makes a shallow mutable copy. | Handle empty, single-item, and repeated input. |
| 4. Organization | An interface exposes operations while the implementation maintains instance state. Object composition and blocks support reusable behavior. | Separate one responsibility into a named component. |
| 5. Reliability | Use line and block comments; document methods and ownership contracts. ARC manages object references; autorelease pools bound deferred releases. | Check an edge case and explain resource lifetime. |
| 6. Execution model | NSOperationQueue schedules operations; the CLI waits so work finishes before exit. | Explain what can run independently and what must wait. |
| 7. Applied practice | Use collection membership operations and profile actual allocations and work. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `NSString *language = @"Objective-C";` | C types describe scalars; Objective-C pointers refer to dynamically messaged objects. |
| Control Flow Operations | `for (NSNumber *value in values)` | C flow-control statements and fast enumeration handle decisions and iteration. |
| Execution Blocks | `NSInteger (^add)(NSInteger, NSInteger)` | Methods group object behavior and blocks are callable values. |
| Code Health & Documentation | `// comment; /* block comment */` | Use line and block comments; document methods and ownership contracts. |
| Built-In Collections | `@{@"apples": @3}` | NSArray is ordered, NSDictionary maps keys, and NSSet stores distinct objects. |
| Data Mutability | `[values mutableCopy]` | Immutable and mutable Foundation collections differ; mutableCopy makes a shallow mutable copy. |
| Access & Encapsulation | `[counter increment]` | An interface exposes operations while the implementation maintains instance state. |
| Design Paradigms & Patterns | `[values filteredArrayUsingPredicate:predicate]` | Object composition and blocks support reusable behavior. |
| Memory Management | `__weak Counter *weakCounter = counter;` | ARC manages object references; autorelease pools bound deferred releases. |
| Concurrency & Parallelism | `[queue addOperationWithBlock:^{ ... }];` | NSOperationQueue schedules operations; the CLI waits so work finishes before exit. |
| Performance Optimization | `[unique containsObject:@2]` | Use collection membership operations and profile actual allocations and work. |

The code above is a compact reminder; use [hello.m](./hello.m) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [Objective-C documentation](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [Apple developer documentation](https://developer.apple.com/documentation/) | Look up Foundation APIs and framework contracts. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Objective-C certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [Xcode](https://developer.apple.com/xcode/) | Build and debug Apple-platform applications. | When developing and checking examples for this language. |
| [Objective-C guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/) | Review object messaging and memory management. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Validated converter | Types, functions, optional values | Reject invalid input and handle absent values. |
| Inventory summary | Collections and transformations | Calculate totals for empty and repeated entries. |
| Small asynchronous task | Scheduling and cleanup | Wait for completion and explain execution order. |

## Simple Mistakes To Avoid

- Use object comparison methods for content rather than pointer equality.
- ARC manages strong references; retained cycles still need design attention.
- Immutable collections and their mutable variants have different interfaces.
- Keep UI work on the appropriate main-thread execution context.
