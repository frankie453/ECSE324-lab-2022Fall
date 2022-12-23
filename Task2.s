.global _start
arr:   .word 68, -22, -31, 75, -10, -61, 39, 92, 94, -55 // test array// test array
n: .word 10//array size
_start:
LDR R0,=arr//pointer to the the current array base address
LDR R1,=n//address of the length
LDR R1,[R1] //length of the array 3
MOV R5,#1 //int i =1,counter
LOOP:  
       CMP R5,R1 // i<n
	   BGE END
       LDR R2,[R0,R5,LSL#2]// int value=arr[i];
	   MOV R3,R5      // int j=i;	   
WHILE: CMP R3,#0//while(j>0)
	   BLE LOOP2 	   
	   SUB R6,R3,#1
	   //LDR R7,[R0,R5,LSL#2]//arr[j]
	   LDR R4,[R0,R6,LSL#2]//arr[j-1]
	   CMP R4,R2//while(arr[j-1]>value)
	   BLE LOOP2
	   STR R4,[R0,R3,LSL#2] //arr[j]=arr[j-1]
	   SUB R3,R3,#1//j--
	   B WHILE   
LOOP2: STR R2,[R0,R3,LSL#2] 
       ADD R5,R5,#1 //i++
	   B LOOP
END:   B END