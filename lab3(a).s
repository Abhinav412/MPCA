@Write a program to add two numbers by reading them from memory and store the result back to the memory.
a: .word 50,60
res: .word 0
.text
LDR R1,=a
LDR R2,=res
LDR R3,[R1]
ADD R1,R1,#4
LDR R4,[R1]
ADD R5,R3,R4
STR R5,[R2]
SWI 0x11
.end