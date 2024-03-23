    .macro print_int (%x)
    li a7, 1
    mv a0, %x
    ecall
    .end_macro
    
    .macro read_int(%x)
    li a7, 5
    ecall
    mv %x, a0
    .end_macro
    
    .macro print_char(%x)
    li a7, 11
    li a0, %x
    ecall
    .end_macro
    
    .text
main:
    read_int(t0)
    li t1, 0
    li t2, 0
    li t5, 2
loop:
    beq t2, t0, end_loop
    read_int(t4)
    rem t3, t2, t5
    addi t2, t2, 1
    beqz t3, plus
    sub t1, t1, t4
    j loop
plus:
    add t1, t1, t4
    j loop
end_loop:
    print_int(t1)
    print_char('\n')