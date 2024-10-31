section .data
    hello_msg db 'Hello, World! with 20 ' , 0 ; Declare a null-terminated string

section .text
    global _start                   ; Required for linking

_start:
    ; Write the hello_msg to stdout
    mov eax, 4                      ; syscall number for sys_write (write)
    mov ebx, 1                      ; file descriptor 1 is stdout
    mov ecx, hello_msg              ; pointer to the string
    mov edx, 30                     ; length of the string
    int 0x80                        ; make syscall

    ; Exit the program
    mov eax, 1                      ; syscall number for sys_exit (exit)
    xor ebx, ebx                    ; exit code 0
    int 0x80                        ; make syscall


;nasm -f elf32 prog01.asm -o prog01.o  ;This is the file which creates the .asm file into object file
;ld -m elf_i386 -s -o Prog01 prog01.o  ;This is the exucutable file 

