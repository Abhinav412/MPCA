@Write a program to find the largest number from a given set of nmubers. (unsorted array)
a: .word 96,35,83,88,82,55,74,25,51,40
largest: .word 0

.text
LDR R0,=a
LDR R4,=largest
LDR R1,[R0]
MOV R3,#12

loop:
LDR R2,[R0],#4
CMP R2,R1
BGT swap
B next

swap: 
MOV R1,R2

next:
SUB R3,R3,#1
CMP R3,#0
BNE loop
BEQ EXIT

EXIT: 
STR R1,[R4]
SWI 0x11
.end