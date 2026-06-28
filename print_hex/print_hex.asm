section .data
	newline_char: db 10
	codes: db '0123456789abcdef'

section .text
global _start

print_newline:
	mov rax, 1		;syscall write
	mov rdi, 1		;stdout
	mov rsi, newline_char	;local dos dados de nova linha
	mov rdx, 1		;quantidade de bytes
	syscall
    ret

print_hex:
	mov rax, rdi
	mov rdi, 1
	mov rdx, 1
	mov rcx, 64		;até que pontos estamos deslocando rax?

iterate:
	push rax		;salva o valor de rax na pilha
	sub rcx, 4		;subtrai 4 de rcx
	sar rax, cl		;desloca para 60, 56...
				;cl é a menor parte de rcx
	and rax, 0xf		;limpa todos os bits, exceto os 4 lsb
	lea rsi, [codes + rax]  ;obtém o código do dígito hexadecimal
	
	mov rax, 1

	push rcx		;salva o valor de rcx na pilha
	syscall			;chamada do sistema

	pop rcx
	pop rax

	test rcx, rcx		;rcx = 0 quanto todos forem mostrados
	jnz iterate		;jump if not zero para iterate

    ret

_start:
	mov rdi, 0x1122334455667788
	call print_hex
	call print_newline

	mov rax, 60
	xor rdi, rdi
	syscall
	
	
