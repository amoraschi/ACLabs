.config
    delayed on

.data 
x:   .word 2 ,4, -6, 8,-10,12,-14, 16,-18, 20, 0 
y:   .word 1,-2,  3,-4,  5,-6,  7, -8, -9,-10 
z:   .space 4 
i:   .space 4 

.text 

  la x2,x 
  la x3,y 
  la x4,z 
  add x20,x0,x0       # x20: Acumulador 
  add x30,x0,x0       # x30: Contador 

rep:
  
  lw x12,0(x2)        # Load word of x in x12
  lw x13,0(x3)        # Load word of y in x13
  beq x12, x0, fin    # If x12 == 0 : jump to fin
  slt x5,x12,x0       # If x12 >= 0 : set x5 to 1
  addi x30,x30,1      # Increase x30 by 1
  beq x5,x0,posX      # If x12 >= 0: jump to posX 
  addi x2,x2,4        # i++ for x
  sub x12,x0,x12      # If x12 < 0 : x12 = -x12

posX:
  
  slt x5,x13,x0        # ---
  beq x5,x0,posY       # If x13 >= 0 : jump to posY
  addi x3,x3,4         # i++ for y
  sub x13,x0,x13       # If x13 < x0 : x13 = -x13

posY:
  sub x12,x12,x13      # x12 = x12 - x13 
  add x20,x20,x12      # Acc += x12
  j rep

fin: 
  sw x20,0(x4)         #  Acumulador (Valor final 55) 
  sw x30,4(x4)         #  Contador   (Valor final 10) 