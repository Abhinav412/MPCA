/*.text
MOV R0,#4
MOV R1,#5
STMEA R13!,{R0,R1}
LDMEA R13!,{R5,R6}
.end*/
/*.text
MOVS R1,#-10
MRS R0,CPSR
AND R0,R0,#0000
MSR CPSR_F, R0
.end*/
.text
LDR R2,=a 
MOV R1,#5
SWP R1,R1,[R2]
.data
a: .word 10
.end