section .data  
    msgl db 0xa, 0xb, "Enter Digit: "    ; Prompt message
    msgl_len equ $ - msgl                 ; Length of the prompt message
    msg2 db 0xa, 0xb, "Square Value is: " ; Result message
    msg2_len equ $ - msg2                 ; Length of the result message

section .bss   
    inbuf resb 1                          ; Buffer for user input
    outbuf resb 2                         ; Buffer for output result

section .text                     
global _start                             ; Entry point

_start:

    ; Write the msgl to stdout
    mov eax, 4                            ; syscall number for sys_write (write)
    mov ebx, 1                            ; file descriptor 1 is stdout
    mov ecx, msgl                         ; pointer to the prompt message
    mov edx, msgl_len                     ; length of the prompt message
    int 0x80                              ; make syscall

    ; Read single digit input from user
    mov eax, 3                            ; syscall number for sys_read (read)
    mov ebx, 0                            ; file descriptor 0 is stdin
    mov ecx, inbuf                        ; pointer to the input buffer
    mov edx, 1                            ; length to read
    int 0x80                              ; make syscall

    ; Convert ASCII to integer
    mov al, byte [inbuf]                  ; Load input character
    sub al, '0'                           ; Convert ASCII to integer

    ; Square the number
    mov bl, al                            ; Copy al to bl
    mul bl                                ; Multiply al * bl -> result in ax (al = lower byte, ah = upper byte)

    ; Convert the result back to ASCII for output
    mov bl, 10                            ; Divisor for decimal conversion
    div bl                                ; Divide ax by 10, result: quotient in al, remainder in ah
    add al, '0'                           ; Convert quotient to ASCII
    mov [outbuf], al                      ; Store the first character in outbuf
    add ah, '0'                           ; Convert remainder to ASCII
    mov [outbuf + 1], ah                  ; Store the second character in outbuf

    ; Write msg2 to stdout (Square Value is:)
    mov eax, 4                            ; syscall number for sys_write (write)
    mov ebx, 1                            ; file descriptor 1 is stdout
    mov ecx, msg2                         ; pointer to the result message
    mov edx, msg2_len                     ; length of the result message
    int 0x80                              ; make syscall

    ; Write the square result to stdout
    mov eax, 4                            ; syscall number for sys_write (write)
    mov ebx, 1                            ; file descriptor 1 is stdout
    mov ecx, outbuf                       ; pointer to the output buffer
    mov edx, 2                            ; length of the output (2 characters)
    int 0x80                              ; make syscall

    ; Exit the program
    mov eax, 1                            ; syscall number for sys_exit (exit)
    xor ebx, ebx                          ; exit code 0
    int 0x80                              ; make syscall
