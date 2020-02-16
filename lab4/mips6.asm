.include "macro_print_str.asm"
.data
min_value: .word 0
.text
main:
lw $t0,($s1) #initialize the min_value
sw $t0,min_value
li $t0,1
addi $s2,$s1,4
loop_find_min:
lw $a0,min_value
lw $a1,($s2)
jal find_min
sw $v0,min_value
addi $s2,$s2,4
addi $t0,$t0,1
bne $t0,$s0 loop_find_min
find_min:
addi $sp,$sp,-4
sw $ra,($sp)
move $v0,$a0
blt $a0,$a1,not_update
move $v0,$a1
not_update:
sw $ra,($sp)
addi $sp,$sp,4
jr $ra
print_string("the min value : ")
li $v0,1
lw $a0,min_value
syscall
li $v0,10
syscall