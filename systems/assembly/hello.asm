section .data
    message db "Hello, World!", 10
    message_length equ $ - message
    numbers dq 1, 2, 3
    shared_count dq 0

section .text
    global _start

_start:

    ;
    ;    Type Systems & Variables
    ;
    ; Registers hold bit patterns; directives reserve initialized data and define constants.
    mov r8, 10
    add r8, 5
    mov r9, message_length

    ;
    ;    Control Flow Operations
    ;
    ; Comparisons set flags and conditional jumps choose the next instruction.
    cmp r8, 10
    jl .below_limit
    inc r8
    .below_limit:

    ;
    ;    Execution Blocks
    ;
    ; Labels name positions; a loop combines a counter, branch, and body.
    mov rcx, 3
    .loop:
        dec rcx
        jnz .loop

    ;
    ;    Code Health & Documentation
    ;
    ; NASM uses semicolon comments; use adjacent lines for multi-line explanations.
    ; A single-line comment.
    ; A longer explanation can occupy several lines.
    ; Record register and stack assumptions.

    ;
    ;    Built-In Collections
    ;
    ; Arrays are contiguous data with explicitly calculated element sizes and addresses.
    lea r10, [rel numbers]
    mov r11, [r10 + 8]

    ;
    ;    Data Mutability
    ;
    ; Memory writes change storage; mov copies bits rather than creating object ownership.
    mov r12, r11
    inc r12

    ;
    ;    Access & Encapsulation
    ;
    ; Export only required symbols; labels themselves do not enforce private memory access.
    lea r13, [rel message]

    ;
    ;    Design Paradigms & Patterns
    ;
    ; Separate data representation from reusable instruction sequences and ABI boundaries.
    xor r14, r14
    add r14, r12

    ;
    ;    Memory Management
    ;
    ; Stack operations adjust storage explicitly; every push needs a matching lifetime decision.
    push rbx
    mov rbx, 42
    pop rbx

    ;
    ;    Concurrency & Parallelism
    ;
    ; A lock-prefixed instruction can update shared memory atomically; it does not create a thread.
    lock inc qword [rel shared_count]

    ;
    ;    Performance Optimization
    ;
    ; Measure real workloads; choose instruction widths and memory access deliberately.
    xor r15d, r15d
    add r15, [rel numbers]

    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, message_length
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
