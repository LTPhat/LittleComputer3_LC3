;Input: 2 positive number a,b (0<=a,b<=9)
;Output: Sum of input
;Save a,b to x4000, x4001, output to x4002


.ORIG	x3000
TRAP	x23		;input first number (char)
LD	R1, ASCII_0
NOT	R1, R1
ADD	R1, R1, #1	;take 2's complement --> Convert positive to negative
ADD	R2, R0, R1	;convert first input (R0) from ascii char to number


TRAP	x23		;input second number (char)
ADD	R3, R0, R1	;convert second input (R0) from ascii char to number
ADD	R4, R2, R3	;calculate sum

;save input and output to register

LD	R0, SAVE_ADDRESS
STR	R2, R0, #0	;MEM[x4000] <- R2 (input 1)
STR	R3, R0, #1	;MEM[x4001] <- R3 (input 2)
STR	R4, R0, #2	;MEM[x4002] <- R4 (output)

;load out_str to console

LEA 	R0,OUT_STR
PUTS

;condition whether result has 1 digits or 2 digits
LD 	R7, ASCII_0
ADD	R5, R4, #-10	; R5 = R4 - 10
BRzp	OUT_2_DIGITS	; if R5 >0 --> OUT_2_DIGITS	
ADD	R0, R4, R7	;else
TRAP	x21
BR	EXIT

OUT_2_DIGITS	ADD	R0, R7,#1	;print 1 
		TRAP	x21
		LD	R7,ASCII_0
		ADD	R0,R5,R7
		TRAP	x21
OUT_STR		.STRINGZ "a + b = "
ASCII_0		.FILL #48
SAVE_ADDRESS	.FILL x4000
EXIT		TRAP	x25
.END