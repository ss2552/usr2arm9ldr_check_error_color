.section .text.start
.align 4
.arm

.global _start
_start:
    b start
    b _error
start:
    sub sp, pc, #8
    bl main

    mov r0, #0x20000000
    _firmlaunch_loop:
        ldr r1, [r0, #-8]
        cmp r1, #0
        beq _firmlaunch_loop
    bx r1
_error:
    sub sp, pc, #8
    b error

; 0x1FFFF400 | (0x30 = 12 x 0x4)
; 0x1FFFF430

.global result
result:
    .word 0x00000000
