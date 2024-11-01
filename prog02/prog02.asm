section .data
msg db      "Hello, world!", 20   ; Define a message string (null-terminated) to be printed
len equ $ -msg                    ; Calculate the length of the message (using $ which gives the current address)

section .bss
                                  ; Uninitialized data section (not used in this example)

section .text

global _start                     ; Entry point for the program
                                  ; Start is like a label, which make the starting point of the program
                                  ; We define that this is the starting point of the program


_start:                           ; whatever we write here or after this it start executes
                                  ; sys_write call to print "Hello, world!"
    mov edx, len                  ; message length (edx will hold the length of the message)
    mov ecx, msg                  ; pointer to message to write (ecx will hold the address of the message)
    mov ebx, 1                    ; file handle (1 represents stdout)
    mov eax, 4                    ; system call number (4 is the number for sys_write)
    int 0x80                      ; invoke the system call to write the message to stdout

    ; sys_exit call to terminate the program
    mov ebx, 0      ; exit code (0 indicates successful exit)
    mov eax, 1      ; system call number (1 is the number for sys_exit)
    int 0x80        ; invoke the system call to exit the program

; This code outputs "Hello, world!" to the terminal and then exits successfully.
; You should really know what are the interrupts in Computer Architectures