    .macro print_char(%x)
    li a7, 11
    li a0, %x
    ecall
    .end_macro

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

main:
	
	read_int(t0)
	mv s1, t0 
	#li s1, 4
	#addi s1, s1, 2
	li t0, 0
	li t1, 1
	li t2, 10
	li t6, 4
	fcvt.d.w f10, t6
	pow:
	beq t0, s1, end_pow
	mul t1, t1, t2
	addi t0, t0, 1
	j pow
	end_pow:
	mv t5, t1
	#fcvt.d.w f1, t1 # f1 = 10^n
	li t1, 1
	fcvt.d.w f2, t1 # f2 = 1
	#fdiv.d f1, f2, f1 # f1 = 1/10^n
	
	li t0, -1
	fcvt.d.w f12, t0 # f0 = -1 sign 
	fcvt.d.w f7, t6 # f7 = 4
	li t3, 2
	fcvt.d.w f5, t3 # f5 = 2
	li t1, 0
	fcvt.d.w f3, t1 # f3 = i(0) iter
	fcvt.d.w f4, t1 # f4 = pi(0)
	li s10, 50000
	while:		
	fmv.d f8, f4 # f8 результат предыдущей итерации
	fmul.d f6, f5, f3 # f6 = 2 * i
	fadd.d f6, f6, f2 # f6 = f6 + 1
	fdiv.d f6, f7, f6 # f6 = 1/(2*i + 1)
	fmul.d f7, f7, f12 # f7 меняет знак 
	fadd.d f4, f4, f6 # pi += f6
	fadd.d f3, f3, f2 # i += 1
	
	#fsub.d f9, f8, f4 # f9 = f8 - pi
	#fabs.d f9, f9 
	#flt.d t4, f1, f9 # если точность больше или равна результату то выходим из цикла
	addi s10, s10, -1
	beqz s10, end_while
	j while
	end_while:	
	#fmul.d f4, f4, f10
	
	#div t5, t5, t2
	#div t5, t5, t2
	
	fcvt.d.w f1, t5

	fmul.d f4, f1, f4 
	fcvt.w.d t6, f4 # integer pi*10^n
	fcvt.d.w f4, t6 #float pi*10^n
	fdiv.d f4, f4, f1 #pi*10^n/10^n
	
	li       a7, 3     
   	fmv.d    fa0, f4
   	ecall
   	print_char('\n')
	
	
