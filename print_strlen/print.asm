extern strlen

section .data
	string: db 'God bless you! This is a message with a dynamic lenght! Its working! I cant believe!!! God is good!', 0

section .text

global _start

_start:
	mov rdi, string
	call strlen

	mov rdx, rax

	mov rax, 1
	mov rdi, 1
	mov rsi, string

	syscall

	mov rax, 60
	xor rdi, rdi
	syscall

