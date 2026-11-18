.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0
space: .asciiz " "
nl:    .asciiz "\n"

.text
.globl main
main:
    la   $s0, board


    addi $s1, $zero, 1
    addi $s2, $zero, 2
    sll  $t0, $s1, 1
    add  $t0, $t0, $s1
    add  $t0, $t0, $s2
    sll  $t1, $t0, 2
    add  $t2, $s0, $t1
    addi $t4, $zero, 1
    sw   $t4, 0($t2)


    addi $s1, $zero, 2
    addi $s2, $zero, 0
    sll  $t0, $s1, 1
    add  $t0, $t0, $s1
    add  $t0, $t0, $s2
    sll  $t1, $t0, 2
    add  $t2, $s0, $t1
    addi $t4, $zero, 2
    sw   $t4, 0($t2)


    addi $t5, $zero, 0
    addi $t7, $zero, 0
print_board:
    sll  $t6, $t5, 2
    add  $t6, $s0, $t6
    lw   $a0, 0($t6)
    li   $v0, 1
    syscall

    addi $t7, $t7, 1
    addi $t5, $t5, 1
    addi $t0, $zero, 3
    beq  $t7, $t0, print_newline
    la   $a0, space
    li   $v0, 4
    syscall
    j    check_board_end

print_newline:
    la   $a0, nl
    li   $v0, 4
    syscall
    addi $t7, $zero, 0

check_board_end:
    addi $t0, $zero, 9
    bne  $t5, $t0, print_board

    li   $v0, 10
    syscall
