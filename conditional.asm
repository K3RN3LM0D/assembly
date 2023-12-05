GLOBAL _start
section .text

_start:

    jmp main ; unconditional jump 

main:
	mov rax, 1
    mov rdi, 1
    mov rsi, wlc_msg
    mov rdx, len_wlc_msg
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, userkey
    mov rdx, 64
    syscall
    mov rbx, rax
    jmp cmp_key

cmp_key:
   ; cmp rbx, ori_key ;cmp is for integers only
   ; jne wrong_key
    mov rsi, ori_key
    mov rdi, userkey
    mov rcx, len_ori_key ; cmsb instruction checks only  first byte but if you keep a value in RCX REGISTERS it checks the all values
    repe cmpsb         ;comparestringbyte for strings it compare two registers (RSI & RDI)
    je  right_key
    jne wrong_key




right_key:
    mov rax, 1
    mov rdi, 1
    mov rsi, access_granted
    mov rdx, len_access_granted
    syscall
    jmp exiting


wrong_key:
    mov rax, 1
    mov rdi,1
    mov rsi, access_denied
    mov rdx, len_access_denied
    syscall
    jmp exiting

exiting:
    mov rax, 60
    mov rdi, 200
    syscall


section .data
	wlc_msg : db "Welcome, please enter your licence key: "
	len_wlc_msg: equ $-wlc_msg
    access_granted: db "Access Granted !!!",0xa
    len_access_granted: equ $-access_granted
    access_denied: db "Access Denied !!!",0xa
    len_access_denied: equ $-access_denied
    ori_key: db "7856-2855-09AC-56DV"
    len_ori_key: equ $-ori_key

section .bss
    userkey: resb 64
