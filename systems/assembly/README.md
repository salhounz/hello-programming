# Assembly (NASM)

Assembly provides direct, architecture-specific control over machine instructions. Assembly is specific to an instruction set and operating-system ABI; this example is not portable Windows assembly.

## Table of Contents

- [Understanding the Ecosystem](#understanding-the-ecosystem)
- [Executing Assembly (NASM)](#executing-assembly-nasm)
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
| Assembly (NASM) | NASM syntax for Linux x86-64 machine instructions and system-call interfaces. | [NASM documentation](https://www.nasm.us/docs.php) |
| Instruction set | x86-64 defines registers, instructions, and addressing modes. | [Reference](https://www.nasm.us/docs.php) |
| ELF and linker | Object files are linked into a Linux executable. | [Reference](https://www.nasm.us/docs.php) |

## Executing Assembly (NASM)

### In this repository

Run: `nasm -f elf64 hello.asm && ld -o hello hello.o && ./hello` on Linux x86-64.

Use NASM and the system linker on Linux x86-64. The ELF64 binary uses Linux syscall numbers and cannot run directly as a Windows PE executable.

Open [hello.asm](./hello.asm) for the 11 annotated topic sections. The examples use small, local values. Some results are retained in variables rather than printed; inspect them with the debugger or output operation for this language.

Use a compatible Linux environment for assembly and execution. Register use here follows the Linux x86-64 syscall interface, not a C function-call wrapper.

## Concise introductory examples

Open [examples.asm](./examples.asm) for a standalone introduction: Byte flags, contiguous arrays, registers, loops, branches, local procedure conventions, and Linux syscalls.

Linux x86-64 with NASM and the system linker is required (a compatible WSL Linux environment also works). This uses ELF64 and Linux syscall numbers, not the Windows ABI. From this directory in that Linux shell:

```sh
nasm -f elf64 examples.asm -o examples.o
ld -o examples examples.o
./examples
```

Prints `Completed: 2`. The single-digit formatter is intentionally limited to this three-flag sample; output failure or a short write returns status 1.

## Example Learning Path

This is a suggested practice order, independent of any provider's certification requirements.

| Stage | Focus | Practice milestone |
| --- | --- | --- |
| 1. Foundations | Registers hold bit patterns; directives reserve initialized data and define constants. | Change a value and predict its type and result. |
| 2. Decisions and execution | Comparisons set flags and conditional jumps choose the next instruction. Labels name positions; a loop combines a counter, branch, and body. | Exercise both outcomes of a small example. |
| 3. Data and updates | Arrays are contiguous data with explicitly calculated element sizes and addresses. Memory writes change storage; mov copies bits rather than creating object ownership. | Handle empty, single-item, and repeated input. |
| 4. Organization | Export only required symbols; labels themselves do not enforce private memory access. Separate data representation from reusable instruction sequences and ABI boundaries. | Separate one responsibility into a named component. |
| 5. Reliability | NASM uses semicolon comments; use adjacent lines for multi-line explanations. Stack operations adjust storage explicitly; every push needs a matching lifetime decision. | Check an edge case and explain resource lifetime. |
| 6. Execution model | A lock-prefixed instruction can update shared memory atomically; it does not create a thread. | Explain what can run independently and what must wait. |
| 7. Applied practice | Measure real workloads; choose instruction widths and memory access deliberately. | Finish a project below and measure before optimizing. |

## Quick Reference

| Topic | Example / reminder | Helpful detail |
| --- | --- | --- |
| Type Systems & Variables | `mov r8, 10` | Registers hold bit patterns; directives reserve initialized data and define constants. |
| Control Flow Operations | `cmp r8, 10; jl .below_limit` | Comparisons set flags and conditional jumps choose the next instruction. |
| Execution Blocks | `dec rcx; jnz .loop` | Labels name positions; a loop combines a counter, branch, and body. |
| Code Health & Documentation | `; comment` | NASM uses semicolon comments; use adjacent lines for multi-line explanations. |
| Built-In Collections | `mov r11, [r10 + 8]` | Arrays are contiguous data with explicitly calculated element sizes and addresses. |
| Data Mutability | `mov r12, r11` | Memory writes change storage; mov copies bits rather than creating object ownership. |
| Access & Encapsulation | `global _start` | Export only required symbols; labels themselves do not enforce private memory access. |
| Design Paradigms & Patterns | `xor r14, r14` | Separate data representation from reusable instruction sequences and ABI boundaries. |
| Memory Management | `push rbx; pop rbx` | Stack operations adjust storage explicitly; every push needs a matching lifetime decision. |
| Concurrency & Parallelism | `lock inc qword [rel shared_count]` | A lock-prefixed instruction can update shared memory atomically; it does not create a thread. |
| Performance Optimization | `xor r15d, r15d` | Measure real workloads; choose instruction widths and memory access deliberately. |

The code above is a compact reminder; use [hello.asm](./hello.asm) for the declarations, imports, and surrounding context.

## Available Learning Resources

| Resource | Best for | Format and access |
| --- | --- | --- |
| [NASM documentation](https://www.nasm.us/docs.php) | Language and platform reference. | Provider documentation; follow the topics used in the local example. |
| [NASM manual](https://www.nasm.us/docs.html) | Read instruction syntax, sections, directives, and output formats. | Tutorials and examples; check the provider for access terms. |

Choose one main learning route and reproduce its examples before adding more resources.

## Available Certificates & Certifications

This guide does not list a verified standalone Assembly (NASM) certification. Use the learning resources above and the projects below to demonstrate practical skills; documentation study and a project portfolio are not certificates.

Provider links were reviewed on **October 30, 2026**. Follow them for current versions, prerequisites, assessment rules, availability, and pricing.

## Helpful Developer Tools

| Tool | Purpose | When to use it |
| --- | --- | --- |
| [NASM](https://www.nasm.us/) | Assemble source into ELF64 objects. | When developing and checking examples for this language. |
| [GDB](https://sourceware.org/gdb/documentation/) | Step through machine instructions and inspect registers. | When developing and checking examples for this language. |

## Simple Project Examples

| Project | Skills to practice | A useful definition of done |
| --- | --- | --- |
| Integer sum | Registers, loops, addressing | Compute a sum and inspect the final register. |
| Byte buffer transform | Memory addressing and bounds | Change only bytes within the allocated buffer. |
| System-call tracer exercise | ABI and error returns | Explain arguments and return values for each syscall. |

## Simple Mistakes To Avoid

- Match architecture, assembler syntax, object format, and operating system.
- A register has no high-level type; instruction width determines interpretation.
- Preserve registers required by a calling convention when calling functions.
- Check syscall return conventions rather than assuming every operation succeeds.
