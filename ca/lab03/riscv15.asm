#
# (x == (y + 3)) ? 0 : 1
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
    
    addi t2, t1, 3
    slt t3, t0, t2
    slt t4, t2, t0
    
    add t5, t3, t4 

    #print
    add a0, zero, t5
    li a7, 35
    ecall
