global strlen


section .text
strlen:
	xor rax, rax

.loop:
	cmp byte [rdi+rax], 0
	jz .end

	inc rax
	jmp .loop

.end:
	ret
	
