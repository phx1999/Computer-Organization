
.data
str:.asciiz "abcdefghijklmn"
ans:	.space	100
.text
main:
la $t2,str
li $t0,0
li $t1,13
loop:
    add $t3,$t2,$t0
    lb $t4,($t3)           #提取每一个字符
    beq $t4,$zero,exit       
    sb $t4,ans($t1)        #存入ans
    addi $t0,$t0,1
    sub $t1,$t1,1
    j loop
exit:
   la $a0, ans
   li $v0, 4
   syscall
   li $v0,10
   syscall
 #   nmlkjihgfedcba
#-- program is finished running --