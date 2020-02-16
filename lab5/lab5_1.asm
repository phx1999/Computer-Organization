.include "macro_print_str.asm"
.text
li $t1,'+'
li $t2,'*'
print_string("Welcome to use the simple arithmetic calculator on unsigned 31bit number:\n")
loop:
print_string("please input the operator ")
li $v0,12
syscall
beq $v0,$t1,sum
beq $v0,$t2,mull
move $t1,$v0				
print_string("\n")
print_string("The operator ")
move $a0,$t1
li $v0 11
syscall 
print_string(" is not supported ,exit")	
end

sum:
print_string("please input addend: ")
li $v0,5
syscall
move $t3,$v0
print_string("please input augend: ")
li $v0,5
syscall
move $t4,$v0
addu $t5,$t3,$t4
srl $t6,$t5,31
tnei $t6,0

print_string("the sun of ")
move $a0,$t3
li $v0,1
syscall
print_string("and ")
move $a0,$t4
li $v0,1
syscall
print_string(" is : ")
move $a0,$t5
li $v0,1
syscall
end

mull:
print_string("please input multiplicand : ")
li $v0,5
syscall
move $t3,$v0
print_string("please input multiplier : ")
li $v0,5
syscall
move $t4,$v0
mult $t3,$t4
mfhi $a1
mflo $t6
tnei $a1,0

print_string("the product of ")
move $a0,$t3
li $v0,1
syscall
print_string(" and ")
move $a0,$t4
li $v0,1
syscall
print_string(" is : ")
move $a0,$t6
li $v0,1
syscall
end



.ktext 0x80000180

   move $k0,$v0
   move $k1,$a0
la $a0,s1
li $v0,4
syscall
   mfc0 $a0,$14
   li $v0,34
   syscall
  bne $a1,0,m
la $a0,s2
li $v0,4
syscall

move $v0,$k0
move $a0,$k1

mfc0 $k0,$14
addi $k0,$k0,88
mtc0 $k0,$14
jal e

m:
la $a0,s3
li $v0,4
syscall
move $v0,$k0
move $a0,$k1

mfc0 $k0,$14
addi $k0,$k0,88
mtc0 $k0,$14
jal e
e:
eret
.kdata
s1: .asciiz "\nruntime exception at"
s2: .asciiz "the sun is overflow"
s3: .asciiz " the product is bigger than the Max value of a word "

#        Welcome to use the simple arithmetic calculator on unsigned 31bit number:
#        please input the operator **** user input : +
#        please input addend: **** user input : 2147483647
#        please input augend: **** user input : 2147483647

#        runtime exception at0x004000c0the sun is overflow
#        -- program is finished running --

#        Welcome to use the simple arithmetic calculator on unsigned 31bit number:
#        please input the operator **** user input : +
#        please input addend: **** user input : 15
#        please input augend: **** user input : 20
#        the sun of 15and 20 is : 35
#        -- program is finished running --

#        Welcome to use the simple arithmetic calculator on unsigned 31bit number:
#        please input the operator **** user input : *
#        please input multiplicand : **** user input : 2147483647
#        please input multiplier : **** user input : 2147483647

#        runtime exception at0x00400164 the product is bigger than the Max value of a word 
#        -- program is finished running --

#        Welcome to use the simple arithmetic calculator on unsigned 31bit number:
#        please input the operator **** user input : *
#        please input multiplicand : **** user input : 15
#        please input multiplier : **** user input : 2
#        the product of 15 and 2 is : 30
#        -- program is finished running --



