global _start

extern strlen

section .data
	init_text: db 'Bem-vindo! Selecione uma das opções abaixo:', 10, '1-strlen do input', 10, '2 - print do strlen', 10, '3 - print uint(4 bytes/)', 10


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

	lea rdi, [init_text]
	call strlen

	mov rcx, rax
	mov rax, 1
	mov rdi, 1
	mov rsi, init_text
	mov rdx, rcx
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall


