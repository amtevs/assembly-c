#
# Inputs two integers and prints (x / y) * y + x % y

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
    
    div t2, t0, t1
    mul t3, t2, t1
    sub t4, t0, t2
    add t5, t3, t4
    
    # printInt(t5)    
    add a0, zero, t5
    li a7, 35
    ecall