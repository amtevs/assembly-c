#
# Inputs two integers and prints ((x << 2) - y + 5) >> 1

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    slli t2, t0, 2
    
    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    sub t4, t2, t1
    addi t5, t4, 5
    srai t3, t5, 1
    
    # printInt(t3)    
    add a0, zero, t3
    li a7, 1
    ecall
