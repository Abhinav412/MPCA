/* .word 0

.text
LDR R4,=a
MOV R1,#25
MOV R2,#25
STMFD R13!,{R1,R2}
BL link
STR R0,[R4]
SWI 0X11
link:
LDMFD R13!,{R4,R5}
ADD R0,R4,R5
MOV PC,LR 
.end*/

/*a: .word 0
.text
LDR R4,=a
MOV R1,#11
MOV R2,#10
MOV R3,#02
STMFD R13!,{R1,R2,R3}
BL ADDFun
STR R0,[R4]
SWI 0X11
ADDFun:
LDMFD R13!,{R4,R5,R6}
ADD R0,R4,R5
STMFD R13!,{R0,R6,LR}
BL MULFun
MOV PC,LR
MULFun:
LDMFD R13!,{R4,R5,LR}
MUL R0,R4,R5
MOV PC,LR
.end*/

a: .asciz "Hello World"
.text
LDR R1,=a
loop:
LDRB R0,[R1],#1
CMP R0,#0
SWINE 0X00
BNE loop
SWI 0X11
