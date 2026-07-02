global atoi

section .data

section .bss

section .text

atoi:
  ;rdi é o endereço de memória contendo a string
  ;rax será o retorno em inteiro

  xor rax, rax

.loop:
  
  ;movzx significa 'move with zero extension'
  ;move um valor com tamanho predeterminado e deixa o restante com 0.
  ;move um byte de rsi para rcx
  ;
  ;exemplo:
  ;
  ;rsi = '1', '2', '3'
  ;movzx rcx, byte [rsi] => rcx = '1'

  movzx rcx, byte [rdi]
  
  ;subtraimos de rcx a char '0' pois se o valor inicial era '5' = 53
  ;pois '0' = 48 e 53 - 48 = 5!
  sub rcx, '0'
  
  ;agora rcx vale 5, sem aspas, pois é um inteiro

  imul rax, 10
  add rax, rcx
  
  inc rdi

  cmp byte [rdi], 10
  je .end

  cmp byte [rdi], 0
  je .end

.end:
  ret
