# Listing 5 - count_pass, to be added to your TN3 file
# count_pass(addr = $a0, n = $a1, mark = $a2): count of words >= mark
count_pass:
    addi $v0, $zero, 0          # count = 0
    addi $t0, $zero, 0          # i = 0
cp_loop:
    # >>> leave the loop (go to cp_end) when i >= n
    slt $t1, $t0, $a1
    beq $t1, 0, cp_end
    # >>> $t3 = element i (its address is $a0 + 4 * i)
    sll $t1, $t0, 2
    add $t1, $t1, $a0
    lw $t3, 0($t1)
    # >>> if $t3 >= mark, count = count + 1
    addi $t0, $t0, 1            # i = i + 1
    slt $t1, $t3, $a3
    beq $t1, 1, cp_loop
    addi $v0, $v0, 1
    j    cp_loop
cp_end:
    jr   $ra