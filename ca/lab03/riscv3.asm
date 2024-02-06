#
# Inputs two integers and prints (x << y) - 10

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    sll a1, t0, t1
    addi t3, a1, -10
    
    # printInt(t3)    
    add a0, zero, t3
    li a7, 1
    ecall
