.data
cj: .word 1,8,3,4,5,6,7,2,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10
k: .asciiz " "
.text
main:
la $t0,cj
li $t1,4
li $a2,0
loop1:
la $a0,k
li $v0,4
syscall
bgt $a2,4,end
add $t0,$t0,40
li $a1,0
li $t2,0
loop2:
bgt $t2,9,cont
mul $t3,$t2,$t1
add $t4,$t3,$t0
lw $t5,($t4)
add $a1,$a1,$t5
addi $t2,$t2,1
j loop2
cont:
la $t0,cj
mul $t2,$a2,40
add $t0,$t0,$t2
addi $a2,$a2,1
li $t1,4
li $t2,0
loop3:
bgt $t2,9,loop1
mul $t3,$t2,$t1
add $t4,$t3,$t0
lw $t5,($t4)
mul $t6,$t5,10
addi $t2,$t2,1
bge $t6,$a1,loop3
move $a0,$t2
li $v0,1
syscall
j loop3


end:
li $v0,10
syscall

