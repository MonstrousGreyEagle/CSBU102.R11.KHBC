# Listing 4 - the index of the element is held in a register
# Register plan:  $s0 = address of scores[0]   $s1 = i
.data
scores: .word 40, 55, 70, 85, 100
msg:    .asciiz "Total: "
nl:     .asciiz "\n"
 
.text
.globl main
main:
    
    la   $s0, scores      # $s0 = address of scores[0]
    addi $s1, $zero, 1
    addi $t0, $zero, 28
    sll  $t1, $s1, 2
    
    add  $t1, $s0, $t1
    sw   $t0, 0($t1)
    
    addi $t2, $zero, 0
    addi $t3, $zero, 5
    addi $s3, $zero, 0
    
start:

    slt  $t0, $t2, $t3
    beq  $t0, 0, done
    
    sll  $t1, $t2, 2
    add  $t1, $s0, $t1
    lw   $t4, 0($t1)
    add  $s3, $t4, $s3
    
    addi $t2, $t2, 1
    
    j start
    
done:

    la   $a0, msg
    addi $v0, $zero, 4
    syscall
    
    move $a0, $s3
    addi $v0, $zero, 1
    syscall
    
    la   $a0, nl
    addi $v0, $zero, 4
    syscall