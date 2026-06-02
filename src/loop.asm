global _start

section .text

_start:
    xor ebx, ebx        ; int i = 0

    call print_loop

    mov rax, 60         ; exit syscall
    xor rdi, rdi
    syscall

print_loop:
    call print

    inc ebx             ; i++
    cmp ebx, 5          ; i < 5
    jne print_loop      ; if not i<5, continue

    ret

print:
    mov rax, 1          ; write syscall
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall
    ret

section .data

msg: db "Hello, World", 10
msg_len: equ $ - msg
