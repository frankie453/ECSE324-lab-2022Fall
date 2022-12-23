.global _start
 .equ Pixelbuff_base,0xC8000000
 .equ Charbuff_base,0xC9000000



_start:
        bl      draw_test_screen
end:    
        
         B end
@ TODO: Insert VGA driver functions here.


//draws a point on the screen with the color as indicated in the third argument, 
//by accessing only the pixel buffer memory.
//Hint: This subroutine should only access the pixel buffer memory
// void VGA_draw_point_ASM(int x, int y, short c);
@R0 int x
@R1 int y
@R2 char c
@R3 Pixelbuff_base
@R4
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

//clears (sets to 0) all the valid memory locations in the pixel buffer. 
//It takes no arguments and returns nothing. 
//Hint: You can implement this function 
//by calling VGA_draw_point_ASM with a color value of zero 
//for every valid location on the screen.
//void VGA_clear_pixelbuff_ASM();
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

//rites the ASCII code passed in the third argument (r2) 
//to the screen at the (x, y) coordinates 
//given in the first two arguments (r0 and r1). 
//Essentially, the subroutine will store the value of 
//the third argument at the address calculated 
//with the first two arguments. 
//The subroutine should check 
//that the coordinates supplied are valid, 
//i.e., x in [0, 79] and y in [0, 59]. 
//Hint: This subroutine should only access the character buffer memory.
//void VGA_write_char_ASM(int x, int y, char c);

@R0 int x
@R1 int y
@R2 char c
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







draw_test_screen:
        push    {r4, r5, r6, r7, r8, r9, r10, lr}
        bl      VGA_clear_pixelbuff_ASM
        bl      VGA_clear_charbuff_ASM
	
		
        mov     r6, #0
        ldr     r10, .draw_test_screen_L8
        ldr     r9, .draw_test_screen_L8+4
        ldr     r8, .draw_test_screen_L8+8
        b       .draw_test_screen_L2
.draw_test_screen_L7:
        add     r6, r6, #1
        cmp     r6, #320
        beq     .draw_test_screen_L4
.draw_test_screen_L2:
        smull   r3, r7, r10, r6
        asr     r3, r6, #31
        rsb     r7, r3, r7, asr #2
        lsl     r7, r7, #5
        lsl     r5, r6, #5
        mov     r4, #0
.draw_test_screen_L3:
        smull   r3, r2, r9, r5
        add     r3, r2, r5
        asr     r2, r5, #31
        rsb     r2, r2, r3, asr #9
        orr     r2, r7, r2, lsl #11
        lsl     r3, r4, #5
        smull   r0, r1, r8, r3
        add     r1, r1, r3
        asr     r3, r3, #31
        rsb     r3, r3, r1, asr #7
        orr     r2, r2, r3
        mov     r1, r4
        mov     r0, r6
        bl      VGA_draw_point_ASM
        add     r4, r4, #1
        add     r5, r5, #32
        cmp     r4, #240
        bne     .draw_test_screen_L3
        b       .draw_test_screen_L7
.draw_test_screen_L4:
        mov     r2, #72
        mov     r1, #5
        mov     r0, #20
        bl      VGA_write_char_ASM
        mov     r2, #101
        mov     r1, #5
        mov     r0, #21
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #22
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #23
        bl      VGA_write_char_ASM
        mov     r2, #111
        mov     r1, #5
        mov     r0, #24
        bl      VGA_write_char_ASM
        mov     r2, #32
        mov     r1, #5
        mov     r0, #25
        bl      VGA_write_char_ASM
        mov     r2, #87
        mov     r1, #5
        mov     r0, #26
        bl      VGA_write_char_ASM
        mov     r2, #111
        mov     r1, #5
        mov     r0, #27
        bl      VGA_write_char_ASM
        mov     r2, #114
        mov     r1, #5
        mov     r0, #28
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #29
        bl      VGA_write_char_ASM
        mov     r2, #100
        mov     r1, #5
        mov     r0, #30
        bl      VGA_write_char_ASM
        mov     r2, #33
        mov     r1, #5
        mov     r0, #31
        bl      VGA_write_char_ASM
        pop     {r4, r5, r6, r7, r8, r9, r10, pc}
.draw_test_screen_L8:
        .word   1717986919
        .word   -368140053
        .word   -2004318071
	