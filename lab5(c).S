@Write an ALP to find the length of a given string.
.data
s: .asciz "Abhinav Sankarshana Dasu"
.text
LDR R0,=s
MOV R1,#0
Loop:
    LDRB R2,[R0],#1
    CMP R2,#0
    BNE cont
    BEQ exit
cont:
    ADDS R1,R1,#1
    B Loop
exit:
    SWI 0x11
.end