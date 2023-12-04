global _start:
section .text
_start:
	mov rax,1 ; write syscall
	mov rdi, 1 ;fd -> 1(output)
	mov rsi, variable ; buf -> vairable -> 'hello world'
	mov rdx, 11 ; count of our helloworld (size)
	syscall

	;exit
	mov rax, 60 ;exit syscall
	mov rdi, 11 ; status code for exiting you can give anything
	syscall
section .data
	variable: db 'hello world'
