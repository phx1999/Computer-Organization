.include "macro_print_str.asm"
.data
.text
main:
print_string("please input an integer : ")
li $v0,5         #��ȡ����
syscall
move $t0,$v0
sra $t1,$t0,31            #��������31λ
sll $t2,$t1,1            #��������1λ    ��ԭ��Ϊ���� ת�ƺ�Ϊ0    ��ԭ��Ϊ���� ת�ƺ���Ϊ-2
addu $t0,$t2,1           #��λ�ƺ�Ľ����һ
mul $t1,$t0,$v0          #����ԭ����
print_string("absolute value of x is��")
move $a0,$t1
li $v0,1                 #���
syscall
end
#      please input an integer : -3
#      absolute value of x is3
#      -- program is finished running --

#      please input an integer : 100
#      absolute value of x is100
#      -- program is finished running --

#      please input an integer : -111
#      absolute value of x is111
#      -- program is finished running --
