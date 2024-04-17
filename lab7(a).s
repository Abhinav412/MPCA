@ Wirte the program to display:
@   Stream of characters on LCD display left to right
@   4 digital numerical values  on LCD display right to left

MOV R0, #20 @R0 = X
MOV R1, #7 @R1 = Y
MOV R7, #0
LDR R8, =NUM 
LDR R8,[R8]
LDR R2, =STR 
LOOP:
SWI 0X204 @display A STRING ON ADDRESS SHOULD BE IN R2 REG
BL SUM

CMP R0, #0
SUBNE R0, R0, #1
SWIEQ 0X11
B LOOP
SUM:
CMP R7, R8
ADDNE R7, R7 , #1
BNE SUM
SWI 0X206 @CLEAR ONE LINE IN THE DISPLAY ON THE LCD SCREEN R0-LINE NO(Y)
MOV R7, #0
MOV PC, LR
.DATA
STR: .ASCIZ "ABHINAV"
NUM: .WORD 50000