section .data 
message: db 'hello, world!', 10

section .text
global _start

_start:
  mov   rax, 1          ;syscall write number
  mov   rdi, 1          ;stout descritor
  mov   rsi, message    ;message address
  mov   rdx, 14         ;string length in bytes
  syscall
  
