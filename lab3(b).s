@Write a program to check if a give set of numbers are even or odd. Store even and odd numbers in two different memory locations
a: .word 4,3,11,16,19,20,12,7,9,1
odd: .word 0,0,0,0,0,0,0,0,0,0
even: .word 0,0,0,0,0,0,0,0,0,0
.text
LDR R0,=a
LDR R1,=odd
LDR R2,=even
MOV R3,#10
loop:
LDR R4,[R0]
AND R5,R4,#1
CMP R5,#1
BEQ oddnumber
STR R4,[R2]
ADD R2,R2,#4
SUB R3,R3,#1
CMP R3,#0
BEQ Exit
ADD R0,R0,#4
BNE loop
oddnumber:
STR R4,[R1]
ADD R1,R1,#4
ADD R2,R2,#4
SUB R3,R3,#1
CMP R3,#0
BEQ Exit
ADD R0,R0,#4
BNE loop

Exit:
SWI 0X11
.end