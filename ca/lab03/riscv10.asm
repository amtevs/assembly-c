#
# Inputs two integers and prints x & (-1 << 5)

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    li t1, -1
    slli t2, t1, 5
    and t3, t0, t2
    
    # printInt(t3)    
    add a0, zero, t3
    li a7, 35
    ecall