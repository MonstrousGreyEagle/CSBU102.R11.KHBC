.text
.globl main
main:
	add $s0,$zero,8
	add $s1,$zero,5
	add $s2,$zero,3
	
	add $t0,$s0,$s1

sub $t3,$zero,$s0

add $t3,$t3,$s1
	
	li $v0,10
	syscall
