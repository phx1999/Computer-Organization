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
syscall       #打印请输入

li $v0,5
syscall
move $t1,$v0        #获取输入a

la $a0,str2
li $v0,4
syscall           
li $v0,5
syscall
move $t2,$v0        #获取输入b

la $a0,str3
li $v0,4
syscall
li $v0,5
syscall 
move $t3,$v0        #获取输入c

la $a0,str4
li $v0,4
syscall
li $v0,5
syscall
move $t4,$v0      #获取输入d

la $a0,str5
li $v0,4
syscall

mul $t5,$t2,$t3
add $t2,$t1,$t5
divu $t2,$t4         #计算(a+b*c)/d
mflo $a0
li $v0,1              #提取并打印商
syscall        

la $a0,str6
li $v0,4
syscall          

mfhi $a0
li $v0,1
syscall           #提取并打印余数

la $a0,str7
li $v0,4
syscall

li $v0,10
syscall
