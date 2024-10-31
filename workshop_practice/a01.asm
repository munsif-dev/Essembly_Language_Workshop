section .data
section .bss
section .text
global _start


_start:

; .. code

mov ebx, 0
mov eax, 1
int 0x80
