section .data
    
section .bss            ; this is uninitialized data segment
    buf resb 8      ; resb -> reserves 8 bytes (uninitialized) to result
                        ; this can be written as (buf resb 8) also

section .text
global _start

_start:

; 5F0000001
; 310001010

    mov eax, 0F0000001h      ; When you type hexa decimal number, and 1st digit is a letter, you should put 0 before the letter
    mov ebx, 310001010           ; 310001010

    add eax,ebx
    mov ecx, eax           ; results goes to first register , it is in ecx
                                ; and this adding part is done by ALU (Arithmetic Logic unit)
    
    mov eax, 5h
    mov ebx, 3h 
    add eax,ebx         ; this part add the extra carry out, and it stores the carry out in eax

    ; now the addition is in ecx and eax where ecx stores normal digits and eax stores total carry out 


    ; return 0
    mov ebx, 0         ; return value (parameter of "exit")
    mov eax, 1         ; system call exit
    int 0x80            ; call interrupt no 80h


    ; Command $fg get the program to foreground
    

