global _start

extern strlen	;função para tamanho de string
extern input	;função que implementa sys_read

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
	
	;imprimi o texto do menu na tela
	mov rcx, rax
	mov rax, 1
	mov rdi, 1
	mov rsi, init_text
	mov rdx, rcx
	syscall

	;funçao de input de ssy_read
	call input

	;agora nós temos o retorno da função em rax
	cmp byte [rax], '1'
	je .call_input

	cmp byte [rax], '2'
	je .call_exit

.call_input:
	call input
.call_exit:
	
	;término do programa
	mov rax, 60
	xor rdi, rdi
	syscall


