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
    
   .macro print_str (%x)
   .data
str:
   .asciz %x
   .text
   li a7, 4
   la a0, str
   ecall
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
     li x2, 2 

     read_int(t2)
     addi t4, t2, 0
     slli x5, t2, 2
     
     li a7, 9
     add a0, x5, zero
     ecall
     addi t0, a0, 0
loop:
     beq t1, t4, mass
     read_int(s1)
     addi s2, s1, 0
     addi t1, t1, 1
     rem t6, s2, x2
     beqz t6, even
     j loop
even: 
     sw s2, 0(t0)
     addi t0, t0, 4
     addi t3, t3, 1
     j loop
mass:
     beqz t3, end
     j print
print:
     beqz t3, endend
     addi t0, t0, -4
     lw x3, 0(t0)
     print_int(x3)
     print_char('\n')
     addi t3, t3, -1
     j print
end:
     print_char('\n')
     j endend
endend:
     print_str("")
