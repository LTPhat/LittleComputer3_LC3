;Input: two nums a,b (0 <=a,b <= 9)
;Output: Subtraction of a,b
;save a,b, result to register x4000, x4001, x4002

.ORIG	x3000
LD	R1, ASCII_0
NOT 	R1,R1
ADD	R1,R1,#1	;get -48

TRAP	x23
ADD	R2,R0,R1	;first num save to R2

TRAP	x23
ADD	R3,R0,R1	;second num save to R3

;save address
LD	R0,SAVE_ADDRESS	;MEM[x4000] <-R0
STR	R2,R0,#0		;MEM[x4000] <-R2
STR	R3,R0,#1		;MEM[x4001] <-R3
STR	R4,R0,#2		;MEM[x4002] <-R4

;show out_str
LEA	R0,OUT_STR
PUTS
;subtraction

NOT 	R3,R3
ADD	R3,R3,#1		; get -R3
ADD	R5,R2,R3		; R5 = R2+(R3)
BRzp	PRINT			; if R5 > 0 --> PRINT
LD	R7, MINUS
ADD	R0,R7,#0
TRAP	x21			; show "-" sign

LD	R7,ASCII_0
NOT	R5,R5	
ADD	R5,R5,#1		; R5 < 0, convert to R5>0
ADD	R0,R5,R7
TRAP	x21			; show last digit rightmost to "-" sign
BR	EXIT


PRINT	LD	R7,ASCII_0
	ADD	R0,R5,R7
	TRAP	x21
MINUS		.FILL	#45	
ASCII_0		.FILL	#48
SAVE_ADDRESS	.FILL	x4000
OUT_STR		.STRINGZ "a - b = "
EXIT	TRAP	x25
.END