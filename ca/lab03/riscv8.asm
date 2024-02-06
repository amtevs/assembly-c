#
# Inputs two integers and prints (x + 5) / y + 10 / (y - 1)

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    addi t2, t0, 5
    
    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    div t3, t2, t1
    addi t4, t1, -1
    li a0, 10
    div a1, a0, t4
    add a2, a1, t3
    
    # printInt(a2)    
    add a0, zero, a2
    li a7, 1
    ecall
