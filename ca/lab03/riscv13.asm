#
# reset the y-th bit of x to 0 (bit numbers start from 0)
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
    
    xori t1, t1, -1
    and t2, t2, t1
    
    #print
    add a0, zero, t2
    li a7, 35
    ecall
