.extern defaulte_str 20
.data
defaulte_str: .asciiz "it¡®s the default_str\n"
str_callee: .asciiz "it's in print callee."
.text
print_callee:
addi $sp,$sp,-8
sw $ra,4($sp)
sw $v0,($sp)

addi $v0,$zero,4
la $a0,str_callee
syscall
la $a0,defaulte_str
syscall

sw $v0,($sp)
sw $ra,4($sp)
addi $sp,$sp,8
jr $ra