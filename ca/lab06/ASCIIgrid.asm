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
    
    .macro printline(%num, %ch1, %ch2)
    mv s1, %num
    while:
    beqz s1, end
    print_char(%ch1)
    print_char(%ch2)
    addi s1, s1, -1
    j while
    end:
    print_char(%ch1)
    print_char('\n')
    .end_macro      

    .text
    
main:
     read_int(t0)
     read_int(t1)
     beqz t0, endzero
     beqz t1, endzero
for:
     beqz t1, endend
     printline(t0, '+', '-')
     printline(t0, '|', ' ')
     addi t1, t1, -1
     j for
endzero:
     print_char('\n')
     j finish
endend:
     printline(t0, '+', '-')
     print_char('\n')
finish:
 
     