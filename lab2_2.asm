.data 
str: .asciiz "abc"
.text
main:
la $a0,str               #��ȡa�ĵ�ַ
lb $t0,($a0)             #��a����t0
sub $t0,$t0,32           #��aת��ΪA
sb $t0,($a0)             #��A���浽a0�����ַ�� ����a     
addi $a0,$a0,1           #��ȡb�ĵ�ַ
lb $t0,($a0)             #��b����t0
sub $t0,$t0,32           #��bת��ΪB
sb $t0,($a0)             #��B���浽a0�����ַ�� ����b 
addi $a0,$a0,1           #��ȡc�ĵ�ַ
lb $t0,($a0)             #��c����t0
sub $t0,$t0,32           #��cת��ΪC
sb $t0,($a0)             #��C���浽a0�����ַ�� ����c 
la $a0,str               #��ȡ�����ַ�����ַ
li $v0,4                 #��ӡ�ַ���
syscall
li $v0,10
syscall


#     ABC
#     -- program is finished running --