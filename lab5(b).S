@Write an ALP to implement Sum[i]+=a[i].
.data
a:.word 1,2,3,4,5,6,7,8,9

.text
LDR R0,=a
MOV R1,#0 
MOV R2,#3
MOV R3,#3
MOV R4,#0
MOV R5,#0
MOV R8,#4
Loop:
    STMIA R13!,{R4,R5}
    BL addr
    LDMDB R13!,{R4,R5,R6}
    ADD R6,R6,R0
    LDR R9,[R6]
    ADD R1,R9,R1
    ADD R5,R5,#1
    CMP R5,R3
    BNE Loop
    MOV R5,#0
    ADD R4,R4,#1
    CMP R4,R2
    BNE Loop
    BEQ exit
addr:
    LDMDB R13!,{R4,R5}
    MLA R7,R3,R4,R5
    MUL R6,R7,R8
    STMIA R13!,{R4,R5,R6}
    BX LR 
exit:
    SWI 0x11
.end