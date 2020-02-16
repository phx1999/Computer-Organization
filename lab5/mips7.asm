.include "macro_print_str.asm"
.text
main:
print_string("Welcome to use the simple arithmetic calculator on unsigned 31bit number:\n")
print_string("Please input operator:")
li $v0,12
syscall
move $s2,$v0
li $t0,'+'
li $t1,'*'
beq $s2,$t0,ad
beq $s2,$t1,mu
move $t1,$v0				
print_string("\n")
print_string("The operator ")
li $v0 11
move $a0,$t1
syscall 
print_string(" is not supported ,exit")	
end

ad:
print_string("\nPlease input addend:")
li $v0,5
syscall
move $t0,$v0
print_string("Please input addend:")
li $v0,5
syscall
move $t1,$v0
addu $t2,$t0,$t1
srl $t3,$t2,31
tne $t3,$zero

print_string("The sum of ")
move $a0,$t0
li $v0,1
syscall
print_string(" and ")
move $a0,$t1
li $v0,1
syscall
print_string(" is ")
move $a0,$t2
li $v0,1
syscall
end

mu:
print_string("\nPlease input multiplicand:")
li $v0,5
syscall
move $t0,$v0
print_string("Please input multiplier:")
li $v0,5
syscall
move $t1,$v0
mult $t0,$t1
mflo $t2
mfhi $s0
tne $s0,$zero 

print_string("The product of ")
move $a0,$t0
li $v0,1
syscall
print_string(" with ")
move $a0,$t1
li $v0,1
syscall
print_string(" is ")
move $a0,$t2
li $v0,1
syscall
end

.ktext 0x80000180 

move $k0,$v0
move $k1,$a0
la $a0,msg
li $v0,4
syscall
li $v0, 34
mfc0 $a0,$14
syscall

beq $s2,43,addd			
la $a0,msgmul				
li $v0,4
syscall
mfc0 $k0,$14
addi $k0,$k0,260
mtc0 $k0,$14 
j exit
	
addd:						
la $a0,msgadd				
li $v0,4
syscall
mfc0 $k0,$14
addi $k0,$k0,88
mtc0 $k0,$14 

exit:eret

.kdata
msg: .asciiz "Runtime exception at "
msgmul: .asciiz " ,the product is bigger than the Max value of a word"
msgadd: .asciiz " ,the sum is overflow"