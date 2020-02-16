.data
.text
main:
li $s0,0x80000000
li $t1,0xD0000000
add $t0, $s0, $s1
add $t0, $t0, $s0
move $a0,$t0
li $v0,1