.include "macro_print_str.asm"
.data
tdata: .byte 0x87654321
.text
main:
lb $a0,tdata
li $v0,34
syscall
end