.include "macro_print_str.asm"
.data
.text
main:
print_string("please input an integer : ")
li $v0,5         #��ȡ����
syscall
move $t0,$v0
sll $t1,$t0,3            #��������3λ
sll $t2,$t0,1            #��������1λ
add $t0,$t1,$t2          #����ʮ�����
print_string("the result of 10x is��")
move $a0,$t0
li $v0,1                 #���
syscall
end

#              please input an integer : 4
#              the result of 10x is40
#              -- program is finished running --