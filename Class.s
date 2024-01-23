/*/.DATA
    A: .WORD 10,20,30,40,50,60,70,80,90,100
    SUM: .WORD 0
.text
LDR R1,=A
LDR R2,=SUM
MOV R4,#0
MOV R5,#1
L1: LDR R3,[R1],#4
ADD R4,R4,R3
ADD R1,R1,#4
ADD R5,R5,#1
CMP R5,#11
BNE L1
STR R4,[R2]
SWI 0X11
.end*/

@1.Program to find largest number in an array
/*.DATA
    A: .WORD 10,20,30,40,50
.text
    LDR R1,=A
    LDR R0,[R1]

    MOV R3,#0
LOOP: LDR R2,[R1,#4]!
    CMP R0,R2
    BLT Less
    L1: ADD R3,R3,#1
    CMP R3,#4
    BNE LOOP
    B EXIT
Less: MOV R0,R2
B L1
EXIT: SWI 0X11
.end*/
@2.Program to convert C code to assembly code
.text
    LDR R1,=K
    LDR R0,[R1]
    LDR R2,=SAVE
    MOV R3,#0
LOOP: ADD R5,R2,R3,LSL #2
LDR R6,[R5,#0]
CMP R0,R6
BNE EXIT
ADD R3,R3,#1
CMP R3,#5
BNE LOOP
EXIT: SWI 0X11
.DATA
    K: .WORD 5
    I: .WORD 0
SAVE: .WORD 5,5,5,50,5,40
.end