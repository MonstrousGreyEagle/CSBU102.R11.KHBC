# Listing 3 - energy used by a household (fictitious readings, kWh)
# Variable   Register
# reading0   $s0   start of month 1
# reading1   $s1   start of month 2
# reading2   $s2   start of month 3
# reading3   $s3   end of month 3
# usage1     $t0   energy used in month 1
# usage2     $t1   energy used in month 2
# usage3     $t2   energy used in month 3
# total      $t3   usage1 + usage2 + usage3
.text
.globl main
main:
    addi $s0, $zero, 1200
    addi $s1, $zero, 1350
    addi $s2, $zero, 1475
    addi $s3, $zero, 1640
 
    # >>> usage1 = reading1 - reading0
    # >>> usage2 = reading2 - reading1
    
    sub $s3,$s3,$s2
    sub $s2,$s2,$s1
    sub $s1,$s1,$s0
    add $s0,$s1,$zero
    add $s1,$s2,$zero
    add $s2,$s3,$zero
    add $s3,$s3,$s0
    add $s3,$s3,$s1
    
    li $v0,10
    syscall