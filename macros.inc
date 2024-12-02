; Macros for system calls in Flat Assembler (FASM)
SYS_EXIT  = 1
SYS_READ  = 3 
SYS_WRITE = 4 

macro write fd, buf, count { 
    mov eax, SYS_WRITE     ; syscall constant for 'write' 
    mov ebx, fd	           ; file descriptor (stdout = 1, stderr = 2)
    mov ecx, buf		   ; pointer to buffer
    mov edx, count		   ; size of buffer
    int 0x80			   ; make the system call
}

macro read fd, buf, count {
    mov eax, SYS_READ	   ; syscall constant for 'read'
    mov ebx, fd			   ; file descriptor (stdin = 1)
    mov ecx, buf  		   ; pointer to buffer
    mov edx, count   	   ; size of buffer
    int 0x80 			   ; make the system call
}

macro exit status {
    mov eax, SYS_EXIT 	   ; syscall constant for 'exit'
    mov ebx, status		   ; exit code 
    int 0x80 			   ; make the system call
}

