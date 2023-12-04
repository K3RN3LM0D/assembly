global _start


section .text
_start: ; it is known as label too
	mov rax, 1
	mov rdi, 1
	mov rsi, d1
	mov rdx, len_d1
	syscall

_user_input: ;creating label for understanding 
	mov rax, 0
	mov rdi, 0
	mov rsi, ui1
	mov rdx, 100
	syscall
	mov rbx, rax ; syscall return length of userinput we are using rbx because we arent using rbx and its value is not change we can use any free registers
	


	mov rax, 1
	mov rdi, 1
	mov rsi, hello
	mov rdx, hello_len
	syscall
print_username:
	mov rax, 1
	mov rdi, 1
	mov rsi, ui1
	mov rdx, rbx
	syscall
exiting_program:	
	mov rax, 60
	mov rdi, 200
	syscall



section .data
	d1 : db "Enter your name: "
	len_d1 :  equ $-d1 ;$ represent last word to start
	hello :  db "hello, "
	hello_len : equ $-hello 



section .bss
	ui1 : resb 100  ; it means  it will reserve the bytes the size of 100 
