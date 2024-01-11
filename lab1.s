/*.text
MOV R0, #100
.end
.text
MOV R0,#10
MOV R1, #20
ADD R2, R0, R1
.end
.text
MOV R0,#10
MOV R1, #20
SUB R2, R0, R1
.end
.text
MOV R0,#5
MOV R1, #6
AND R2,R0,R1
ORR R3,R0,R1
EOR R4,R0,R1
MVN R5,R1
.end*/
.text
MOV R0,#5
MOV R1,#5
CMP R0,R1 ; R0-R1
CMN R0,R1; R0+R1
.end