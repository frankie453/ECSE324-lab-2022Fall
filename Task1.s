
.global _start
result:   .space 4 
_start:
  MOV R0,#40  //dividend
  MOV R1,#15  //divisor
  MOV R2,#0  //quotient
  LDR R3,=result //destination address 
 LOOP: CMP R0,R1   
	   BLT LOOP1
	   SUB R0,R0,R1
	   ADD R2,R2,#1
	   B LOOP
  LOOP1: 
       LSL R2,#16
	   ADD R2,R2,R0
       STR R2,[R3]
	   B end
end:b end