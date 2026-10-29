.text
.globl main
main:
	add $s0,$zero,8
	add $s1,$zero,5
	add $s2,$zero,3
	
	add $t2,$zero,$s0
	
	li $v0,10
	syscall
