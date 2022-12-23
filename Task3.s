.section .vectors, "ax"
B _start
B SERVICE_UND       // undefined instruction vector
B SERVICE_SVC       // software interrupt vector
B SERVICE_ABT_INST  // aborted prefetch vector
B SERVICE_ABT_DATA  // aborted data vector
.word 0 // unused vector
B SERVICE_IRQ       // IRQ interrupt vector
B SERVICE_FIQ       // FIQ interrupt vector


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

Configuration:
/* Set up stack pointers for IRQ and SVC processor modes */
    MOV    R1, #0b11010010      // interrupts masked, MODE = IRQ
    MSR    CPSR_c, R1           // change to IRQ mode
    LDR    SP, =0xFFFFFFFF - 3  // set IRQ stack to A9 onchip memory
    /* Change to SVC (supervisor) mode with interrupts disabled */
    MOV    R1, #0b11010011      // interrupts masked, MODE = SVC
    MSR    CPSR, R1             // change to supervisor mode
    LDR    SP, =0x3FFFFFFF - 3  // set SVC stack to top of DDR3 memory
    BL     CONFIG_GIC           // configure the ARM GIC
	BL     ARM_TIM_config_ASM   //configure the timer
    // To DO: write to the pushbutton KEY interrupt mask register
    // Or, you can call enable_PB_INT_ASM subroutine from previous task
    // to enable interrupt for ARM A9 private timer, use ARM_TIM_config_ASM subroutine 
    LDR    R0, =0xFF200050      // pushbutton KEY base address
    MOV    R1, #0xF             // set interrupt mask bits
    STR    R1, [R0, #0x8]       // interrupt mask register (base + 8)
    // enable IRQ interrupts in the processor
    MOV    R0, #0b01010011      // IRQ unmasked, MODE = SVC
    MSR    CPSR_c, R0
	
	
	
	
	


/////////////////////////////////////////
/*--- Undefined instructions ---------------------------------------- */
SERVICE_UND:
    B SERVICE_UND
/*--- Software interrupts ------------------------------------------- */
SERVICE_SVC:
    B SERVICE_SVC
/*--- Aborted data reads -------------------------------------------- */
SERVICE_ABT_DATA:
    B SERVICE_ABT_DATA
/*--- Aborted instruction fetch ------------------------------------- */
SERVICE_ABT_INST:
    B SERVICE_ABT_INST
/*--- IRQ ----------------------------------------------------------- */
SERVICE_IRQ:
    PUSH {R0-R7, LR}
/* Read the ICCIAR from the CPU Interface */
    LDR R4, =0xFFFEC100
    LDR R5, [R4, #0x0C] // read from ICCIAR

/* To Do: Check which interrupt has occurred (check interrupt IDs)
   Then call the corresponding ISR
   If the ID is not recognized, branch to UNEXPECTED 
   See the assembly example provided in the De1-SoC Computer_Manual on page 46 */     
 Pushbutton_check:
    CMP R5, #73
UNEXPECTED:
    BNE UNEXPECTED      // if not recognized, stop here
    BL KEY_ISR
EXIT_IRQ:
/* Write to the End of Interrupt Register (ICCEOIR) */
    STR R5, [R4, #0x10] // write to ICCEOIR
    POP {R0-R7, LR}
SUBS PC, LR, #4
/*--- FIQ ----------------------------------------------------------- */
SERVICE_FIQ:
    B SERVICE_FIQ

////////////////////////////
CONFIG_GIC:
    PUSH {LR}
/* To configure the FPGA KEYS interrupt (ID 73):
* 1. set the target to cpu0 in the ICDIPTRn register
* 2. enable the interrupt in the ICDISERn register */
/* CONFIG_INTERRUPT (int_ID (R0), CPU_target (R1)); */
/* To Do: you can configure different interrupts
   by passing their IDs to R0 and repeating the next 3 lines */  
    MOV R0, #73            // KEY port (Interrupt ID = 73)
    MOV R1, #1             // this field is a bit-mask; bit 0 targets cpu0
    BL CONFIG_INTERRUPT 

/* configure the GIC CPU Interface */
    LDR R0, =0xFFFEC100    // base address of CPU Interface
/* Set Interrupt Priority Mask Register (ICCPMR) */
    LDR R1, =0xFFFF        // enable interrupts of all priorities levels
    STR R1, [R0, #0x04]
/* Set the enable bit in the CPU Interface Control Register (ICCICR).
* This allows interrupts to be forwarded to the CPU(s) */
    MOV R1, #1
    STR R1, [R0]
/* Set the enable bit in the Distributor Control Register (ICDDCR).
* This enables forwarding of interrupts to the CPU Interface(s) */
    LDR R0, =0xFFFED000
    STR R1, [R0]
    POP {PC}

/*
* Configure registers in the GIC for an individual Interrupt ID
* We configure only the Interrupt Set Enable Registers (ICDISERn) and
* Interrupt Processor Target Registers (ICDIPTRn). The default (reset)
* values are used for other registers in the GIC
* Arguments: R0 = Interrupt ID, N
* R1 = CPU target
*/
CONFIG_INTERRUPT:
    PUSH {R4-R5, LR}
/* Configure Interrupt Set-Enable Registers (ICDISERn).
* reg_offset = (integer_div(N / 32) * 4
* value = 1 << (N mod 32) */
    LSR R4, R0, #3    // calculate reg_offset
    BIC R4, R4, #3    // R4 = reg_offset
    LDR R2, =0xFFFED100
    ADD R4, R2, R4    // R4 = address of ICDISER
    AND R2, R0, #0x1F // N mod 32
    MOV R5, #1        // enable
    LSL R2, R5, R2    // R2 = value
/* Using the register address in R4 and the value in R2 set the
* correct bit in the GIC register */
    LDR R3, [R4]      // read current register value
    ORR R3, R3, R2    // set the enable bit
    STR R3, [R4]      // store the new register value
/* Configure Interrupt Processor Targets Register (ICDIPTRn)
* reg_offset = integer_div(N / 4) * 4
* index = N mod 4 */
    BIC R4, R0, #3    // R4 = reg_offset
    LDR R2, =0xFFFED800
    ADD R4, R2, R4    // R4 = word address of ICDIPTR
    AND R2, R0, #0x3  // N mod 4
    ADD R4, R2, R4    // R4 = byte address in ICDIPTR
/* Using register address in R4 and the value in R2 write to
* (only) the appropriate byte */
    STRB R1, [R4]
    POP {R4-R5, PC}
//////////////////////////////

KEY_ISR:
    LDR R0, =0xFF200050    // base address of pushbutton KEY port
    LDR R1, [R0, #0xC]     // read edge capture register
    MOV R2, #0xF
    STR R2, [R0, #0xC]     // clear the interrupt
    LDR R0, =0xFF200020    // based address of HEX display
CHECK_KEY0:
    MOV R3, #0x1
    ANDS R3, R3, R1        // check for KEY0
    BEQ CHECK_KEY1
    MOV R2, #0b00111111
    STR R2, [R0]           // display "0"
    B END_KEY_ISR
CHECK_KEY1:
    MOV R3, #0x2
    ANDS R3, R3, R1        // check for KEY1
    BEQ CHECK_KEY2
    MOV R2, #0b00000110
    STR R2, [R0]           // display "1"
    B END_KEY_ISR
CHECK_KEY2:
    MOV R3, #0x4
    ANDS R3, R3, R1        // check for KEY2
    BEQ IS_KEY3
    MOV R2, #0b01011011
    STR R2, [R0]           // display "2"
    B END_KEY_ISR
IS_KEY3:
    MOV R2, #0b01001111
    STR R2, [R0]           // display "3"
END_KEY_ISR:
    BX LR

_start:
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