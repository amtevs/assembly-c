#
# Inputs two integers and prints (x >> 2) + ((y - 1) << 3)

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    srli a2, t0, 2

    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    addi t2, t1, -1
    slli a1, t2, 3
    add t3, a2, a1
    
    # printInt(t3)   
    add a0, zero, t3
    li a7, 1 
    ecall
