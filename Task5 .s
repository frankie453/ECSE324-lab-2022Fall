.global _start
input_image: .word 1057442138,  2410420899, 519339369,  2908788659, 1532551093, 4249151175, 4148718620, 788746931,  3777110853, 2023451652
.word 3000595192,   1424215634, 3130581119, 3415585405, 2359913843, 1600975764, 1368061213, 2330908780, 3460755284, 464067332
.word 2358850436,   1191202723, 2461113486, 3373356749, 3070515869, 4219460496, 1464115644, 3200205016, 1316921258, 143509283
.word 3846979011,   2393794600, 618297079,  2016233561, 3509496510, 1966263545, 568123240,  4091698540, 2472059715, 2420085477
.word 395970857,    2217766702, 44993357,   694287440,  2233438483, 1231031852, 2612978931, 1464238350, 3373257252, 2418760426
.word 4005861356,   288491815, 3533591053,  754133199,  3745088714, 2711399263, 2291899825, 2117953337, 1710526325, 1989628126
.word 465096977,    3100163617, 195551247,  3884399959, 422483884,  2154571543, 3380017320, 380355875,  4161422042, 654077379
.word 2168260534,   3266157063, 3870711524, 2809320128, 3980588369, 2342816349, 1283915395, 122534782,  4270863000, 2232709752
.word 1946888581,   1956399250, 3892336886, 1456853217, 3602595147, 1756931089, 858680934,  2326906362, 2258756188, 1125912976
.word 1883735002,   1851212965, 3925218056, 2270198189, 3481512846, 1685364533, 1411965810, 3850049461, 3023321890, 2815055881
ARRAY: .space 4000
RESULT: .space 160
_start:
//INITIALIZATION(I swear this is the shittest code I have ever written,forgive me)
lDR R0,=input_image
LDR R1,=ARRAY
LDR R2,=RESULT
BL ARRAY_COPY
LDR R3,=#0xFF000000 //right shift operator
BL Big_ARRAY_CHANNEL_SHIFT
BL Big_ARRAY_SORT
BL ARRAY_COPY
LDR R3,=#0xFF0000 //right shift operator
BL ARRAY_CHANNEL_SHIFT
BL ARRAY_SORT
BL ARRAY_COPY
LDR R3,=#0xFF00 //right shift operator
BL ARRAY_CHANNEL_SHIFT
BL ARRAY_SORT
BL ARRAY_COPY
MOV R3,#0xFF //right shift operator
BL ARRAY_CHANNEL_SHIFT
BL ARRAY_SORT
mov r0,r2
B END
//EXTRACTION METHOD
//R0 BASE ADDRESS
//R1 ARRAY ADDRESS
//R7 CURRENT ADDRESS
//R4 ROW COUNTER
//R5
ARRAY_COPY:
PUSH {R0-R8,R10}
MOV R4,#0    //ROW INDEX
MOV R5,R0    //CURRENT ADDRESS,0 FOR START
ARRAY_CHECK:
CMP R5,#220  //CHECK IF IT IS THE LAST ELEMENT,RETURN IF ALL ELEMENTS ARE COPIED
BGT ARRAY_COPY_RETURN //ALL ELEMENTS HAVE
CMP R6,#5
BGT ARRAY_SHIFT_NEXTLINE
B ARRAY_COPY_LOOP      
ARRAY_COPY_LOOP:
CMP R4,#5       //check if the current block of elements are copied into array
BGE ARRAY_SHIFT //move the block right by 1   
LSL R2,R4,#2    //offset
ADD R2,R5,R2 
ADD R3,R2,#0
LDR R3,[R3]     //load the value
STR R3,[R1],#4  // int value=arr[i];

ADD R0,R2,#40
LDR R0,[R0]     //load the value
STR R0,[R1],#4  // int value=arr[i];

ADD R7,R2,#80
LDR R7,[R7]     //load the value
STR R7,[R1],#4  // int value=arr[i];

ADD R8,R2,#120
LDR R8,[R8]     //load the value
STR R8,[R1],#4  // int value=arr[i];

ADD R10,R2,#160
LDR R10,[R10]     //load the value
STR R10,[R1],#4  // int value=arr[i];

ADD R4,R4,#1    //update the row counter
B ARRAY_COPY_LOOP
ARRAY_SHIFT:
//shift the square to the right by 1 word
ADD R5,R5,#4
ADD R6,R6,#1 //newline index
MOV R4,#0
B ARRAY_CHECK 
ARRAY_SHIFT_NEXTLINE:
//shift the square to the next line
ADD R5,R5,#16
MOV R4,#0
MOV R6,#0
B ARRAY_CHECK
ARRAY_COPY_RETURN:
POP {R0-R8,R10}
BX LR

Big_ARRAY_SORT:
           PUSH {R0-R8} 
		   MOV R8,R1
Big_SORT:    
     // use r8 to hold the current address in the array to be sorted
	 //if it is beyond 4000,then all element in the array have been sorted
     CMP R8,#4000 
	 BGE Big_SORT_RETURN //all elements have been sorted
     MOV R0,#1 //int i =1,counter
            
          // R0 I
		  // R1 ARRAY BASE ADDRESS
		  // R2 RESULT ARRAY
		  // R3 VALUE
          // R4 J COUNTER
          // R5 J-1 AND ARR[J-1] 
Big_SORT_LOOP:  
          CMP R0,#25 // if(i>=n)
	      BGE Big_GET_MEDIAN //return END OF THE SORT,STARTING TO GET MEDIAN   
          LDR R3,[R8,R0,LSL#2]// int value=arr[i];
	      MOV R4,R0     // int j=i;	   
Big_SORT_WHILE: 
           CMP R4,#0//while(j>0)
	       BLE Big_SORT_LOOP2 
	       SUB R5,R4,#1 //J-1
	       LDR R5,[R8,R5,LSL#2]//arr[j-1]
	       CMP R5,R3//while(arr[j-1]>value)
	       BLE Big_SORT_LOOP2
	       STR R5,[R8,R4,LSL#2] //arr[j]=arr[j-1]
	       SUB R4,R4,#1//j--
	       B   Big_SORT_WHILE 
	   
Big_SORT_LOOP2:          
           STR R3,[R8,R4,LSL#2] //arr[j] =value;
           ADD R0,R0,#1 //i++
	       B Big_SORT_LOOP 
Big_GET_MEDIAN:
           ADD R6,R6,#1
           LSL R0,R0,#2
		   MUL R0,R0,R6
		   ADD R0,R1,R0
		   SUB R0,R0,#52
           ldr R0,[R0]   //THE MEDIAN OF THE ARRAY
		   LSL R0,R0,#1
Big_STORE_REUSLT:
             //RO,THE MEDIAN
			 //R1,THE BASE ADDRESS OF THE RESULT ARRAY
			 //R6,THE INCREMENT INDEX
			 LDR R7,[R2]
			 ADD R7,R7,R0
			 STR R7,[R2]
			 ADD R2,R2,#4
			 //UPDATE THE CURRENT BASE ADDRESS IN THE SORTING 
			 ADD R8,R8,#100//UPDATING THE BASE ADDRESS
			 //OTHER REMAIN SAME
			 B Big_SORT
Big_SORT_RETURN:
POP {R0-R8}
BX LR




ARRAY_SORT:
           PUSH {R0-R8} 
		   MOV R8,R1
SORT:    
     // use r8 to hold the current address in the array to be sorted
	 //if it is beyond 4000,then all element in the array have been sorted
     CMP R8,#4000 
	 BGE SORT_RETURN //all elements have been sorted
     MOV R0,#1 //int i =1,counter
            
          // R0 I
		  // R1 ARRAY BASE ADDRESS
		  // R2 RESULT ARRAY
		  // R3 VALUE
          // R4 J COUNTER
          // R5 J-1 AND ARR[J-1] 
SORT_LOOP:  
          CMP R0,#25 // if(i>=n)
	      BGE GET_MEDIAN //return END OF THE SORT,STARTING TO GET MEDIAN   
          LDR R3,[R8,R0,LSL#2]// int value=arr[i];
	      MOV R4,R0     // int j=i;	   
SORT_WHILE: 
           CMP R4,#0//while(j>0)
	       BLE SORT_LOOP2 
	       SUB R5,R4,#1 //J-1
	       LDR R5,[R8,R5,LSL#2]//arr[j-1]
	       CMP R5,R3//while(arr[j-1]>value)
	       BLE SORT_LOOP2
	       STR R5,[R8,R4,LSL#2] //arr[j]=arr[j-1]
	       SUB R4,R4,#1//j--
	       B SORT_WHILE 
	   
SORT_LOOP2:          
           STR R3,[R8,R4,LSL#2] //arr[j] =value;
           ADD R0,R0,#1 //i++
	       B SORT_LOOP 
GET_MEDIAN:
           ADD R6,R6,#1
           LSL R0,R0,#2
		   MUL R0,R0,R6
		   ADD R0,R1,R0
		   SUB R0,R0,#52
           ldr R0,[R0]   //THE MEDIAN OF THE ARRAY
		  // LSL R0,R0,#1
STORE_REUSLT:
             //RO,THE MEDIAN
			 //R1,THE BASE ADDRESS OF THE RESULT ARRAY
			 //R6,THE INCREMENT INDEX
			 LDR R7,[R2]
			 ADD R7,R7,R0
			 STR R7,[R2]
			 ADD R2,R2,#4
			 //UPDATE THE CURRENT BASE ADDRESS IN THE SORTING 
			 ADD R8,R8,#100//UPDATING THE BASE ADDRESS
			 //OTHER REMAIN SAME
			 B SORT
SORT_RETURN:
POP {R0-R8}
BX LR






Big_ARRAY_CHANNEL_SHIFT:
            PUSH {R0-R8}
            //INITIALIZE A COUNTER
            MOV R4,#0 //R1 IS USED AS COUNTER 
Big_SHIFT_WHILE:
            CMP R4,#900
			BGE Big_SHIFT_RETURN
			LDR R2,[R1,R4,LSL#2]// int value=arr[i];
			AND R2,R3
			LSR R2,R2,#1
			STR R2,[R1,R4,LSL#2]
			ADD R4,R4,#1
			B Big_SHIFT_WHILE 
Big_SHIFT_RETURN:
             POP {R0-R8}
			 BX LR
			 
			 ARRAY_CHANNEL_SHIFT:
            PUSH {R0-R8}
            //INITIALIZE A COUNTER
            MOV R4,#0 //R1 IS USED AS COUNTER 
SHIFT_WHILE:
            CMP R4,#900
			BGE SHIFT_RETURN
			LDR R2,[R1,R4,LSL#2]// int value=arr[i];
			AND R2,R3
			//LSR R2,R2,#1
			STR R2,[R1,R4,LSL#2]
			ADD R4,R4,#1
			B SHIFT_WHILE 
SHIFT_RETURN:
             POP {R0-R8}
			 BX LR
END:
B END