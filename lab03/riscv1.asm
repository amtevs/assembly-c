#
# Inputs two integers and prints their sum.
# (x + 5) - (y - 7)

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    addi a2, t0, 5

    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    addi t2, t1, -7
    sub t3, a2, t2
    
    # printInt(t3)  
    add a0, zero, t3
    li a7, 1  
    ecall
