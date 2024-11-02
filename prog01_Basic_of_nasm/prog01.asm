
section .data                                 ; used to declare the initialized data or constant
    hello_msg db 'Hello, World!' , 0          ; Declare a null-terminated string
                              
section .text                       ; here the program code exist     

global _start                       ; here the real program starts to execute
                         
_start:
    
    ; Write the hello_msg to stdout
    mov eax, 4                      ; syscall number for sys_write (write)
    mov ebx, 1                      ; file descriptor 1 is stdout
    mov ecx, hello_msg              ; pointer to the string
    mov edx, 30                     ; length of the string
    int 0x80                        ; make syscall

    ; Exit the program
    mov eax, 1                      ; syscall number for sys_exit (exit)
    mov ebx, 1                      ; exit code 0
    int 0x80                        ; make syscall








;nasm -f elf32 prog01.asm -o prog01.o  ;This is the file which creates the .asm file into object file
;ld -m elf_i386 -s -o Prog01 prog01.o  ;This is the exucutable file 

; compile time - > when the high level language is compiled into machine code 
; Run time - > when the machine code is executed into the processor


