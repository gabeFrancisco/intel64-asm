section .data

section .text
	global _start

_start:

;Move o valor 0x1234 para o registrador RAX
	mov rax, 0x1234
;Coloca o valor de RAX no topo da pilha
	push rax

;Agora faremos o mesmo mas com valores diferentes
	mov rax, 0xAAAA
	push rax
	
	mov rax, 0x5678
	push rax

;agora vamos retornar os valores para as variaveis

	pop rbx
	pop rcx
	pop rdx

	mov rax, 1
	mov rdi, 1
	mov rsi, 10
	mov rdx, 1
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall

	



