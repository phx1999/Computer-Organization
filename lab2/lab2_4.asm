.include "macro_print_str.asm"
.data
.text
main:
print_string("please input an integer : ")
li $v0,5         #获取输入
syscall
move $t0,$v0
sra $t1,$t0,31            #整体右移31位
sll $t2,$t1,1            #整体左移1位    若原码为正数 转移后为0    若原码为负数 转移后结果为-2
addu $t0,$t2,1           #将位移后的结果加一
mul $t1,$t0,$v0          #乘以原数字
print_string("absolute value of x is：")
move $a0,$t1
li $v0,1                 #输出
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
