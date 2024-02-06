#
# x > y ? 0 : 1
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
    
    slt t3, t0, t1 

    #print
    add a0, zero, t3
    li a7, 35
    ecall
