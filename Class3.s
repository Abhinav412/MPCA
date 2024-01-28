/*.data
A: .word 1,3,5
B: .word 2,4,6
C: .word
.text
LDR R5,=A
LDR R6,=B
LDR R7,=C
MOV R3,#3
MOV R4,#0
Loop:
LDR R1,[R5],#4
LDR R2,[R6],#4
MLA R4,R1,R2,R4
STR R4,[R7],#4
SUB R3,R3,#1
TEQ R3,#0
BNE Loop
SWI 0X11
.end*/
.data
A: .word 100,200,300,400,500,600,700,800,900
B: .word 0,0,0,0,0,0,0,0
.text
LDR R0,=A 
LDR R7,=B 
LDMIA R0!,{R1,R8,R9,R11}
.end