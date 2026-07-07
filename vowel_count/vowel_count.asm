global _start

section .data
  string: db 'God bless your lifeeee!', 0

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

  cmp bl, 'e'
  je increment

  cmp bl, 'i'
  je increment

  cmp bl, 'o'
  je increment

  cmp bl, 'u'
  je increment

  jmp loop

.end:
  
  mov rax, 60
  xor rdi, rcx
  syscall
  
_start:

  xor rax, rax
  xor rcx, rcx

  jmp loop
  
