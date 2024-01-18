.text
MOV R0, #40
MOV R1, #40
CMP R0, R1
BEQ add
SUB R2, R0, R1
B end
add: ADD R2, R0, R1
end: SWI 0X11
.end