.include "macro_print_str.asm"
.data
.text
main:
print_string("please input an integer : ")
li $v0,5         #获取输入
syscall
move $t0,$v0
sll $t1,$t0,3            #整体左移3位
sll $t2,$t0,1            #整体左移1位
add $t0,$t1,$t2          #计算十倍结果
print_string("the result of 10x is：")
move $a0,$t0
li $v0,1                 #输出
syscall
end

#              please input an integer : 4
#              the result of 10x is40
#              -- program is finished running --