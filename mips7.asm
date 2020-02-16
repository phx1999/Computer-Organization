.data 
str: .asciiz "abc"
.text
main:
la $a0,str               #提取a的地址
lb $t0,($a0)             #将a赋予t0
sub $t0,$t0,32           #将a转化为A
sb $t0,($a0)             #将A储存到a0这个地址中 覆盖a     
addi $a0,$a0,1           #提取b的地址
lb $t0,($a0)             #将b赋予t0
sub $t0,$t0,32           #将b转化为B
sb $t0,($a0)             #将B储存到a0这个地址中 覆盖b 
addi $a0,$a0,1           #提取c的地址
lb $t0,($a0)             #将c赋予t0
sub $t0,$t0,32           #将c转化为C
sb $t0,($a0)             #将C储存到a0这个地址中 覆盖c 
la $a0,str               #获取整个字符串地址
li $v0,4                 #打印字符串
syscall
li $v0,10
syscall


#     ABC
#     -- program is finished running --