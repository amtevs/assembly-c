#
# set the y-th bit of x to 1 (bit numbers start from 0)

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
    
    li t2, 1
    sll t3, t2, t1
    or t5, t0, t3     
    
    # printInt(t5)    
    add a0, zero, t5
    li a7, 35
    ecall
