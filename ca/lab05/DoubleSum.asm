    #.include "macrolib.s"    
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
    read_int(t1)
    read_int(t2)
    read_int(t3)
    
    add t4, t0, t2
    add t5, t1, t3
    
    print_int(t4)
    print_char('\n')
    print_int(t5)
    print_char('\n')
