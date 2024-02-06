#
# Inputs two integers and prints 2 * x * x - 3 * y + 4 

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    slli t4, t0, 1
    mul t2, t0, t4
    
    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    li a0, 3
    mul t5, a0, t1
    sub t6, t2, a0
    addi t3, t6, 4
    
    # printInt(t3)   
    add a0, zero, t3
    li a7, 1
    ecall 