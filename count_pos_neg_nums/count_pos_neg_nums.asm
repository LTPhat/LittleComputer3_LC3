;Given 10 integers (1 digit) store at address from x3100 to x3109. 
;Write a program to count how many positive nums and negative nums in that 10 integers
;The program start at the address of x3000

.ORIG 	x3000

AND	R7,R7,#0; var to count nums of pos
AND	R6,R6,#0; var to count nums of neg
AND	R5,R5,#0; var to count nums of loops
ADD	R5,R5,#10

AND	R1,R1,#0; 
LD	R2, BEGIN_ADD; var to save begin adrress
LDR	R3,R2,#0; R3 is var taking address of each loop, first start at address of R2
BR	ITER_1
;////////////////////////////////////////
ITER_1	ADD	R4,R3,R3	; Add the number with itself, result is neg shows that the number is neg and reversely
	BRp	PROCESS_POSITIVE
	BRn	PROCESS_NEGATIVE
	ADD	R5,R5,#-1	; Decrease count loop var by 1 after one loop
	BRp	ITER_1
	BR	PROCESS
;/////////////////////////////////////////
PROCESS_POSITIVE	ADD	R7,R7,#1	; increse count var
			ADD	R2,R2,x0001	; take next adress for next loop
			LDR	R3,R2,#0	; R3 take the value of next adress
			ADD	R1,R7,#0	; convert R7 to R1
			ADD	R5,R5,#-1	; Decrease count loop var by 1 after one loop
			BRp	ITER_1
;/////////////////////////////////////////
PROCESS_NEGATIVE	ADD	R6,R6,#1	; increse count var
			ADD	R2,R2,x0001	; take next adress for next loop
			LDR	R3,R2,#0	; R3 take the value of next adress
			ADD	R5,R5,#-1	; Decrease count loop var by 1 after one loop
			BRp	ITER_1
;/////////////////////////////////////////
PROCESS			LEA	R0,OUT_STR1
			PUTS
			LD	R7,ASCII_0
			ADD	R0,R6,R7
			TRAP	x21		; output nums of neg
			LEA	R0,OUT_STR2
			PUTS
			LD	R7,ASCII_0
			ADD	R0,R1,R7
			TRAP	x21		; output num of pos
			BR	EXIT

;///////////////////////////////////////////
BEGIN_ADD	.FILL	x3100
OUT_STR1	.STRINGZ "Number of negative: "
OUT_STR2	.STRINGZ "\nNumber of positive: "
ASCII_0		.FILL	#48
EXIT		TRAP	x25
.END