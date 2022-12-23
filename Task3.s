.global _start
input_mazes:// First Obstacle Course
             .word 2,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,1,1
            .word 0,1,0,1,1,1,0,0,0,1,1,1
            .word 0,0,0,1,1,1,0,0,0,1,1,1
            .word 1,1,1,1,1,1,0,0,1,0,0,0
            .word 1,1,1,1,1,1,0,1,0,0,0,0
            .word 1,1,1,1,1,1,0,0,0,0,0,3
            // Second Obstacle Course
            .word 2,1,0,1,1,1,0,0,0,0,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,0,0,1,1,1,0,0,0,1,0,1
            .word 1,1,1,1,1,1,0,0,1,0,0,0
            .word 1,1,1,1,1,1,0,1,0,0,0,0
            .word 1,1,1,1,1,1,1,0,0,0,0,3
            // Third Obstacle Course
            .word 2,0,0,0,0,1,0,0,0,1,0,1
            .word 0,1,1,1,0,1,1,1,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,1,1,0,1,1,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 1,1,0,1,1,1,1,1,1,1,1,1
            .word 0,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,0,1,1,1,1,1,0,1
            .word 0,0,0,0,0,0,0,1,0,0,0,3
            // Fourth Obstacle Course
            .word 2,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,0,1,1,1,0,1,1,1,0,1
            .word 0,1,0,0,0,1,0,1,0,1,0,1
            .word 0,1,0,1,0,1,1,1,0,1,0,1
            .word 0,0,0,1,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,1,1,1,1,0,1
            .word 0,1,0,1,0,0,0,1,0,0,0,1
            .word 0,1,0,1,1,1,0,1,0,1,1,1
            .word 0,1,0,1,0,0,0,0,0,0,0,3
            // Fifth Obstacle Course
            .word 2,0,0,0,0,1,0,1,0,1,0,1
            .word 1,1,0,1,1,1,0,1,0,1,0,1
            .word 0,0,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,0,1,1,1,1,1,0,1
            .word 0,0,0,1,0,1,0,1,0,0,0,1
            .word 1,1,0,1,1,1,0,1,1,1,0,1
            .word 0,0,0,1,0,1,0,0,0,0,0,1
            .word 0,1,0,1,0,1,0,1,0,1,1,1
            .word 0,1,0,0,0,1,0,1,0,0,0,3
            // Sixth Obstacle Course
            .word 2,0,0,0,0,0,0,1,0,0,0,1
            .word 1,1,0,1,0,1,0,1,0,1,0,1
            .word 0,0,0,1,0,1,0,0,0,1,0,1
            .word 1,1,1,1,0,1,1,1,1,1,1,1
            .word 0,0,0,1,0,0,0,1,0,0,0,1
            .word 0,1,1,1,0,1,1,1,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,1,1,1,1,0,1
            .word 0,0,0,0,0,0,0,0,0,1,0,3
            // Seventh Obstacle Course
            .word 2,0,0,0,0,0,0,0,1,0,1,0
            .word 1,1,1,0,1,1,1,1,1,0,1,0
            .word 1,0,0,0,0,0,1,0,0,0,0,0
            .word 1,1,1,1,1,0,1,1,1,0,1,1
            .word 1,0,0,0,1,0,0,0,0,0,0,0
            .word 1,0,1,0,1,0,1,0,1,0,1,0
            .word 1,0,1,0,0,0,1,0,1,0,1,0
            .word 1,1,1,1,1,1,1,1,1,0,1,0
            .word 1,0,0,0,0,0,0,0,0,0,1,3
            // Eighth Obstacle Course
            .word 2,0,0,0,0,0,0,0,0,0,0,0
            .word 1,0,1,1,1,1,1,0,1,1,1,0
            .word 1,0,0,0,1,0,0,0,1,0,0,0
            .word 1,1,1,1,1,0,1,1,1,1,1,1
            .word 1,0,0,0,1,0,1,0,0,0,0,0
            .word 1,0,1,1,1,0,1,1,1,0,1,0
            .word 1,0,0,0,0,0,0,0,1,0,1,0
            .word 1,1,1,0,1,0,1,1,1,1,1,0
            .word 1,0,0,0,1,0,0,0,0,0,0,3
            // Nineth Obstacle Course
            .word 2,0,0,0,0,0,1,0,1,0,1,0
            .word 1,0,1,1,1,1,1,0,1,0,1,0
            .word 1,0,0,0,1,0,0,0,0,0,0,0
            .word 1,0,1,0,1,1,1,0,1,1,1,1
            .word 1,0,1,0,1,0,1,0,0,0,1,0
            .word 1,0,1,1,1,0,1,0,1,1,1,0
            .word 1,0,0,0,1,0,0,0,0,0,1,0
            .word 1,0,1,1,1,0,1,1,1,0,1,0
            .word 1,0,0,0,0,0,1,0,0,0,0,3	
ampersand_x: .word 11,12,13,14,15,11,15,11,15,11,12,13,14,15,10,11,13,10,14,16,10,15,10,14,16,10,11,12,13,14,17
ampersand_y: .word  8, 8, 8, 8, 8,9 ,9 ,10,10,11,11,11,11,11,12,12,12,13,13,13,14,14,15,15,15,16,16,16,16,16,16
exit_x: .word 10,11,12,13,14,15,10,10,10,10,11,12,13,14,15,10,10,10,10,11,12,13,14,15
exit_y: .word  8, 8, 8, 8, 8, 8, 9, 10, 11, 12,12,12,12,12,12,13,14,15,16,16,16,16,16,16
position: .word 0,0
win: .word 89,111,117,32,87,105,110,33
index:.word 0
 .equ Pixelbuff_base,0xC8000000
 .equ Charbuff_base,0xC9000000
 .equ PS2_Data,0xff200100
 .equ PS2_Control,0xff200104
 .equ PS2_Data_Buffer,0xC1000000
 .equ direction,0xaaaaaae0
 .equ right    ,0xaaaaaa74
 .equ left     ,0xaaaaaa6b
 .equ up       ,0xaaaaaa75
 .equ down     ,0xaaaaaa72
.equ Timer_base,0xFFFEC600
_start:
        bl      write_hex_digit
end:
        b       end
VGA_fill_ASM:
PUSH {LR}
PUSH {R0-R4}
MOV R0,#0
MOV R1,#0
LDR R2,=#0xfffff
MOV R3,#240
MOV R4,#320
VGA_fill_ASM_LOOP0:
BL VGA_draw_point_ASM
ADD R1,R1,#1
CMP R1,R3
BGE VGA_fill_ASM_LOOP1
B VGA_fill_ASM_LOOP0

VGA_fill_ASM_LOOP1:
ADD R0,R0,#1
MOV R1,#0
CMP R0,R4
BLE VGA_fill_ASM_LOOP0
POP {R0-R4}
POP {LR}
BX LR
draw_grid_ASM_COLUMN_START:
PUSH {R0-R4,LR}
MOV R0,#-26
MOV R1,#0
ldr R2,=#0x00ff00
LDR R4,=#225
LDR R3,=#312
draw_grid_ASM_COLUMN:
ADD R0,R0,#26
MOV R1,#0
CMP R0,R3
BGT draw_grid_ASM_COLUMN_RETURN
draw_grid_ASM_COLUMN_LOOP:
CMP R1,R4
BGE draw_grid_ASM_COLUMN
ADD R1,R1,#1
BL VGA_draw_point_ASM
B draw_grid_ASM_COLUMN_LOOP
draw_grid_ASM_COLUMN_RETURN:
POP {R0-R4,LR}
BX LR
draw_grid_ASM_ROW_START:
PUSH {R0-R4,LR}
MOV R0,#0
MOV R1,#-25
ldr R2,=#0x00ff00
LDR R3,=#225
LDR R4,=#312
draw_grid_ASM_ROW:
MOV R0,#0
CMP R1,R3
BGT draw_grid_ASM_ROW_RETURN
ADD R1,R1,#25
draw_grid_ASM_ROW_LOOP:
CMP R0,R4
BGE draw_grid_ASM_ROW
ADD R0,R0,#1
BL VGA_draw_point_ASM
B draw_grid_ASM_ROW_LOOP
draw_grid_ASM_ROW_RETURN:
POP {R0-R4,LR}
BX LR
draw_ampersand_ASM:
PUSH {R0-R8,R10,LR}
MOV R3,#26
MOV R4,#25
MUL R3,R0,R3
MUL R4,R1,R4
MOV R10,#0 // array counter
LDR R5,=ampersand_x
LDR R6,=ampersand_y
draw_ampersand_ASM_LOOP:
CMP  R10,#31
BGE draw_ampersand_ASM_RETURN
LDR R7,[R5]
LDR R8,[R6]
ADD R5,R5,#4
ADD R6,R6,#4
ADD R0,R3,R7
ADD R1,R4,R8
ADD R10,R10,#1
MOV R2,#0
BL VGA_draw_point_ASM
B draw_ampersand_ASM_LOOP
draw_ampersand_ASM_RETURN:
POP {R0-R8,R10,LR}
BX LR
clear_ampersand_ASM:
PUSH {R0-R8,R10,LR}
MOV R3,#26
MOV R4,#25
MUL R3,R0,R3
MUL R4,R1,R4
MOV R10,#0 // array counter
LDR R5,=ampersand_x
LDR R6,=ampersand_y
clear_ampersand_ASM_LOOP:
CMP  R10,#31
BGE clear_ampersand_ASM_RETURN
LDR R7,[R5]
LDR R8,[R6]
ADD R5,R5,#4
ADD R6,R6,#4
ADD R0,R3,R7
ADD R1,R4,R8
ADD R10,R10,#1
ldr R2,=#0xFFFFF
BL VGA_draw_point_ASM
B clear_ampersand_ASM_LOOP
clear_ampersand_ASM_RETURN:
POP {R0-R8,R10,LR}
BX LR
draw_exit_ASM:
PUSH {R0-R8,R10,LR}
MOV R3,#26
MOV R4,#25
MUL R3,R0,R3
MUL R4,R1,R4
MOV R10,#0 // array counter
LDR R5,=exit_x
LDR R6,=exit_y
draw_exit_ASM_LOOP:
CMP  R10,#24
BGE draw_exit_ASM_RETURN
LDR R7,[R5]
LDR R8,[R6]
ADD R5,R5,#4
ADD R6,R6,#4
ADD R0,R3,R7
ADD R1,R4,R8
ADD R10,R10,#1
MOV R2,#0
BL VGA_draw_point_ASM
B draw_exit_ASM_LOOP
draw_exit_ASM_RETURN:
POP {R0-R8,R10,LR}
BX LR
clear_exit_ASM:
PUSH {R0-R8,R10,LR}
MOV R3,#26
MOV R4,#25
MUL R3,R0,R3
MUL R4,R1,R4
MOV R10,#0 // array counter
LDR R5,=exit_x
LDR R6,=exit_y
clear_exit_ASM_LOOP:
CMP  R10,#24
BGE clear_exit_ASM_RETURN
LDR R7,[R5]
LDR R8,[R6]
ADD R5,R5,#4
ADD R6,R6,#4
ADD R0,R3,R7
ADD R1,R4,R8
ADD R10,R10,#1
MOV R2,#0
BL VGA_draw_point_ASM
B clear_exit_ASM_LOOP
clear_exit_ASM_RETURN:
POP {R0-R8,R10,LR}
BX LR
draw_obstacles_ASM:
PUSH {R0-R6,LR}
MOV R3,#26
MOV R4,#25
MUL R5,R0,R3
MUL R6,R1,R4
ADD R3,R5,R3
ADD R4,R6,R4
MOV R0,R5
SUB R0,R0,#1
MOV R1,R6
MOV R2,#0
draw_obstacles_ASM_LOOP1:
CMP R0,R3
BGT draw_obstacles_ASM_RETURN
ADD R0,R0,#1
MOV R1,R6
draw_obstacles_ASM_LOOP2:
CMP R1,R4
BGT draw_obstacles_ASM_LOOP1
BL VGA_draw_point_ASM
ADD R1,R1,#1
B draw_obstacles_ASM_LOOP2 
draw_obstacles_ASM_RETURN:
POP {R0-R6,LR}
BX LR
@R0 grid index
fill_grid_ASM:
PUSH {R0-R8,R10,LR}
ldr r0,=index
ldr r0,[r0]
//SUB R0,R0,#1
MOV R1,#432
MUL R3,R0,R1
MOV R1,#-1
MOV R0,#0
MOV R4,#12
MOV R5,#8
MOV R7,#1
MOV R8,#2
MOV R10,#3
fill_grid_ASM_LOOP1:
CMP R1,R5
BGE fill_grid_ASM_RETURN
ADD R1,R1,#1
MOV R0,#0
fill_grid_ASM_LOOP2:
CMP R0,R4
BGE fill_grid_ASM_LOOP1
LDR R6,[R3]
CMP R6,R7
BEQ fill_grid_obstacle 
CMP R6,R8
BEQ fill_grid_ampersand 
CMP R6,R10
BEQ fill_grid_exit
ADD R3,R3,#4
ADD R0,R0,#1
B fill_grid_ASM_LOOP2
fill_grid_ASM_RETURN:
POP {R0-R8,R10,LR}
BX LR
fill_grid_obstacle:
BL draw_obstacles_ASM 
ADD R3,R3,#4
ADD R0,R0,#1
B fill_grid_ASM_LOOP2
fill_grid_ampersand:
BL draw_ampersand_ASM
ADD R3,R3,#4
ADD R0,R0,#1
B fill_grid_ASM_LOOP2
fill_grid_exit:
BL draw_exit_ASM 
ADD R3,R3,#4
ADD R0,R0,#1
B fill_grid_ASM_LOOP2
VGA_draw_point_ASM:
PUSH {R0-R4,LR}
LDR R3,=Pixelbuff_base
LSL R0,R0,#1
LSL R1,R1,#10
ADD R4,R0,R1
ADD R3,R3,R4
STRH R2,[R3]
POP {R0-R4,LR}
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
read_PS2_data_ASM:
PUSH {R1-R6,LR}
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
POP {R1-R6,LR}
BX LR
write_hex_digit:
BL VGA_fill_ASM
BL draw_grid_ASM_COLUMN_START
BL draw_grid_ASM_ROW_START
Polling_First_Digit:
LDR R0,=PS2_Data_Buffer
BL read_PS2_data_ASM
MOV R1,#0
CMP R0,R1
BEQ Polling_First_Digit
LDR R2,[R0]
ldr R3,=0xaaaaaa46
CMP R2,R3
BEQ index9
ldr R3,=0xaaaaaa3e
CMP R2,R3
BEQ index8
ldr R3,=0xaaaaaa3d
CMP R2,R3
BEQ index7
ldr R3,=0xaaaaaa36
CMP R2,R3
BEQ index6
ldr R3,=0xaaaaaa2e
CMP R2,R3
BEQ index5
ldr R3,=0xaaaaaa25
CMP R2,R3
BEQ index4
ldr R3,=0xaaaaaa26
CMP R2,R3
BEQ index3
ldr R3,=0xaaaaaa1e
CMP R2,R3
BEQ index2
ldr R3,=0xaaaaaa16
CMP R2,R3
BEQ index1
B Polling_First_Digit
index9:
ldr r3,=index
mov r1,#8
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index8:
ldr r3,=index
mov r1,#7
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index7:
ldr r3,=index
mov r1,#6
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index6:
ldr r3,=index
mov r1,#5
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index5:
ldr r3,=index
mov r1,#4
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index4:
ldr r3,=index
mov r1,#3
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index3:
ldr r3,=index
mov r1,#2
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index2:
ldr r3,=index
mov r1,#1
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
index1:
ldr r3,=index
mov r1,#0
str r1,[r3]
bl fill_grid_ASM
b Polling_Second_Digit 
Polling_Second_Digit:
LDR R0,=PS2_Data_Buffer
BL read_PS2_data_ASM
MOV R1,#0
CMP R0,R1
BEQ Polling_Second_Digit
LDR R2,[R0]
LDR R3,=direction
CMP R2,R3
BEQ Polling_Third_Digit
B Polling_Second_Digit
Polling_Third_Digit:
LDR R0,=PS2_Data_Buffer
BL read_PS2_data_ASM
MOV R1,#0
CMP R0,R1
BEQ Polling_Third_Digit
LDR R2,[R0]
BL move_ASM
move_ASM:
LDR R3,=right 
CMP R2,R3
BEQ move_right
LDR R3,=left 
CMP R2,R3
BEQ move_left
LDR R3,=up 
CMP R2,R3
BEQ move_up
LDR R3,=down 
CMP R2,R3
BEQ move_down
B Polling_Second_Digit
move_right:
LDR R4,=position
LDR R0,[R4]
ADD R4,R4,#4
LDR R1,[R4]
MOV R4,R0
MOV R5,R1
ADD R4,R4,#1
BL on_grid
MOV R4,R0
ADD R0,R0,#1
BL decide_input_maze_index
SUB R0,R0,#1
BL clear_ampersand_ASM
ADD R0,R0,#1
BL draw_ampersand_ASM 
LDR R4,=position
STR R0,[R4]
ADD R4,R4,#4
STR R1,[R4]
B Polling_Second_Digit 
move_left:
LDR R4,=position
LDR R0,[R4]
ADD R4,R4,#4
LDR R1,[R4]
MOV R4,R0
MOV R5,R1
SUB R4,R4,#1
BL on_grid
MOV R4,R0
SUB R0,R0,#1
BL decide_input_maze_index
ADD R0,R0,#1
BL clear_ampersand_ASM
SUB R0,R0,#1
BL draw_ampersand_ASM 
LDR R4,=position
STR R0,[R4]
ADD R4,R4,#4
STR R1,[R4]
B Polling_Second_Digit 
move_up:
LDR R4,=position
LDR R0,[R4]
ADD R4,R4,#4
LDR R1,[R4]
MOV R4,R0
MOV R5,R1
SUB R5,R5,#1
BL on_grid
MOV R4,R0
SUB R5,R5,#1
BL decide_input_maze_index
ADD R5,R5,#1
BL clear_ampersand_ASM
SUB R1,R1,#1
BL draw_ampersand_ASM 
LDR R4,=position
STR R0,[R4]
ADD R4,R4,#4
STR R1,[R4]
B Polling_Second_Digit
move_down:
LDR R4,=position
LDR R0,[R4]
ADD R4,R4,#4
LDR R1,[R4]
MOV R4,R0
MOV R5,R1
ADD R5,R5,#1
BL on_grid
MOV R4,R0
ADD R1,R1,#1
BL decide_input_maze_index
SUB R1,R1,#1
BL clear_ampersand_ASM
ADD R1,R1,#1
BL draw_ampersand_ASM 
LDR R4,=position
STR R0,[R4]
ADD R4,R4,#4
STR R1,[R4]
B Polling_Second_Digit
decide_input_maze_index:
PUSH {R0-R6}
MOV R3,#48
MOV R4,#4
MUL R5,R1,R3
MUL R6,R0,R4
ldr r3,=index
ldr r3,[r3]
ldr r4,=#432
mul r3,r3,r4
ADD R5,R5,R6 //this is the array-index
ADD R5,R5,R3
LDR R5,[R5]
MOV R3,#1
CMP R5,R3
BEQ decide_input_maze_index_return
MOV R3,#3
CMP R5,R3
BEQ you_win
POP {R0-R6}
BX LR
decide_input_maze_index_return:
POP {R0-R6}
B Polling_Second_Digit
on_grid:
PUSH {R0-R5}
MOV R0,#11
MOV R1,#8
MOV R2,#0
CMP R4,R0
BGT on_grid_return
CMP R5,R1
BGT on_grid_return 
CMP R4,R2
BLT on_grid_return 
CMP R5,R2
BLT on_grid_return
POP {R0-R5}
BX LR
on_grid_return:
POP {R0-R5}
B Polling_Second_Digit
you_win:
POP {R0-R6}
Bl VGA_win_ASM
B end
VGA_win_ASM:
PUSH {LR}
PUSH {R0-R4}
MOV R0,#0
MOV R1,#0
LDR R2,=#0xDB7093
MOV R3,#240
MOV R4,#320
VGA_win_ASM_LOOP0:
BL VGA_draw_point_ASM
ADD R1,R1,#1
CMP R1,R3
BGE VGA_win_ASM_LOOP1
B VGA_win_ASM_LOOP0
VGA_win_ASM_LOOP1:
ADD R0,R0,#1
MOV R1,#0
CMP R0,R4
BLE VGA_win_ASM_LOOP0
POP {R0-R4}
MOV R0,#0
MOV R1,#0
MOV R5,#7
PUSH {R0-R5}
LDR R4,=win
win_loop:
CMP R0,R5
BGT win_loop_return
LDR R2,[R4]
ADD R4,R4,#4
BL VGA_write_char_ASM
ADD R0,#1
B win_loop
win_loop_return:
POP {R0-R5}
BL ARM_TIM_config_ASM
Polling_timer:
BL ARM_TIM_read_INT_ASM
CMP R1,#0
BEQ Polling_timer
LDR R3,=Timer_base //load value address
MOV R4,#0
str R4,[R3,#0x0]  //reset loadvalue
str R4,[R3,#0x4]  //reset counter value
str R4,[R3, #0x8] //reset the control
MOV R4,#1
str R4,[R3, #0xc] //reset the interrupt status
ldr r3,=position
mov r1,#0
mov r2,#0
str r1,[r3]
add r3,r3,#4
str r2,[r3]
BL write_hex_digit
ARM_TIM_config_ASM:
PUSH {R0,R4}
LDR R4,=Timer_base
LDR R0,=200000000000
STR R0,[R4]
LDR R0,=0
ADD R4,R4,#4
ADD R4,R4,#4
MOV R0,#5
STR R0,[R4]
POP {R0,R4}
BX LR
ARM_TIM_read_INT_ASM:
PUSH {R4}
LDR R4,=Timer_base
ADD R4,#12
LDR R4,[R4]
MOV R1,R4
POP {R4}
BX LR
END:
b end