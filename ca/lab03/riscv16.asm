#
# x < -5 & y > 10
    .text
main:
    #read first int(x)
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    
    # y: t3 = readInt()
    addi a1, zero, 5
    ecall
    add t1, zero, a0
    
    slti t2, t0, -5
    li t4, 10
    slt t3, t4, t1 
    and t5, t3, t2 

    #print
    add a0, zero, t5
    li a7, 35
    ecall