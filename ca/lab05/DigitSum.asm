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
    li t1, 10
    li t5, 0
loop:
    beqz t0, end_loop
    rem t2, t0, t1
    bltz t2, if1
    add t5, t5, t2
    j continue
if1:
    sub t5, t5, t2
    j continue
continue:
    div t0, t0, t1
    j loop
end_loop: 
    print_int(t5)
    print_char('\n')