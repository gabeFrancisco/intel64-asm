section .data 
a: db 2
b: db 2
result: db 0

section .text
global _start 
_start:
  mov rax, 1
  mov rdi, 1

  movzx r8, byte [a]
  add r8, '0'

  mov rsi, r8 
  mov rdx, 1
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
  
