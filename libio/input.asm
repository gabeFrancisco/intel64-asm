global input 

section .bss
  buf: resb 3000 ;limite de caracteres do buffer de entrada

section .text

input:
	xor rax, rax  ;0 - syscall de sys_read
	xor rdi, rdi  ;0 - descritor de stdin

	lea rsi, [buf]
  mov rdx, 3000
	syscall

  lea rax, [buf]

	ret
	

   

	
