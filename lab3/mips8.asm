.text
print_string:
addi $sp,$sp,-8
sw $a0,4($sp)
sw $v0,0($sp)
addi $v0,$zero,4
syscall
lw $v0,0($sp)
lw $a0,4($sp)
addi $sp,$sp,8
jr $ra
