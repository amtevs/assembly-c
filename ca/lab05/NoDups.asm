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
     li t1, 0 
     li t3, 0
     
     read_int(t2)
     mv t4, t2
     slli x5, t2, 2
     
     li a7, 9
     add a0, x5, zero
     ecall
     
     mv t0, a0
     mv t6, t0
loop:
     beq t1, t4, mass
     read_int(s1)
     mv s2, s1
     addi t1, t1, 1
     
     li t5, 0
     mv t2, t6
     j proof
proof:
     beq t5, t3, unique
     lw s1, 0(t2)
     beq s1, s2, loop
     addi t2, t2, 4
     addi t5, t5, 1
     j proof
unique: 
     sw s2, 0(t0)
     addi t0, t0, 4
     addi t3, t3, 1
     j loop
mass:
     beqz t3, endend
     j print
endend:
     print_char('\n')
print:
     beqz t3, end
     lw s3, 0(t6)
     print_int(s3)
     print_char('\n')
     addi t6, t6, 4
     addi t3, t3, -1
     j print
end:
     
