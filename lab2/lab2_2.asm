.include"macro_print_str.asm"
.data
a:.word 0x55555555
b:.word 0xaaaaaaaa
.text
main:
lw $t0,a
lw $t1,b           #������������λ������
xor $t2,$t0,$t1     #����word�������
move $a0,$t2
li $v0,34
syscall
end

#           0xffffffff
#           -- program is finished running --