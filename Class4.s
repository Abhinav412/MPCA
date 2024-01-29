/*.data
a: .word 100,200,300,400,500,600,700,800
b: .word 0,0,0,0,0,0,0,0
.text
LDR R0,=a
LDR R7,=b
LDMIA R0!,{R1,R8,R9,R11}
STMIA R7!,{R8,R9,R11,R1}
.end*/

/*.data
a: .word 100,200,300,400,500,600,700,800,900,1000
b: .word 0,0,0,0,0,0,0,0,0,0
.text
LDR R0,=a
ADD R0,R0,#36
LDR R11,=b
LDMIA R0!,{R1-R10}
STMDA R11!,{R1-R10}
.end*/

.data
a: .word 100,200,300,400,500,600,700,800,900,1000
b: .word 0,0,0,0,0,0,0,0,0,0
.text
LDR R0,=a
ADD R0,R0,#40
LDR R11,=b
ADD R11,R11,#-4
LDMDB R0!,{R1-R10}
STMDB R11!,{R1-R10}
.end