.data

x: .word 6, -4, 13, 8, -2, 11, 7, 20, 9, -3, -12, 5, 1, 23, -25, 8 # Values
contP: .space 4 # Num of pos numbers, should be 11
contN: .space 4 # Num of neg numbers, should be 5

.text

la x2, x # Load address of first value of x
la x10, contP # Load address of pos counter
la x11, contN # Load address of neg counter
li x3, 0 # Positive counter
li x4, 0 # Negative counter
li x5, 0 # Temp Loader

loop:

beq x2, x10, end # If values address is equal to the start address of contP (we have traversed all necessary addresses), branch to end
lw x5, 0(x2) # Load in x5 first value of x
addi x2, x2, 4 # Add 2 bytes to the pointer of the values
bgez x5, greater # If greater/equal than 0, jump to greater
jal x0, smaller # Else, jump to smaller

greater:

addi x3, x3, 1 # Increase positive counter
jal x0, loop # Jump back to loop

smaller:

addi x4, x4, 1 # Increase negative counter
jal x0, loop # Jump back to loop

end:

sw x3, 0(x10) # Write positive counter to contP address
sw x4, 0(x11) # Write negative counter to contN address
