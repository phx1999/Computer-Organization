.include "macro_print_str.asm"
.data 
tdata: .word 0x87654321
.text
main:
lh $t0,tdata   #��ȡ���λ
la $t1,tdata   
addi $t2,$t1,3    #�������λ��ַ
lb $t3,($t2)         #��ȡ���λ
sb $t0,($t2)
sb $t3,($t1)      #ת��
lw $a0,tdata
li $v0,34
syscall
end
#      0x21654387
#      -- program is finished running --