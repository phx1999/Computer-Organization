.macro print_string(%str)
.data
pstr: .asciiz %str
.text
addi $sp,$sp,
-
4
sw $v0,($sp
)
la $a0,pstr
li $v0,4
syscall
lw $v0,($sp)
addi $sp,$sp,4
.end_macro

.text
print_string:
addi $sp,$sp,-4
sw $v0,($sp)
li $v0,4
lw $v0,($sp)
addi $sp,$sp,4
syscall
jr $ra