.include "macro_print_str.asm"
.text
main:
li $a1,2
li $t9,1
loop:
bgt $t9,100,exit1
jal test_prime
move $t0,$v0
addi $a1,$a1,1
beqz $t0,loop
sub $a0,$a1,1
li $v0,1
addi $t9,$t9,1
syscall
print_string(" ")
j loop
exit1:
end



test_prime:
move $t1,$a1
li $t2,2
ll:
bge $t2,$t1,exit
div $a1,$t2
mfhi $t3
addi $t2,$t2,1
bnez $t3,ll
li $t4,0
move $v0,$t4
jr $ra
exit:
li $t4,1
move $v0,$t4
jr $ra
