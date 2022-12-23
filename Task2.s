.global _start
 .equ Pixelbuff_base,0xC8000000
 .equ Charbuff_base,0xC9000000
 .equ PS2_Data,0xff200100
 .equ PS2_Control,0xff200104
_start:
        bl      input_loop
end:
        b       end

@ TODO: copy VGA driver here.
VGA_draw_point_ASM:
PUSH {R0-R4}
LDR R3,=Pixelbuff_base
LSL R0,R0,#1
LSL R1,R1,#10
ADD R4,R0,R1
ADD R3,R3,R4
STRH R2,[R3]
POP {R0-R4}
BX LR
VGA_clear_pixelbuff_ASM:
PUSH {LR}
PUSH {R0-R4}
MOV R0,#0
MOV R1,#0
MOV R2,#0
MOV R3,#240
MOV R4,#320

VGA_clear_pixelbuff_ASM_LOOP0:
BL VGA_draw_point_ASM
ADD R1,R1,#1
CMP R1,R3
BGE VGA_clear_pixelbuff_ASM_LOOP1
B VGA_clear_pixelbuff_ASM_LOOP0

VGA_clear_pixelbuff_ASM_LOOP1:
ADD R0,R0,#1
MOV R1,#0
CMP R0,R4
BLE VGA_clear_pixelbuff_ASM_LOOP0
POP {R0-R4}
POP {LR}
BX LR

VGA_write_char_ASM:
PUSH {R0-R6}
LDR R3,=Charbuff_base
MOV R5,#79
MOV R6,#59
CMP R0,#0
BLT VGA_write_char_ASM_return
CMP R1,#0
BLT VGA_write_char_ASM_return
CMP R0,R5
BGT VGA_write_char_ASM_return
CMP R1,R6
BGT VGA_write_char_ASM_return
LSL R1,R1,#7
ADD R4,R0,R1
ADD R3,R3,R4
STRB R2,[R3]
VGA_write_char_ASM_return:
POP {R0-R6}
BX LR


//clears (sets to 0) all the valid memory locations in the character buffer.
//It takes no arguments and returns nothing. 
//Hint: You can implement this function 
//by calling VGA_write_char_ASM with a character value of zero 
//for every valid location on the screen.
VGA_clear_charbuff_ASM:
PUSH {LR}
PUSH {R0-R4}
MOV R0,#0
MOV R1,#0
MOV R2,#0
MOV R3,#60
MOV R4,#80
VGA_clear_charbuff_ASM_LOOP0:
BL VGA_write_char_ASM
ADD R1,R1,#1
CMP R1,R3
BGE VGA_clear_charbuff_ASM_LOOP1
B VGA_clear_charbuff_ASM_LOOP0

VGA_clear_charbuff_ASM_LOOP1:
ADD R0,R0,#1
MOV R1,#0
CMP R0,R4
BLE VGA_clear_charbuff_ASM_LOOP0
POP {R0-R4}
POP {LR}
BX LR

@ TODO: insert PS/2 driver here.


read_PS2_data_ASM:
PUSH {LR}
PUSH {R1-R6}
LDR R1,=PS2_Data
LDR R1,[R1]

AND R2,R1,#0x8000
CMP R2,#0x8000
BEQ read_PS2_data_ASM_return 
MOV R0,#0
POP {R1-R6}
POP {LR}
BX LR
read_PS2_data_ASM_return:

AND R2,R1,#0xff
STRB R2,[R0]
MOV R0,#1
POP {R1-R6}
POP {LR}
BX LR


write_hex_digit:
        push    {r4, lr}
        cmp     r2, #9
        addhi   r2, r2, #55
        addls   r2, r2, #48
        and     r2, r2, #255
        bl      VGA_write_char_ASM
        pop     {r4, pc}
write_byte:
        push    {r4, r5, r6, lr}
        mov     r5, r0
        mov     r6, r1
        mov     r4, r2
        lsr     r2, r2, #4
        bl      write_hex_digit
        and     r2, r4, #15
        mov     r1, r6
        add     r0, r5, #1
        bl      write_hex_digit
        pop     {r4, r5, r6, pc}
input_loop:
        push    {r4, r5, lr}
        sub     sp, sp, #12
        bl      VGA_clear_pixelbuff_ASM
        bl      VGA_clear_charbuff_ASM
        mov     r4, #0
        mov     r5, r4
        b       .input_loop_L9
.input_loop_L13:
        ldrb    r2, [sp, #7]
        mov     r1, r4
        mov     r0, r5
        bl      write_byte
        add     r5, r5, #3
        cmp     r5, #79
        addgt   r4, r4, #1
        movgt   r5, #0
.input_loop_L8:
        cmp     r4, #59
        bgt     .input_loop_L12
.input_loop_L9:
        add     r0, sp, #7
        bl      read_PS2_data_ASM
        cmp     r0, #0
        beq     .input_loop_L8
        b       .input_loop_L13
.input_loop_L12:
        add     sp, sp, #12
        pop     {r4, r5, pc}