.include "macro_print_str.asm"
.text
main:
print_string("Fib(5) is ")
  li $t1,1
  li $a0,5
  addi $t1,$t1,1
  jal fib
  addi $t1,$t1,1
  move $a0,$v0
  addi $t1,$t1,1
  li $v0,1
  addi $t1,$t1,1
  syscall
  print_string(" the number of instruction is")
  addi $t1,$t1,1
  move $a0,$t1
  addi $t1,$t1,1
  li $v0,1
  addi $t1,$t1,1
  syscall
  li $v0,10
  syscall
fib:
        addi $t1,$t1,1
	addi	$sp, $sp, -12
	addi $t1,$t1,1
	sw	$ra, 8($sp)
	addi $t1,$t1,1
	sw	$s0, 4($sp)
	addi $t1,$t1,1
	sw	$a0, 0($sp)
	addi $t1,$t1,1
	bgt	$a0, $0, test2
	addi $t1,$t1,1
	add	$v0, $0, $0
	addi $t1,$t1,1
	j	rtn
test2:
        addi $t1,$t1,1
	addi	$t0, $0, 1
	addi $t1,$t1,1
	bne	$t0, $a0, gen
	addi $t1,$t1,1
	add	$v0, $0, $t0
	addi $t1,$t1,1
	j	rtn
gen:
        addi $t1,$t1,1
	subi 	$a0, $a0, 1
	addi $t1,$t1,1
	jal 	fib
	addi $t1,$t1,1
	add	$s0, $v0, $0
	addi $t1,$t1,1
	sub	$a0, $a0, 1
	addi $t1,$t1,1
	jal	fib
	addi $t1,$t1,1
	add	$v0, $v0, $s0
rtn:	
        addi $t1,$t1,1
	lw	$a0, 0($sp)
	addi $t1,$t1,1
	lw	$s0, 4($sp)
	addi $t1,$t1,1
	lw	$ra, 8($sp)
	addi $t1,$t1,1
	addi	$sp, $sp, 12
	addi $t1,$t1,1
	jr	$ra
