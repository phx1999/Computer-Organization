.include "macro_print_str.asm"
.data
min_value: .word 0
str: .space 701
str0: .asciiz " zero "
str1: .asciiz " one "
str2: .asciiz " two "
str3: .asciiz " three "
str4: .asciiz " four "
str5: .asciiz " five "
str6: .asciiz " six "
str7: .asciiz " seven "
str8: .asciiz " eight "
str9: .asciiz " nine " 
.text
print_string("please input the number:")
la $t9,str
la $t8,str0
sw $t8,($t9)
la $t8,str1
sw $t8,4($t9)
la $t8,str2
sw $t8,8($t9)
la $t8,str3
sw $t8,12($t9)
la $t8,str4
sw $t8,16($t9)
la $t8,str5
sw $t8,20($t9)
la $t8,str6
sw $t8,24($t9)
la $t8,str7
sw $t8,28($t9)
la $t8,str8
sw $t8,32($t9)
la $t8,str9
sw $t8,36($t9)
li $v0,5 
syscall
move $s0,$v0 
sll $a0,$s0,2 
li $v0,9
syscall
move $s1,$v0 
move $s2,$v0 
print_string("please input the positive integer\n")
add $t0,$0,$0
loop_read:
li $v0,5 
syscall
blt $v0,$0,exit1
sw $v0,($s2)
move $t1,$v0
blt $t1,10,next3
blt $t1,100,next2
blt $t1,1000,next1
divu $a0,$t1,1000
mfhi $t1
            mul $a0,$a0,4
            add $a0,$a0,$t9
            lw $a0,($a0)
            li $v0,4
            syscall
next1:
divu $a0,$t1,100
mfhi $t1
           mul $a0,$a0,4
            add $a0,$a0,$t9
            lw $a0,($a0)
            li $v0,4
            syscall
next2:
divu $a0,$t1,10
mfhi $t1
            mul $a0,$a0,4
            add $a0,$a0,$t9
            lw $a0,($a0)
            li $v0,4
            syscall

next3:
divu $a0,$t1,1
mfhi $t1
            mul $a0,$a0,4
            add $a0,$a0,$t9
            lw $a0,($a0)
            li $v0,4
            syscall
addi $s2,$s2,4
addi $t0,$t0,1
bne $t0,$s0,loop_read
end
exit1:
print_string("Invalid Entry")
