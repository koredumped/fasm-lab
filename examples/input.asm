format ELF executable

include '../macros.inc'
entry main

segment readable executable

main:
    write 1, msg, msg_len
    read 0, name, 0x20
    write 1, msg1, msg1_len
    write 1, name, 0x20
    exit 0

segment readable writeable
msg db "Enter your name: "
msg_len = $ - msg
msg1 db "Hi, "
msg1_len = $ - msg1
name rb 0x20
