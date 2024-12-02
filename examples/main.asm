; This line specifies the output format of the program. 
; It tells the assembler to generate an ELF (Executable and Linkable Format) file.
; ELF is a common standard file format for executables, object code, shared libraries, and core dumps, primarily used in Unix-like operating systems (like Linux).
; The assembler will create an ELF executable that can be executed by the operating system.
format ELF executable 

; Include external macros file for common system calls
include '../macros.inc'

; Define the entry point of the program
entry main

; The first segment is "readable" and "executable"
; This is typically used foor code thah will be executed
segment readable executable

; Main program code starts here
main:
    ; Write system call (number 4)
    ; 1   = file descriptor for stdout
    ; msg = pointer to the message to be printed
    ; nsg_len = length of the message
    write 1,msg,msg_len

    ; Exit system call (number 1)
    ; 0 = exit code indicating successful execution
    exit 0

; The second segment is "readable" and "writeable"
; This segment is used for data storage
segment readable writeable

; Define a null-terminated string to be printed
msg db "Hello, World!", 0xA ; 0xA is the newline character at the end of the string
msg_len = $ - msg           ; Calculate the length of the string

