# Listing 7
.data
prompt: .asciiz "Enter reading (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total:   "
nl:     .asciiz "\n"
 
.text
read:
    li   $v0, 4
    add   $a0, $s7, $zero
    syscall
    li   $v0, 5      
    syscall
    add  $s7, $v0, $zero  
    jr $ra
    
print:
    li   $v0, 4
    add   $a0, $s6, $zero
    syscall
    li   $v0, 1
    add   $a0, $s7, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr $ra

.globl main
main:
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    
    la $s7,m1
    jal read
    add $s0,$s7,$zero
    
    la $s7,m2
    jal read
    add $s1,$s7,$zero
    
    la $s7,m3
    jal read
    add $s2,$s7,$zero
    
    la $s7,tot
    jal read
    add $s3,$s7,$zero
    
    sub $t0,$s1,$s0
    sub $t1,$s2,$s1
    sub $t2,$s3,$s2
    add $t3,$zero,$t0
    add $t3,$t3,$t1
    add $t3,$t3,$t2
    
    add $s0,$t0,$zero
    add $s1,$t1,$zero
    add $s2,$t2,$zero
    add $s3,$t3,$zero
    
    li   $v0, 4
    la   $a0, nl
    syscall
    
    la $s6,m1
    add $s7,$s0,$zero
    jal print
    
    la $s6,m2
    add $s7,$s1,$zero
    jal print
    
    la $s6,m3
    add $s7,$s2,$zero
    jal print
    
    la $s6,tot
    add $s7,$s3,$zero
    jal print
 
    li   $v0, 10
    syscall
