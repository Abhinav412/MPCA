@Write a program to compute the factorial of a number using subroutine.
.text
start:
MOV R0,#10
BL factorial
B start
factorial:
MOV R1,#1
factorial_loop:
MUL R3,R1,R0
SUBS R0,R0,#1
BNE factorial_loop
MOV R2,R3
BX LR
.end