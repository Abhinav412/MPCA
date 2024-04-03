@Write a program to search for an element in an array using linear search technique.
array: .word 10,20,30,40,50

.text
start:
LDR R0 ,=array
MOV R1,#5
MOV R2,#3
BL linear_search
B start
linear_search:
MOV R3,#0
search_loop:
LDR R4,[R0,R3,LSL #2]
CMP R4,R2
BEQ found
ADD R3,R3,#1
CMP R3,R1
BLT search_loop
MOV R0,#-1
BX LR
found:
MOV R0,R3
BX LR
.end