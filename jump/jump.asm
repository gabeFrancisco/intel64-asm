section .data
value: db 2
greater_msg: db 'Maior!', 10
lower_msg: db 'Menor!', 10

section .text 
global _start
_start:
  mov rax, 3

  movzx rbx, byte [value]

  cmp rax, rbx
  ;if r8 is greater than value
  ;jump to greater
  jg greater

lower:
  mov rax, 1
  mov rdi, 1
  mov rsi, lower_msg
  mov rdx, 6
  syscall

  jmp exit

greater:
  mov rax, 1
  mov rdi, 1
  mov rsi, greater_msg
  mov rdx, 6
  syscall
  
exit:
  mov rax, 60
  xor rdi, rdi
  syscall

