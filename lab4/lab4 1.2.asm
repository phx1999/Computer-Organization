.include "macro_print_str.asm"
.text
main:
print_string("Fib(5) is ")
  li $t0,1
  addi $t0,$t0,1
  li $t1,5
  addi $t0,$t0,1
  li $a1,1
  addi $t0,$t0,1
  li $a2,1
  addi $t0,$t0,1
  li $a3,3
fib:
addi $t0,$t0,1
  bgt $a3,$t1,exit
addi $t0,$t0,1
  addi $a3,$a3,1
addi $t0,$t0,1  
  add $t2,$a1,$a2
addi $t0,$t0,1  
  move $a1,$a2
addi $t0,$t0,1  
  move $a2,$t2
addi $t0,$t0,1  
  move $v0,$a2
addi $t0,$t0,1  
  j fib
 exit:
addi $t0,$t0,1
  move $a0,$a2
addi $t0,$t0,1  
  li $v0,1
addi $t0,$t0,1
  syscall
print_string(" the number of instruction is ")
addi $t0,$t0,1
  move $a0,$t0
  li $v0,1
  syscall
  li $v0,10
  syscall