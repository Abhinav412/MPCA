@Write a program to add an array of ten 8-bit numbers taking data from memory location stored as byte data
a: .byte 9,19,29,39,49,59,69,79,89,99 @10
res: .word 0  

.text
LDR R0,=a
LDR R1,=res

MOV R5,#10
MOV R4,#0 

loop:
LDRH R3,[R0],#2
ADD R4,R4,R3
SUBS R5, R5, #1
BEQ EXIT

B loop

EXIT: 
STR R4, [R1] 
SWI 0X11

.END