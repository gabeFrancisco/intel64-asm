global _start
  
section .data

section .bss
  buf: resb 64

section .text

read:  
  ;zera os registradores rax e rdi pois a call value
  ;de sys_read é 0 e o descritor também é 0
  xor rax, rax  
  xor rdi, rdi
  
  lea rsi, [buf]
  mov rdx, 64
  syscall
  ret

_start:
  call read

  mov rax, 60
  xor rdi, rdi
  syscall

