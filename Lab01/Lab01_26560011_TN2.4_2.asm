.text
.globl main
main:
	add $s0,$zero,8
	add $s1,$zero,5
	add $s2,$zero,3
	
	add $t0,$s0,$s1
	sub $t0,$t0,$s2
	addi $t1,$t0,-5
	
	li $v0,10
	syscall
