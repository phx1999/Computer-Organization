.data
 	arrayx:.word 11
 	.text
 	main:
 		lw $a0,arrayx
 		li $v0,1
 		syscall
 		
 		li,$v0,10
 		syscall