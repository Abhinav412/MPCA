.text
MOV R0, #12
MOV R1, #1
factorial_loop:
MUL R1,R0,R1
SUB R0,R0,#1
CMP R0,#1
BNE factorial_loop
SWI 0X11
.end