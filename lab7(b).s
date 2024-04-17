.equ A, 0x80
.equ B, 0x40
.equ C, 0x20
.equ D, 0x08
.equ E, 0x04
.equ F, 0x02
.equ G, 0x01
.equ P, 0x10
.section .data
tab:
.word A|B|C|D|E|G
.word B|C
.word A|B|F|E|D
.word A|B|F|C|D
.word G|F|C
.word A|G|F|C|D
.word A|G|E|D|C|F
.word A|B|C
.word A|B|C|D|E|F|G
.word A|B|G|F|C
.word A|G|E|C|B|F
.word A|B|C|D|E|F|G|P
.word A|G|E|D
.word A|B|C|D|E|G|P
.word A|G|F|E|D
.word A|G|F|E
.section .text
.global _start
_start:
ldr r2, =16
ldr r5, =tab
upcount:
ldr r0, [r5], #4
swi 0x200
bl delay
subs r2, r2, #1
bne upcount
exit:
swi 0x11
delay:
mov r6, #500
1: subs r6, r6, #1
bne 1b
bx lr