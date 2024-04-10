
# Example that demonstrates MMIO in Digital Lab Sim.
#
# It works with hexadecimal keyword.
#
# See Help on Digital Lab Sim for details.
#

    .macro print_int (%x)
    li a7, 1
    mv a0, %x
    ecall
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
   
     .macro read_int(%x)
    li a7, 5
    ecall
    mv %x, a0
    .end_macro

   .macro print_bin (%x)
   li a7, 35
   mv a0, %x
   ecall
   .end_macro


.macro exit
    li      a7, 10
    ecall
.end_macro

.macro print_hex(%x)
    mv      a0, %x
    li      a7, 34
    ecall
.end_macro

.macro newline
    li      a0, '\n'
    li      a7, 11
    ecall
.end_macro

    .text
main:
    read_int(t6)
    li s11, 268435456
    li s10, 16
    li s9, 0
    li s8, 0
    
    lui     s0, 0xffff0   # MMIO base
    mv      s1, zero      # counter
    mv      s2, zero      # previous value
    li      s3, 8        # counter limit
    mv      a3, zero      # is first digit
loop:
    li      t0, 1         # check first row
    sb      t0, 0x12(s0)  # scan
    lb      t1, 0x14(s0)  # get result
    bnez    t1, pressed   # process key pressed

    li      t0, 2         # check second row
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    li      t0, 4         # check third row
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    li      t0, 8         # check fourth row
    sb      t0, 0x12(s0)
    lb      t1, 0x14(s0)
    bnez    t1, pressed

    mv      s2, zero  # reset previous value
    j       loop  # nothing is pressed (t1 == 0) - repeat
pressed:
  #  beq     t1, s2, loop # repeat if the same key value
    mv      s2, t1 # save current value
    
    andi t2, t1, 15 # t2->Y
    mv t3, t1
    srli t3, t3, 4 # t3->X
    mv a0, t2
    jal dumb_log2
    mv t2, a0
    mv a0, t3
    jal dumb_log2
    mv t3, a0
    
    addi t2, t2, -1
    li t4, 4
    mul t2, t2, t4
    add t2, t2, t3
    addi t2, t2, -1
    
    mv t5, t2

    j end_write

end_write:
    
    # Prints the pressed key in format 0xXY, where X is column, Y is row.
    # Both X and Y are specified as bit flags (0x1, 0x2, 0x4, 0x8).
    # Bit position means the number of row/column (0x1 -> 1, 0x2 -> 2, 0x4 -> 3, x8 -> 4).
    #print_hex(t1)
    #newline
    mul t5, s11, t5
    add s9, t5, s9
    div s11, s11, s10
    
    addi    s1, s1, 1    # counter increment
    blt     s1, s3, loop # repeat if s1 <= s3
    
    beq t6, s9, end
    beq s9, s8, end_bad

    li s11, 268435456
    li s10, 16
    li s9, 0
    j loop
end:
    print_str("FOUND")
    exit
end_bad:
    print_str("STOPPED")
    exit


dumb_log2:
    li a1, 1
    bne a0, a1, not1
    jalr zero, 0(ra)
not1:
    li a1, 2
    bne a0, a1, not2
    jalr zero, 0(ra)
not2:
    li a1, 4
    bne a0, a1, not4
    li a0, 3
    jalr zero, 0(ra)
not4:
    li a0, 4
    jalr zero, 0(ra)
