.data

res: .space 4
v1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
v2: .space 20

.text

addi x30, x0, 0 # Load into x30, the value 0
addi x31, x0, 30 # Load into x31, the value of 30

la x10, v1 # Load into x10 the starting address of the values of v1

addi x1, x10, -4 # Load into x1 the address of the values of res (Substracting 4 bytes from the address in x10)
addi x20, x10, 40 # Load into x20 the address of the value of v2 (Adding 40 bytes from the address in x10)

follows:

lw x11, 0(x10) # Load into x11 the value stored in the address x10, which is 1 (First element of v1)
lw x12, 4(x10) # Load into x12 the value stored in the address x10 + 4, which is 2 (Second element of v1)
add x13, x11, x12 # Add into x13, the values of x11 and x12 (1 + 2)
sw x13, 0(x20) # Save in the address in x20, the value of x13 (3), so occupying the first 4 bytes out of 20 free bytes
add x30, x30, x13 # Save in x30 the sum of x30 + x13 (0 + 3), so x30 = 3
addi x10, x10, 8 # Save in x10 the value of x10 + 8 (So the address of the number 3 in v1)
addi x20, x20, 4 # Save in x20 the value of x20 + 4 (So the start address of the remaining 16 bytes in v2)
blt x30, x31, follows # If x30 is less than x31, loop (While x30 is less than 30, keep looping)

sw x30, 0(x1) # Else, Save in x30 the value in the address of x1, which is the free space of 4 bytes of res
