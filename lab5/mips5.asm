.data
addend1: .word 0x80000000
addend2: .word 0x7fffffff
.text
print_string:
lw $t0,addend1
lw $t1,addend2
sub $a0,$t0,$t1
li $v0,1
syscall
li $v0,10
syscall