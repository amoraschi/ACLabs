.config 
    pipelined on 
    forwarding on
    delayed off 
    exm 2 pipelined 
    exd 3 pipelined 
 
.data 
    x:  .half 1,2,3,4,5,6,7,8,9,10 
    y:  .half 1,2,3,4,5,6,7,8,9,10 
    z:  .space 20 
    a:  .half 5 

.text 
    la x10, x 
    la x20, y 
    la x30, z 
    la x31,a 
    lh x5,0(x31)    # a  
for: 
    lh x11, 0(x10) # Load hw of x into x11
    addi x10, x10, 2 # Increase pointer of x for next hw
    mul x11,x11,x5 # Multiply hw of x11 by 5
    lh x21, 0(x20) # Load hw of y into x21
    div x21,x21,x5 # Divide hw of x21 by 5
    addi x20, x20, 2 # Increase pointer of y for next hw
    add x2,x11,x21 # Add x11 and x21 into x2
    addi x30, x30, 2 # Increase pointer of z
    sh x2,-2(x30)     # Store x2 into address of z
    bne x30, x31, for # If not at end of list, loop
