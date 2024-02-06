#
# Inputs two integers and prints x | (-1 >> 27)

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    li t1, -1
    srli t2, t1, 27
    or t3, t0, t2
    
    # printInt(t3)    
    add a0, zero, t3
    li a7, 35
    ecall