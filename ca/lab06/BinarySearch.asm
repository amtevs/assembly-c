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


#a0 pointer to sorted array
#a1 value to find
#a2 start indices
#a3 end indices
binary_search:
	sub t0 a3, a2
	li t1, 2
	div t0, t0, t1
	add t0, a2, t0
	#t0 = start + (end - start) / 2
	blt a3, a2, if_start_more
	slli t2, t0, 2
	add t3, a0, t2
	lw t4, 0(t3)
	#t4 = data[mid]
	beq t4, a1, if_data_eq
	blt a1, t4, if_data_more 
	#return binary_search(data, value, mid + 1, end);
	addi sp, sp, -12
	sw ra, 8(sp)
	sw a2, 4(sp)
	sw a3, 0(sp)
	addi a2, a2, 1
	jal ra, binary_search
	
	lw a2, 4(sp)
	lw a3, 0(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	jalr zero, 0(ra)
if_start_more:
	li a0, -1
	jalr zero, 0(ra)
if_data_eq:
	mv a0, t0
	jalr zero, 0(ra)
if_data_more:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw a2, 4(sp)
	sw a3, 0(sp)
	addi a3, a3, -1
	jal ra, binary_search
	
	lw a2, 4(sp)
	lw a3, 0(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	jalr zero, 0(ra)


