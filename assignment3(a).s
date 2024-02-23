@Write an ALP to find wether a given character is present in a string or not.
.data
str: .asciz "Abhinav Sankarshana Dasu"
key: .asciz "z"

.text
LDR R0,=str
LDR R1,=key
LDRB R4,[R1]
MOV R3,#0
Loop:
LDRB R2,[R0],#1
CMP R2,#0
BEQ end
CMP R2,R4
ADDEQ R3,R3,#1
B Loop
end:
SWI 0X11
.end