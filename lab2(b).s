.text
MOV R0,#9
ANDS R1,R0,#1
CMP R1, #0
BEQ LOC1
MOV R2, #1
B LOC2
LOC1: MOV R2,#00
LOC2: SWI 0X11
.end