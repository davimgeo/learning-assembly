global _start

section .text
_start:
  
  ; write()
  mov rax, 1         ; %rax 0x01
  mov rdi, 1         ; %rdi unsigned int fd
  mov rsi, msg       ; const char *buf
  mov rdx, msg_len   ; size_t count
  syscall            ; calling write()

  ; exit
  mov rax, 60
  xor rdi, rdi
  syscall

section .data
  msg: db "Hello, World!", 10, 0
  msg_len: equ $-msg
