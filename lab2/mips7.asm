.include "macro_print_str.asm"
.data
.text
main:
print_string("please input an integer : ")
li $v0,5
syscall
move $t0,$v0
nor $t1,$zero,$zero
srl $t2,$t1,31
print_string("it is an odd number (0: false,1:true) : ")
and $a0,$t2,$t0
li $v0,1
syscall   
end
# qiushi shabi 
