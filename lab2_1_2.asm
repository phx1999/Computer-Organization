.data
str1: .asciiz"please print a"
str2: .asciiz"please print b"
str3: .asciiz"please print c"
str4: .asciiz"please print d"
str5: .asciiz"(a+b*c)/d quotient is : "
str6: .asciiz".  reminder is : "
str7: .asciiz"    11710716 penghongxin"
.text
main:
la $a0,str1
li $v0,4
syscall       #��ӡ������

li $v0,5
syscall
move $t1,$v0        #��ȡ����a

la $a0,str2
li $v0,4
syscall           
li $v0,5
syscall
move $t2,$v0        #��ȡ����b

la $a0,str3
li $v0,4
syscall
li $v0,5
syscall 
move $t3,$v0        #��ȡ����c

la $a0,str4
li $v0,4
syscall
li $v0,5
syscall
move $t4,$v0      #��ȡ����d

la $a0,str5
li $v0,4
syscall

mul $t5,$t2,$t3
add $t2,$t1,$t5
divu $t2,$t4         #����(a+b*c)/d
mflo $a0
li $v0,1              #��ȡ����ӡ��
syscall        

la $a0,str6
li $v0,4
syscall          

mfhi $a0
li $v0,1
syscall           #��ȡ����ӡ����

la $a0,str7
li $v0,4
syscall

li $v0,10
syscall
