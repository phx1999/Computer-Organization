.data
xs: .space 6
bs: .byte 1,2,3,4,5
strs: .asciiz "12345","ABCDE"
.text
main:
#insert code here to print the string "ABCDE" of strs
la $a0,strs
addi $a0,$a0,6
li $v0,4
syscall
li $v0,10
syscall