.include"macro_print_str.asm"
.data
a:.word 0x55555555
b:.word 0xaaaaaaaa
.text
main:
lw $t0,a
lw $t1,b           #用来进行奇数位的逆置
xor $t2,$t0,$t1     #两个word进行逆否
move $a0,$t2
li $v0,34
syscall
end

#           0xffffffff
#           -- program is finished running --