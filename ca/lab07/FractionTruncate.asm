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
	fcvt.d.w f1, t0
	fcvt.d.w f2, t1
	fdiv.d fa0, f1, f2
	mv a0, t2
	jal division
	fmv.d f2, fa0
	
	li       a7, 3      # print float result
   	fmv.d    fa0, f2
   	ecall
   	print_char('\n')
   	j endend
	
	
division:
	li t3, 10
	li t5, 1
	li t4, 0
	for:
	beq t4, a0, end_for
	mul t5, t5, t3
	addi t4, t4, 1
	j for
	end_for:
	fcvt.d.w f4, t5 # float 10^n
	fmul.d fa0, fa0, f4 
	fcvt.w.d t6, fa0 # integer a/b*10^n
	fcvt.d.w fa0, t6 #float a/b*10^n
	fdiv.d fa0, fa0, f4 #a/b*10^n/10^n
	jr ra
	
endend:
	
	
