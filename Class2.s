@1.Program to convert a given hexadecimal number to ASCII code
/*/.text
LDR R3,=X
MOV R1, #0x54
AND R0, R1, #0xF0
MOV R0,R0,LSR #4
ORR R0,R0,#0x30
STRB R0,[R3]
AND R2,R1,#0x0F
ORR R2,R2,#0x30
ADD R3,R3,#4
STR R2,[R3]
.data
X: .WORD 0,0
.end*/

@2.Consider a C code snippet and write the compiled ARM assembly code
.text
LDR R4,=F
MOV R0,#5
MOV R1,#10
MOV R2,#1
MOV R3,#4

BL example
STR R0,[R4]
SWI 0X11

example:
SUB R13,R13,#12
STR R6,[R13,#8]
STR R5,[R13,#4]
STR R4,[R13,#0]
ADD R5,R0,R1
ADD R6,R2,R3
SUB R4,R5,R6
MOV R0,R4
LDR R4,[R13,#0]
LDR R5,[R13,#4]
LDR R6,[R13,#8]
ADD R13,R13,#12
MOV PC,LR
.data
F: .WORD 0
.end