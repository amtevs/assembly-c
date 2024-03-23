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
 
 
#a0 - start, a1 - end 
main: 
	read_int(t0) #size
	beqz t0, endzero 
	mv s9, t0
	slli x5, t0, 2
	li a7, 9
     	add a0, x5, zero
     	ecall
     	mv t1, a0 #massiv
	mv t2, a0
     	li s1, 0
     	for:
     	beq s1, s9, end_for
     	read_int(s2)
     	sw s2, 0(t1)
     	addi s1, s1, 1
     	addi t1, t1, 4
     	j for
     	end_for:
     	mv a0, t2
     	mv a1, t1
     	jal sort
     	li s1, 0
     	for_print:
     	beq s1, s9, endend
     	lw s7, 0(t2)
     	print_int(s7)
     	addi s1, s1, 1
     	beq s1, s9, endzero
     	print_char(' ')
     	addi t2, t2, 4
     	j for_print
     	
#a0 - указатель на начало а1 - указатель на конец    	
sort:
	li t3, 0 #i
	li t4, 0 #j
	sub s3, a1, a0
	li s11, 4
	div t5, s3, s11 # size
	addi t5, t5, -1
	for1:
	beq t3, t5, end1
	for2:
	sub t6, t5, t3
	beq t4, t6, end2
	
	slli t0, t4, 2
	add t0, t0, a0
	lw s5, 0(t0) 
	addi t0, t0, 4
	lw s6, 0(t0)
	blt s6, s5, if
	addi t4, t4, 1
	j for2
	if:
	#swap
	sw s5, 0(t0)
	addi t0, t0, -4
	sw s6, 0(t0)
	
	addi t4, t4, 1
	j for2
	end2:
	li t4, 0
	addi t3, t3, 1
	j for1 
	end1:
	jr ra
     	
endzero:
	print_char('\n')
endend: