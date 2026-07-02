global _start

extern strlen	      ;função para tamanho de string
extern input	      ;função que implementa sys_read
extern print_string ;função de imprimir uma string na tela
extern atoi         ;função de ASCII para inteiro

section .data
	init_text: db 'Bem-vindo! Digite o número das opções abaixo:', 10, '1 - strlen do input', 10, '2 - print do strlen', 10, '3 - print uint(4 bytes/)', 10


section .bss
	buf: resb 3000
section .text

_start: 
	;limpando os registradores

	xor rax, rax
	xor rdi, rdi
	xor rsi, rsi
	xor rdx, rdx
	xor rcx, rcx
	
	;calcula o endereço de memoria da variável init_text
	;e envia como argumento de strlen via rdi
	lea rdi, [init_text]
	call strlen
	
	;imprime o texto do menu na tela
	mov rcx, rax
	mov rax, 1
	mov rdi, 1
	mov rsi, init_text
	mov rdx, rcx
	syscall

	;funçao de input de ssy_read
	call input

	;agora nós temos o retorno da função em rax
  ;contendo o endereço de memória da string com 1 byte
	cmp byte [rax], '1'
	je .call_strlen_input

	cmp byte [rax], '2'
	je .call_exit

  cmp byte [rax], '3'
  je .call_atoi

  jmp .call_exit

.call_strlen_input:
	;quando essa função é chamada, ele retorna o endereço
  ;de memória da string digitada e guarda em rax
  call input
  
  push rax
  mov rdi, rax

  ;agora que temos o endereço da string em rax
  ;vamos direciona-la para a função strlen
  call strlen
  
  ;agora rcx contem o valor de retorno de strlen
  mov rdx, rax 
  pop rax
  
  mov rsi, rax

  ;função que imprime uma string na tela
  call print_string

.call_exit:
	
	;término do programa
	mov rax, 60
	xor rdi, rdi
	syscall

.call_atoi:
  call input

  ;rax terá o endereço da string retornada de strlen

  ;agora chamaremos a função atoi com argumento em rdi
  mov rdi, rax
  
  call atoi
  
  mov rdi, rax
  mov rax, 1
  mov rsi, 1
  mov rdx, 1
  syscall

  jmp .call_exit 
  











  
