.data
  a: .word 1
  b: .word 2
  c: .word 3
  d: .word 4
  str1: .asciiz"(a+b*c)/d quotient is : "
  str2: .asciiz".  reminder is : "
  str3: .asciiz"    11710716 penghongxin"
.text
la $a0,str1
li $v0,4       #��ӡ��һ��
syscall

   lw $t1,b         
   lw $t2,c         #��ȡb��c
   mul $t0,$t1,$t2    #bc���
   lw $t3,a
   add $t1,$t0,$t3    #����a+bc
   lw $t2,d             
   divu $t1,$t2       #����(a+b*c)/d   
   mflo $a0             #��ȡ��
   li $v0,1
   syscall

 	la $a0,str2
 	li $v0,4
 	syscall
 	
   mfhi $a0
   li $v0,1
   syscall           #��ȡ���������
  
 	la $a0,str3
 	li $v0,4
 	syscall
   li $v0,10
   syscall


#        (a+b*c)/d quotient is : 1.  reminder is : 3    11710716 penghongxin
#          -- program is finished running --