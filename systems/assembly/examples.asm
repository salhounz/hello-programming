; NASM, Linux x86-64: count completed tasks stored as byte flags.
; Bytes have no intrinsic bool type: we choose zero=false, one=true.
default rel
global _start

section .data
    flags db 1, 0, 1
    task_count equ $ - flags
    summary db "Completed: "
    digit db "0", 10
    summary_length equ $ - summary

section .text
_start:
    lea rsi, [flags]          ; Pointer to the first flag.
    mov ecx, task_count      ; Number of elements to inspect.
    call count_done

    ; This display handles a single digit (our fixed sample has 3 tasks).
    add al, '0'
    mov [digit], al
    lea rsi, [summary]
    mov edx, summary_length
    call write_stdout
    test rax, rax
    js .failed              ; Linux returns negative errno on failure.
    cmp rax, summary_length
    jne .failed             ; Treat a short write as failure in this demo.
    xor edi, edi            ; Exit status 0.
    jmp .exit
.failed:
    mov edi, 1
.exit:
    mov eax, 60             ; Linux sys_exit(status).
    syscall

; Local convention: RSI=bytes, RCX=length; RAX=result.
; Clobbers RAX, RCX, RSI. The empty sequence is valid.
count_done:
    xor eax, eax
    test rcx, rcx
    jz .done
.next:
    cmp byte [rsi], 0
    je .skip
    inc eax
.skip:
    inc rsi
    dec rcx
    jnz .next
.done:
    ret

; RSI=buffer, RDX=length. Returns bytes written or negative errno.
; syscall also clobbers RCX and R11; this is not a C ABI wrapper.
write_stdout:
    mov eax, 1              ; Linux sys_write(fd, buffer, length).
    mov edi, 1              ; Standard output file descriptor.
    syscall
    ret
