;Write program to calcute number of 1 digits in the binary presentation (ASCII) of character input from user

;Input: One ASCII character
;Output: Number of 1 digits in binary presentation of that input character


.ORIG	x3000
;//////////////////////////
;Input character
LEA	R0, INPUT_STR
PUTS
GETC
OUT			
;//////////////////////////////////

;Input character always has 8 bits, create a register to count how namy bits remain after one loop
LD	R7, COUNT_REMAIN

;AND 1 with every bit in the binary presentation of input

AND	R2,R2,#0	; Define R2=0
ADD	R2,R2,#1	; R2 is the register to AND with input
; Define variable to count number of 1 digits (R6)
AND	R6,R6,#0
;/////////////////////////////////////
LOOP	AND 	R4,R0,R2
BRz	NEXT		; if every bit AND 1 == 0 --> NEXT (Means that bit is 0)
	ADD	R6,R6,#1; if every bit AND 1 == 1 --> Increase count (Means that bit is 0) 

NEXT	ADD	R2,R2,R2	; in order to AND with next digit of input
	ADD	R7,R7,#-1	; Decrease count_remain by 1
	BRp	LOOP		; count_remain stil > 0 --> Come back to LOOP
;///////////////////////////////////////
;/////////////////////////////////////
;Output
LEA	R0, STR_OUT
PUTS
LD	R1, ASCII
ADD	R0,R6,R1
OUT
BR	EXIT
;////////////////////////////////////
;Label		
COUNT_REMAIN	.FILL	#8
ASCII		.FILL	#48
INPUT_STR	.STRINGZ "Input one ASCII character: "
STR_OUT		.STRINGZ "\nNumber of 1's is: "
EXIT		TRAP	x25
.END