.data

x: .half 6, -4, 15, 9, -2, 11, 8, 20, 5, 2
res: .space 2 # Result should give 70

.text

la x2, x
la x10, res

li x3, 0 # Accumulator
li x11, 10 # Num of hws

loop:

lh x5, 0(x2) # Load hw
add x3, x3, x5 # Add loaded value into accumulator
addi x2, x2, 2 # Add 2 (bytes) to the pointer of the address for the next value
beq x2, x10, end # If address of next value in x is equal to the start address of res (end address of x), jump to end
jal x0, loop # If not, loop back

end:

div x3, x3, x11 # Divide by num of hws
sw x3, 0(x10) # Save into memory in address given by res
