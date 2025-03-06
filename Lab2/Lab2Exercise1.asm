.text

addi x10, x0, 0      # First addr. of “x” | x10 = 0
addi x20, x10, 40    # First addr. of “y” | x20 = 40
addi x30, x20, 40    # First addr. of "z” | x30 = 80
addi x5, x30, 40     # Final of "z" | 120
addi x25, x0, 3      # x25 = 3

for:

lw x2, 0(x10)        # x2 = (x10)

addi x20, x20, 4     # x20 = x20 + 4 | Next value (+4B)

mul x2, x2, x25      # x2 = x2 * x25 | x2 = x2 * 3

lw x3, -4(x20)        # x3 = (x20)

addi x30, x30, 4     # x30 = x30 + 4 | Next value (+4B)

addi x10, x10, 4     # x10 = x10 + 4 | Next value (+4B)

add x2, x2, x3       # x2 = x2 + x3

sw x2, -4(x30)        # (x30) = x2
bne x30, x5, for     # While x30 != x5 : for | While x30 != 120 : for