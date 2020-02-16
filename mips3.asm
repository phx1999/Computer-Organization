.data
	arrayx:.word 11
	.text
	main:
		la $t0,arrayx
		move $a0,$t0
		li $v0,1
		syscall 
		
		li,$v0,10
		syscall 