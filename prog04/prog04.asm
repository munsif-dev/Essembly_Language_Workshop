
section .data  
        msgl db 0xa , 0xb, "Enter Digit: "       
        ; We can write it as following
        ; msgl db 0xa, 0xb , "E", 'n', 't' 

section .bss   
        inbuf resb 1                         

section .text                     

global _start                       ; here the real program starts to execute
                         
_start:
    

    ;Read from User Input
    mov eax, 3                      ; syscall number for sys_write (write)
    mov ebx, 0                      ; file descriptor 1 is stdout
    mov ecx, inbuf              ; pointer to the string
    mov edx, 1                     ; length of the string
    int 0x80                        ; make syscall

     ; Write the msgl to stdout
    mov eax, 4                      ; syscall number for sys_write (write)
    mov ebx, 1                      ; file descriptor 1 is stdout
    mov ecx, msgl              ; pointer to the string
    mov edx, 23                     ; length of the string
    int 0x80                        ; make syscall

    mov al, byte[inbuf]             ; Here al = [inbuf] -> square bracket is set to value in that address
    sub al, '0'                     ; al = al - 'o' 
    mul al                          ; al = al*al          
                 
                      
    int 0x80                        ; make syscall


    ; Exit the program
    mov eax, 1                      ; syscall number for sys_exit (exit)
    mov ebx, 1                      ; exit code 0
    int 0x80                        ; make syscall








;nasm -f elf32 prog01.asm -o prog01.o  ;This is the file which creates the .asm file into object file
;ld -m elf_i386 -s -o Prog01 prog01.o  ;This is the exucutable file 

; compile time - > when the high level language is compiled into machine code 
; Run time - > when the machine code is executed into the processor


