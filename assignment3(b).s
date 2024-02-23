@Write an ALP to generate a diagonal matrix.
.data
A: .word 3
Matrix: .word 0

.text
LDR R0,=A 
LDR R1,[R0]
LDR R2,=Matrix
MOV R3,#1
MOV R5,#0
MOV R6,#1
out_loop:
STR R3,[R2],#4
MOV R4,#0
CMP R6,R1
ADD R6,R6,#1
BEQ exit
B in_loop
in_loop:
STR R5,[R2],#4
ADD R4,R4,#1
CMP R1,R4
BEQ out_loop
B in_loop
exit:
SWI 0X11
.end