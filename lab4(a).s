@Write an ALP to check whether the given number has odd or even number of 1's(even and odd parity).
.text
MOV R0,#0X000000F3
MOV R1,#32
MOV R2,#0
MOV R3,#0
MOV R4,R0
loc1: 
ANDS R0,R0,#1
CMP R0,#0
BEQ EVEN
ADD R2,R2,#1
SUB R1,R1,#1
CMP R1,#0
BNE loc1
B exit
EVEN:
ADD R3,R3,#1
SUB R1,R1,#1
CMP R1,#0
BNE loc1
exit: SWI 0X11
.end