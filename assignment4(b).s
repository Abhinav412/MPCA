@Given a c code convert it in its equivalent ARM code.
/* .data
a: .word 12
b: .word 13
c: .word 12
x: .word 0

.text
LDR R1, =a
LDR R2, =b
LDR R3, =c
LDR R4, =x
ADD R1, R1, R2 
SUB R4, R1, R3
SWI 0x11
.end*/
.data
a: .word 12
b: .word 13
z: .word 0

.text
LDR R0, =a
LDR R1, =b
lsl R0, R0, #2
AND R1, R1, #15
ORR R2, R0, R1
SWI 0x11
.end