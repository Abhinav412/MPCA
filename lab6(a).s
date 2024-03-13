@Write an ALP to multiply two matrices (3X3)
.data 
a: .word 1,2,3,3,4,5,5,6,7
b:.word 1,1,1,2,2,2,3,3,3
c:.word 0,0,0,0,0,0,0,0,0

.text
LDR R1,=a
LDR R2,=b
LDR R3,=c
MOV R4,#3
MOV R9,#3
oloop:
MOV R10, R1
MOV R11, R2
iloop:
MOV R8, #0
mov R6, #0
mov R5, #0
loopmul:
LDR R12, [R10, R6, LSL#2]
LDR R13, [R11, R5, LSL#2]
MUL R14, R12, R13
ADD R8, R8, R14
ADD R6, R6, #1
ADD R5,R5,#1
CMP R6,R9
BLT loopmul   
CMP R4,#0
ADD R4,R4,#-1
BNE oloop
SWI 0X11
.end