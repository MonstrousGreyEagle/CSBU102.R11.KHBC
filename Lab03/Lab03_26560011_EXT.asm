.data
classA: .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB: .word 45, 81, 66, 50, 92, 38, 70, 59
msgAMin: .asciiz "Class A minimum: "
msgAMax: .asciiz "Class A maximum: "
msgBMin: .asciiz "Class B minimum: "
msgBMax: .asciiz "Class B maximum: "
nl: .asciiz "\n"
.text
.globl main
main:
    la   $a0, classA
    li   $a1, 10
    jal  min_max
    add  $s0, $v0, $zero
    add  $s1, $v1, $zero
    la   $a0, msgAMin
    add  $a1, $s0, $zero
    jal  show
    la   $a0, msgAMax
    add  $a1, $s1, $zero
    jal  show

    la   $a0, classB
    li   $a1, 8
    jal  min_max
    add  $s0, $v0, $zero
    add  $s1, $v1, $zero
    la   $a0, msgBMin
    add  $a1, $s0, $zero
    jal  show
    la   $a0, msgBMax
    add  $a1, $s1, $zero
    jal  show

    li   $v0, 10
    syscall

# min_max(addr = $a0, n = $a1): returns minimum in $v0, maximum in $v1
min_max:
    lw   $t0, 0($a0)          # minimum = first element
    add  $v0, $t0, $zero
    add  $v1, $t0, $zero      # maximum = first element
    li   $t1, 1               # i = 1
mm_loop:
    slt  $t2, $t1, $a1
    beq  $t2, $zero, mm_end
    sll  $t3, $t1, 2
    add  $t3, $t3, $a0
    lw   $t4, 0($t3)
    slt  $t5, $t4, $v0
    beq  $t5, $zero, mm_check_max
    add  $v0, $t4, $zero
mm_check_max:
    slt  $t5, $v1, $t4
    beq  $t5, $zero, mm_next
    add  $v1, $t4, $zero
mm_next:
    addi $t1, $t1, 1
    j    mm_loop
mm_end:
    jr   $ra

# show(msg = $a0, value = $a1): prints message, value and newline
show:
    li   $v0, 4
    syscall
    li   $v0, 1
    add  $a0, $a1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra
