# Listing 8 - capital letters at chosen positions of a string
# Register plan:  $s0 = address of the first byte of str1
.data
str1: .asciiz "nguyen van an"
tag:  .asciiz " [end]"
nl:   .asciiz "\n"
 
.text
.globl main
main:
    la   $s0, str1        # $s0 = address of str1
    
    addi $t0, $zero, 0
    add  $t0, $t0, $s0
    lbu  $t1, 0($t0)
    addi $t1, $t1, -0x20
    sb   $t1, 0($t0)
    # >>> make the byte at offset 0 a capital letter
    
    addi $t0, $zero, 7
    add  $t0, $t0, $s0
    lbu  $t1, 0($t0)
    addi $t1, $t1, -0x20
    sb   $t1, 0($t0)
    # >>> make the byte at offset 7 a capital letter
    
    addi $t0, $zero, 11
    add  $t0, $t0, $s0
    lbu  $t1, 0($t0)
    addi $t1, $t1, -0x20
    sb   $t1, 0($t0)
    # >>> make the byte at offset 11 a capital letter
    li   $v0, 4           # service 4: print the string that starts at $a0
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall