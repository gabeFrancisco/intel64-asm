global _start

section .data
  string: db 'Isto eh uma frase', 0

section .text

increment:
  inc rcx
  jmp loop
  
loop:

  ;carrega o endereço da variável string na memória
  ;para o registrador rbx
  mov bl, [string + rax]
  
  ;se o caractere for 0, o programa termina
  cmp bl, 0
  jz .end
  
  inc rax
  
  ;se for 'a', ele incrementa rcx e volta para o loop
  cmp bl, 'a'
  je increment
  jmp loop

.end:
  
  mov rax, 60
  xor rdi, rdi
  syscall
  
_start:

  xor rax, rax
  xor rcx, rcx

  jmp loop
  
