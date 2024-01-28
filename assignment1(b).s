@Generate Fibonacci Series and store them in an array/memory location
.data
@ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
fibonacci: .WORD 40
.text
MOV R1,#0
MOV R2,#1
MOV R4,#10
LDR R0,=fibonacci
series:
STR R1,[R0]
ADD R0,R0,#4
ADD R3,R1,R2
MOV R1,R2
MOV R2,R3
SUB R4,R4,#1
CMP R4,#0
BNE series
SWI 0X11
.end