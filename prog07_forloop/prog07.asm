
section .data                                 ; used to declare the initialized data or constant
    starmsg db   '*'         ; Declare a null-terminated string
    ;msgl_len equ $ - starmsg  

section .text                       ; here the program code exist     
 

global _start                       ; here the real program starts to execute
                         
_start:
    
     mov ecx,0
     
DISP:
push ecx
;*********************
    ; Write the hello_msg to stdout
    mov eax, 4                      ; syscall number for sys_write (write)
    mov ebx, 1                      ; file descriptor 1 is stdout
    mov ecx, starmsg              ; pointer to the string
    mov edx, 3                     ; length of the string
    int 0x80                        ; make syscall
;*********************
     pop ecx
     inc ecx 
     cmp ecx,10
     jl DISP 
     


       
ENDPROG:
    ; Exit the program
    mov eax, 1                            ; syscall number for sys_exit (exit)
    xor ebx, ebx                          ; exit code 0
    int 0x80                              ; make syscall

    jmp DISP






;nasm -f elf32 prog01.asm -o prog01.o  ;This is the file which creates the .asm file into object file
;ld -m elf_i386 -s -o Prog01 prog01.o  ;This is the exucutable file 

; compile time - > when the high level language is compiled into machine code 
; Run time - > when the machine code is executed into the processor
