@Write a program to classify given set of numbers as positive,negative or zero and also store them in different memory locations
a: .word 10,5,6,-1,-2,-3,-4,0,23,0
pos: .word 0,0,0,0,0,0,0,0,0,0
neg: .word 0,0,0,0,0,0,0,0,0,0
zero: .word 0,0,0,0,0,0,0,0,0,0
.text
LDR R0,=a
LDR R1,=pos
LDR R2,=neg
LDR R3,=zero
loop:
LDR R4,[R0]
CMP R4,#0
BLT Negnum
BGT Posnum
BEQ Zeronum

Posnum:
STR R4,[R1]
ADD R1,R1,#4
SUB R3,R3,#1
ADD R0,R0,#4
CMP R3,#0
BNE loop
B EXIT

Negnum:
STR R4,[R2]
ADD R2,R2,#4
SUB R3,R3,#1
ADD R0,R0,#4
CMP R3,#0
BNE loop
B EXIT

Zeronum:
STR R4,[R5]
ADD R5,R5,#4
SUB R3,R3,#1
ADD R0,R0,#4
CMP R3,#0
BNE loop
B EXIT

EXIT: SWI 0X11
.end