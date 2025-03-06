.eqv       sum     x5 
.eqv       dirx    x6 
.eqv       dfin    x7 
.eqv       Kmul    x28 
.eqv       Kdiv    x29 
.eqv       res     x30 
.eqv       op      x31 
.eqv       cond    x10 
.config 

pipelined off 
forwarding off 
exm 5 pipelined 
exd 5 pipelined 

.data 0x00020000 

x:          .byte 25,30,40,45 
y:          .space 4 
resultado:  .space 1 
 
.text 

addi Kdiv,x0,14       # Divisor 
ori  Kmul,x0,2         # Multiplicador 
addi dirx,x0,0x200    
slli dirx,dirx,8       # Puntero al vector x (0x00020000) 
addi dfin,dirx,4       # Puntero al vector 4 (0x00020004) 
addi sum,x0,0         # Sumatorio 

sigue: 

lb   op,0(dirx)        # Leer el valor de x 
mul  op,op,Kmul   # Multiplicar x[i]*Multiplicador 
sb   op,4(dirx)        # Guarda el resultado en y[i] 
add  sum,sum,op    # Actualizar el sumatorio 
addi Kmul,Kmul,1  # Incrementa el multiplicador  
addi dirx,dirx,1       # Siguiente posición del vector 
slt  cond,dirx,dfin   # x10=1 si dirx<dirfin 
beq  cond,x0,end 
jal  x1, sigue 

end: 

div  res,sum,Kdiv  # Dividir el sumatorio entre el divisor 
sb   res,4(dirx)       # Guardar el resultado 

# No. Mul. Instr. : 1
# No. Div. Instr. : 1
# No. ALU Instr. : 10
# No. Load Instr. : 1
# No. Store Instr. : 2
# No. Branch Instr. : 2
# Total Instr. : 17




