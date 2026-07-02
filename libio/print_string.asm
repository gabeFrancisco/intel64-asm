global print_string

section .data

section .text

print_string:
  mov rax, 1  ;syscall write
  mov rdi, 1  ;stdout descritor
  
  ;rsi não será mexido pois ele já recebido via parametro
  ;ou seja, rsi = [endereço da string]
  mov rdx, 4

  syscall
  ret

