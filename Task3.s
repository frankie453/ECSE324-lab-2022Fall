.global _start
arr:   .word 68, -22, -31, 75, -10, -61, 39, 92, 94, -55 // test array// test array
n: .word 10//array size
_start:
LDR R0,=arr//pointer to the the current array base address
LDR R1,n  //the length of the array
MOV R2,#1 //int i =1,counter
BL SORT //CALL SORT FUNCTION
B END
// R1 N
// R2 I COUNTER
// R3 VALUE
// R4 J COUNTER
// R5 J-1 AND ARR[J-1]
SORT:
     PUSH {R3-R6} //PUSH VALUES WE USE	 
LOOP:  
       CMP R2,R1 // if(i>=n)
	   BGE RETURN //return;   
       LDR R3,[R0,R2,LSL#2]// int value=arr[i];
	   MOV R4,R2     // int j=i;	   
WHILE: CMP R4,#0//while(j>0)
	   BLE LOOP2 
	   SUB R5,R4,#1 //J-1
	   LDR R5,[R0,R5,LSL#2]//arr[j-1]
	   CMP R5,R3//while(arr[j-1]>value)
	   BLE LOOP2
	   STR R5,[R0,R4,LSL#2] //arr[j]=arr[j-1]
	   SUB R4,R4,#1//j--
	   B WHILE 
	   
LOOP2: STR R3,[R0,R4,LSL#2] //arr[j] =value;
       ADD R2,R2,#1 //i++
	   B LOOP 
RETURN: POP {R3-R6}
        BX LR
END:    B END