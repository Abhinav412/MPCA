@Write an ALP to copy a string from one location to another.
.data
srcstr:.asciz "PES UNIVERSITY"
dstr:.asciz "aaaaaaaaaaaaa"
.text
LDR R0,=srcstr
LDR R1,=dstr
Loop:
    LDRB R2,[R0],#1
    CMP R2,#0
    BEQ done
    STRB R2,[R1],#1
    B Loop
done:
    LDR R7,=dstr
    SWI 0x02
.end