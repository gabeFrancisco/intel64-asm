section .data 
message: db 'God bless you!', 10, 0

section .text 
global _start
_start:
  mov rax, 0
  mov rbp, 5
  mov rcx, 10

loop:
  ;sum operation
  add rax, rbp
  
  jg print
  ;decrement
  dec rcx
  
  ;compare if rcx is equal to 0
  cmp rcx, 0
  jg loop

print:
  mov rax, 1
  mov rdi, 1
  mov rsi, rax
  mov rdx, 1
  syscall
  



