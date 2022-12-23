.global _start
.equ Timer_base,0xFFFEC600

//The subroutine is used to configure the timer. 
//Use the arguments discussed above to configure the timer.
ARM_TIM_config_ASM:
PUSH {R4,R5}
LDR R4,=Timer_base
//1- Load value: ARM A9 private timer is a down counter and requires initial count value. 
//Use A1 to pass this argument.
LDR R0,=20000000
STR R0,[R4]
LDR R0,=0
ADD R4,R4,#4
STR R0,[R4]

//address of the control
ADD R4,R4,#4
//set the presculer and the IAE bit
MOV R5,#7
STR R5,[R4]
POP {R4,R5}
BX LR

//The subroutine returns the "F" value (0x00000000 or 0x00000001) 
//from the ARM A9 private timer Interrupt status register
ARM_TIM_read_INT_ASM:
PUSH {R4}
LDR R4,=Timer_base
ADD R4,#12
LDR R4,[R4]
MOV R1,R4
POP {R4}
BX LR

 
//The F bit can be cleared to 0 by writing a 0x00000001 into the 
//Interrupt status register.
ARM_TIM_clear_INT_ASM:
PUSH {R2,R4}
LDR R4,=Timer_base
ADD R4,#12
MOV R2,#1
STR R2,[R4]
POP {R2,R4}
BX LR








// Sider Switches Driver
// returns the state of slider switches in R0
.equ SW_MEMORY, 0xFF200040
/* The EQU directive gives a symbolic name to a numeric constant, 
a register-relative value or a PC-relative value. */
read_slider_switches_ASM:
    PUSH {R0}
    LDR R0, =SW_MEMORY
    LDR R1, [R0]
	POP {R0}
    BX  LR
	// LEDs Driver
// writes the state of LEDs (On/Off state) in R0 to the LEDs memory location
.equ LED_MEMORY, 0xFF200000
write_LEDs_ASM:
    PUSH {R0}
    LDR R0, =LED_MEMORY
    STR R1, [R0]
	POP {R0}
    BX  LR
.equ Segment_Displays,0xFF200020
.equ Segment_Displays1, 0xFF200030
HEX0 = 0x00000001
HEX1 = 0x00000002
HEX2 = 0x00000004
HEX3 = 0x00000008
HEX4 = 0x00000010
HEX5 = 0x00000020
HEX_clear_ASM:
PUSH {R2-R4}
LDR R3 ,=Segment_Displays
LDR R4 ,=Segment_Displays1
MOV R2,#0
STR R2,[R3]
STR R2,[R4]
POP {R2-R4}
BX LR
HEX_flood_ASM: 
PUSH {LR}
PUSH {R1}
MOV R1,#8
BL HEX_write_ASM
POP {R1}
POP {LR}
BX LR
HEX_write_ASM:
  Push {LR}
  Push {R2-R6}
  LDR R4, = Segment_Displays
  LDR R5, = Segment_Displays1
  Bl General_Display_write
  POP {R2-R6}
  POP {LR}
  BX LR
General_Display_write:
Push {LR}
CMP R1,#0x0
BEQ Display0_write
CMP R1,#0x1
BEQ Display1_write
CMP R1,#0x2
BEQ Display2_write
CMP R1,#0x3
BEQ Display3_write
CMP R1,#0x4
BEQ Display4_write
CMP R1,#0x5
BEQ Display5_write
CMP R1,#0x6
BEQ Display6_write
CMP R1,#0x7
BEQ Display7_write
CMP R1,#0x8
BEQ Display8_write
CMP R1,#0x9
BEQ Display9_write
CMP R1,#0xa
BEQ DisplayA_write
CMP R1,#0xb
BEQ DisplayB_write
CMP R1,#0xc
BEQ DisplayC_write
CMP R1,#0xd
BEQ DisplayD_write
CMP R1,#0xe
BEQ DisplayE_write
CMP R1,#0xf
BEQ DisplayF_write
//Processing to find which hex is turned on
Display_catching_index:
MOV R3,R0
AND R3,#HEX0
CMP R3,#HEX0
BLEQ Hex0_write
MOV R3,R0
AND R3,#HEX1
CMP R3,#HEX1
BLEQ Hex1_write
MOV R3,R0
AND R3,#HEX2
CMP R3,#HEX2
BLEQ Hex2_write
MOV R3,R0
AND R3,#HEX3
CMP R3,#HEX3
BLEQ Hex3_write
MOV R3,R0
AND R3,#HEX4
CMP R3,#HEX4
BLEQ Hex4_write
MOV R3,R0
AND R3,#HEX5
CMP R3,#HEX5
BLEQ Hex5_write
PoP {LR}
BX LR
//R2 is used to store the base number index will be added offsett later 
Display0_write:
Mov R2,#63
B Display_catching_index
Display1_write:
Mov R2,#6
B Display_catching_index
Display2_write:
Mov R2,#91
B Display_catching_index
Display3_write:
Mov R2,#79
B Display_catching_index
Display4_write:
Mov R2,#102
B Display_catching_index
Display5_write:
Mov R2,#109
B Display_catching_index
Display6_write:
Mov R2,#125
B Display_catching_index
Display7_write:
Mov R2,#7
B Display_catching_index
Display8_write:
Mov R2,#127
B Display_catching_index
Display9_write:
Mov R2,#111
B Display_catching_index
DisplayA_write:
Mov R2,#119
B Display_catching_index
DisplayB_write:
Mov R2,#124
B Display_catching_index
DisplayC_write:
Mov R2,#57
B Display_catching_index
DisplayD_write:
Mov R2,#94
B Display_catching_index
DisplayE_write:
Mov R2,#121
B Display_catching_index
DisplayF_write:
Mov R2,#113
B Display_catching_index
Hex0_write:
PUSH {R2-R6}
//copying the  base index to R3 register
Mov R3,R2
//starting adding offset to the base index
LSL R3,#0
LDR R6,[R4]
AND R6,R6,#0xFFFFFF00
ADD R3,R3,R6
STR R3,[R4]
POP {R2-R6}
BX LR
Hex1_write:
PUSH {R2-R6}
//copying the  base index to R3 register
Mov R3,R2
//starting adding offset to the base index
LSL R3,#8
LDR R6,[R4]
AND R6,R6,#0xFFFF00FF
ADD R3,R3,R6
STR R3,[R4]
POP {R2-R6}
BX LR
Hex2_write:
PUSH {R2-R6}
//copying the  base index to R3 register
Mov R3,R2
//starting adding offset to the base index
LSL R3,#16
LDR R6,[R4]
AND R6,R6,#0xFF00FFFF
ADD R3,R3,R6
STR R3,[R4]
POP {R2-R6}
BX LR
Hex3_write:
PUSH {R2-R6}
//copying the  base index to R3 register
Mov R3,R2
//starting adding offset to the base index
LSL R3,#24
LDR R6,[R4]
AND R6,R6,#0x00FFFFFF
ADD R3,R3,R6
STR R3,[R4]
POP {R2-R6}
BX LR
Hex4_write:
PUSH {R2-R6}
//copying the  base index to R3 register
Mov R3,R2
//starting adding offset to the base index
LSL R3,#0
LDR R6,[R5]
AND R6,R6,#0xFFFFFF00
ADD R3,R3,R6
STR R3,[R5]
POP {R2-R6}
BX LR
Hex5_write:
PUSH {R2-R6}
//copying the  base index to R3 register
Mov R3,R2
//starting adding offset to the base index
LSL R3,#8
LDR R6,[R5]
AND R6,R6,#0xFFFF00FF
ADD R3,R3,R6
STR R3,[R5]
POP {R2-R6}
BX LR

//push_buttons address
PB0 = 0x00000001
PB1 = 0x00000002 
PB2 = 0x00000004
PB3 = 0x00000008
.equ PB_address,0xFF200050


//The subroutine returns the indices of the pressed pushbuttons 
//(the keys form the pushbuttons Data register). 
//The indices are encoded based on a one-hot encoding scheme:
@R0 is returned
read_PB_data_ASM:
PUSH {R3}
LDR R3,=PB_address
LDR R3,[R3]
MOV R0,R3
POP {R3}
BX LR

//The subroutine returns the indices of the pushbuttons that have been pressed and then released 
//(the edge bits form the pushbuttons Edgecapture register).
read_PB_edgecp_ASM:
PUSH {R3}
LDR R3,=PB_address
ADD R3,R3,#12
LDR R3,[R3]
MOV R0,R3
POP {R3}
BX LR
//The subroutine receives a pushbutton index as an argument. 
//Then, it returns 0x00000001 if the corresponding pushbutton is pressed.
PB_data_is_pressed_ASM: 
PUSH {R3,R4}
LDR R3,=PB_address
LDR R3,[R3]
AND R4,R0,R3
CMP R4,R0
BEQ PB_data_is_pressed_ASM_branch
POP {R3,R4}
BX LR
PB_data_is_pressed_ASM_branch:
MOV R1,#1
POP {R3,R4}
BX LR

//The subroutine receives a pushbutton index as an argument. 
//Then, it returns 0x00000001 if the corresponding pushbutton has been pressed and released.
PB_edgecp_is_pressed_ASM:
PUSH {R3,R4}
LDR R3,=PB_address
ADD R3,R3,#12
LDR R3,[R3]
AND R4,R0,R3
CMP R4,R0
BEQ PB_edgecp_is_pressed_ASM_branch
POP {R3,R4}
BX LR
PB_edgecp_is_pressed_ASM_branch:
MOV R1,#1
POP {R3,R4}
BX LR
//The subroutine clears the pushbuttons Edgecapture register. 
//You can read the edgecapture register and
//write what you just read back to the edgecapture register to clear it.
PB_clear_edgecp_ASM: 
PUSH {R3,R4}
LDR R3,=PB_address
ADD R3,R3,#12
LDR R4,[R3]
STR R4,[R3]
POP {R3,R4}
BX LR


//The subroutine receives pushbuttons indices as an argument. 
//Then, it enables the interrupt function for the corresponding pushbuttons 
//by setting the interrupt mask bits to '1'.
enable_PB_INT_ASM:
PUSH {R3,R4}
LDR R3,=PB_address
ADD R3,R3,#8
LDR R4,[R3]
ORR R4,R0,R4
STR R4,[R3]
POP {R3,R4}
BX LR

//The subroutine receives pushbuttons indices as an argument. 
//Then, it disables the interrupt function for the corresponding pushbuttons 
//by setting the interrupt mask bits to '0'.
disable_PB_INT_ASM:
PUSH {R3,R4}
LDR R3,=PB_address
ADD R3,R3,#8
LDR R4,[R3]
BIC R4,R4,R0
STR R4,[R3]
POP {R3,R4}
BX LR

_start:

////////////////////////////
IDLE:
MOV R7,#0//general counter
MOV R6,#0//millie second counter
MOV R5,#0//second counter
MOV R8,#0//minute counter
MOV R10,#0//hour counter
MOV R0,#63
MOV R1,#0
BL HEX_write_ASM//clear all the display

MOV R0,#0

LDR R3,=Timer_base //load value address
MOV R4,#0
LDR R4,[R3,#0x0]  //reset loadvalue
LDR R4,[R3,#0x4]  //reset counter value
LDR R4,[R3, #0x8] //reset the control
LDR R4,[R3, #0xc] //reset the interrupt status

B Start_Wait//waiting for the start button to be triggered
//wait untill the button 0 is clicked
//click and press button 0 will start the program
Start_Wait:
//start
MOV R0,#1  //index of button o
BL PB_edgecp_is_pressed_ASM 
CMP R1,#0
BEQ Start_Wait //wait untill start

BL ARM_TIM_config_ASM //start

Polling_excuting:
//stop
MOV R0,#2
//reset the button status flag
MOV R1,#0
BL PB_edgecp_is_pressed_ASM

CMP R1,#1
BEQ Stop_branch //branch to stop_branch
//reset
MOV R0,#4
//reset the button status flag
MOV R1,#0
BL PB_edgecp_is_pressed_ASM
CMP R1,#1
BEQ Reset_branch //branch to reset_branch
B Timer_Loop //if not reset then branch to the timer_loop
//stop the timer
Stop_branch:
PUSH {R3,R4}
LDR R3,=Timer_base
MOV R4,#6
STR R4,[R3, #0x8] //reset the control
POP {R3,R4}
BL PB_clear_edgecp_ASM
MOV R1,#0 //reset status
B Start_Wait
//reset the timer
Reset_branch:
BL PB_clear_edgecp_ASM
MOV R1,#0 //reset status
B IDLE


//An infinite Timer_loop
//modify the clock as well during excution


Timer_Loop:
BL ARM_TIM_read_INT_ASM
CMP R1,#0
BEQ Polling_excuting 
BL ARM_TIM_clear_INT_ASM
ADD R7,R7,#1//increment total counter

Hour_division:
MOV R0,R7
LDR R1,=#36000
BL Division
MOV R2,R0
MOV R3,R1
MOV R0,#32
MOV R1,R2
BL HEX_write_ASM
B Minute_division
Minute_division:
MOV R0,R3
MOV R1,#600
BL Division 
MOV R4,R1

MOV R1,#10
BL Division

MOV R2,R0
MOV R3,R1

MOV R0,#16
MOV R1,R2
BL HEX_write_ASM
MOV R0,#8
MOV R1,R3
BL HEX_write_ASM
B Second_divison
Second_divison:
MOV R0,R4
MOV R1,#10
BL Division
MOV R4,R1

MOV R1,#10
BL Division

MOV R2,R0
MOV R3,R1

MOV R0,#4
MOV R1,R2
BL HEX_write_ASM
MOV R0,#2
MOV R1,R3
BL HEX_write_ASM
MOV R0,#1
MOV R1,R4
BL HEX_write_ASM
B Polling_excuting 



@R0 return multiple
@R1 return qutient
Division:
      MOV R2,#0  //quotient
Division_LOOP: CMP R0,R1   
	   BLT Division_LOOP1
	   SUB R0,R0,R1
	   ADD R2,R2,#1
	   B Division_LOOP
Division_LOOP1: 
       MOV R1,R0
       MOV R0,R2
	   MOV R2,#0
	   BX LR
END:
B END