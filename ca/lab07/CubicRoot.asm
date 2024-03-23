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
    
main:
	li t2, 0
	fcvt.s.w f3, t2 # f3 = l = 0
	li t3, 0 #проверка на отрицательность
	
	li a7, 6
    	ecall
    	fmv.s f11, fa0 # f0 - точность
	
	fge.s t0, f11, f3
	beqz t0, negate
	continue:
	#fcvt.s.w f8, s1 # f8 - x
	#fcvt.s.w f1, s1 # f1 - r 
	fmv.s f1, f11
	
	li a7, 6
    	ecall
    	fmv.s f0, fa0 # f0 - точность
    	
    	li t5, 2 #t5 = 2 int
    	fcvt.s.w f6, t5 #f6 = 2
    	while:
    	fsub.s f2, f1, f3 #f2 = r-l
    	flt.s t4, f0, f2 #<
    	beqz t4, end_while # t4 индент на выход с массива
    	fadd.s f4, f1, f3 # f4 = l + r
    	fdiv.s f5, f4, f6 # f5 = m
    	fmul.s f7, f5, f5 
    	fmul.s f7, f7, f5 #f7 = m*m*m
    	fle.s t6, f7, f11 # t6 индент 
    	beqz t6, else
    	fmv.s f3, f5 # l = m
    	j while
    	else:
    	fmv.d f1, f5 # r = m
    	j while
    	end_while:
    	bgtz t3, neg_chisl # проверка на то негативно ли число
    	con_end_while:    	
    	li t5, 1 
    	fcvt.s.w f10, t5 #f10 = 1
    	feq.s t5, f11, f10 # x == 1
    	beqz t5, print
    	beqz t3, print1
    	neg t5, t5
    	print_int(t5)
    	j endend
    	negate:
	li t3, 1
	li s1, -1 
    	fcvt.s.w f9, s1 # f9 = -1
    	fmul.s f11, f11, f9 # l = -l
	j continue
    	neg_chisl:
    	li t2, -1 
    	fcvt.s.w f9, t2 # f9 = -1
    	fmul.s f1, f1, f9 # l = -l
    	j con_end_while
    	print:
    	li       a7, 2     
   	fmv.s    fa0, f1
   	ecall
   	j endend
    	print1:
    	print_int(t5)
    	endend:
    	print_char('\n')
    	
    	
    	
    	
    	
    	
    	