@Write an ALP to perform convolution using MUL instruction.
.data
a:.word 10,20,30,40,50
b:.word 10,20,30,40,50

.text
LDR R0,=a
LDR R1,=b
MOV R2,#5
MOV R3,#0 
Loop:
    LDR R5,[R0],#4
    LDR R6,[R1],#4
    MUL R7,R5,R6
    ADD R3,R3,R7
    SUB R2,R2,#1
    CMP R2,#0
    BNE Loop
    SWI 0x11
.end