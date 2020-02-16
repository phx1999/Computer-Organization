.data
s: .asciiz "please input positive integer"
w:  .asciiz "wrong input"
zero:  .float 0
one:  .float 1
two:  .float 2
ten:  .float 10
jd: .float 0.000001
.text
la $a0,s
li $v0,4
syscall
 li $v0,6
 syscall
 l.s $f5,jd
d:
 l.s $f1,zero
 mov.s $f2,$f0
 l.s $f8,one
 add.s $f2,$f2,$f8
 mfc1 $t0,$f0
 blt $t0,$zero,exit
 qq:
 sub.s $f3,$f2,$f1
 
  mfc1 $t0,$f3
  mfc1 $t1,$f5
 ble $t0,$t1,p
 add.s $f4,$f1,$f2
  l.s $f7,two
 div.s $f4,$f4,$f7
 mul.s $f6,$f4,$f4
   mfc1 $t0,$f6
  mfc1 $t1,$f0
 beq $t0,$t1,p
 blt $t0,$t1,q1
 mov.s $f2,$f4
 j qq
 q1:
 mov.s $f1,$f4
 j qq
 
 p:
 mov.s $f12,$f4
 li $v0,2
 syscall
 li $v0,10
 syscall
 
 
 exit:
 la $a0,w
 li $v0,4
 syscall
 li $v0,10
 syscall