# Listing 1 - one procedure, called from two places
.data
starLine: .asciiz "**********\n"
title:  .asciiz "SCORE REPORT\n"
endMsg: .asciiz "END\n"
line:   .asciiz "----------\n"
 
.text
.globl main
main:
    la $a0, starLine
    jal  sep                # call (1)
    la $a0, title
    jal  sep                # call (2)
    la $a0, line
    jal  sep                # call (3)
    la $a0, endMsg
    jal  sep                # call (4)
    la $a0, starLine
    jal  sep                # call (5)
    
    li   $v0, 10
    syscall
 
sep:
    li   $v0, 4
    syscall
    jr   $ra                # return to the caller