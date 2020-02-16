.data
fneg1: .double -1
fpos1: .double 1
.text
l.d $f0,fneg1
l.d $f2,fpos1
add.s $f0,$f1,$f3
li $v0,10
syscall