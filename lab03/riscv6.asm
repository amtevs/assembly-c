#
# Inputs two integers and prints x * 6 - y * 3 = x*4 + x*2 - y*2 - y

    .text
main:
    #x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    slli t2, t0, 2
    slli t4, t0, 1
    add t5, t2, t4
    
    #y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    
    slli a0, t1, 1
    add a1, a0, t1
    sub t3, t5, a1
    
    # printInt(t3)   
    add a0, zero, t3
    li a7, 1 
    ecall
