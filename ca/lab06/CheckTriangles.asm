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
    
    .macro swap(%x, %y)
    mv t0, %x
    mv %x, %y
    mv %y, t0
    .end_macro
 
    	.text
main: 
	li t2, 1
	li t3, 2
	for:
	read_int(t4)
	read_int(t5)
	read_int(t6)
	mv a2, t4
	mv a3, t5
	mv a4, t6
	jal check_triangle
	beq a0, t2, Y
	beq a0, t3, N
	print_char('\n')
	j end
	Y:
	print_char('Y')
	print_char('\n')
	j for
	N:
	print_char('N')
	print_char('\n')
	j for  

check_triangle:
	blt a4, a3, change1
	j continue1
	change1:
	#mv t0, a4
        #mv a4, a3
        #mv a3, t0
	swap(a4, a3)
	continue1: 
	blt a4, a2, change2
	j continue2
	change2:
	swap(a2, a4)
	#mv t0, a4
        #mv a4, a2
        #mv a2, t0
	continue2:
	beq a4, a2, equal
	continue3:
	add t1, a2, a3
	bge t1, a4, finish1
	j finish3
	finish3:
	li a0, 2
	jalr zero, 0(ra)
	finish1:
	li a0, 1
	jalr zero, 0(ra)
	equal:
	beq a4, a3, finish2
	j continue3
	finish2:
	li a0, 0
	jr ra

end:


	
	
	