@Write a program to swap the first and last character of a given string.
.data
a: .asciz "Abhinav\n"
.text
LDR R0,=a
SWI 0X02
MOV R1,#7
SUB R1,R1,#1
LDRB R2,[R0,#0]
LDRB R3,[R0,R1]
STRB R3,[R0,#0]
STRB R2,[R0,R1]
SWI 0X02
SWI 0X11
.end