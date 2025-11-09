section .data 
a: db 10
b: db 2
result: db '0'

section .text
global _start 
_start:

  ;make the sum with 'a' and 'b'
  mov al, byte [a]
  add al, byte [b]

  ;add '0' to the al register
  add al, '0'

  ;move the al result to the 'result' variable
  mov byte [result], al

  ;print rhe result
  mov rax, 1
  mov rdi, 1
  mov rsi, result,
  mov rdx, 1
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
  
