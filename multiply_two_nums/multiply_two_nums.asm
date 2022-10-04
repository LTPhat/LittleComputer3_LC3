; MULTIPLY TWO NUMS
; Input: non-negative integer a,b (0<=a,b<=9)
; Output: Multiplication result of a,b

.ORIG	x3000

LD	R1,ASCII_0
NOT	R1,R1
ADD	R1,R1,#1	;take 2's complement of ASCII_CHAR to VALUE constant


TRAP	x23		;input a
ADD	R2,R0,R1	;R2 contains input a value

TRAP 	x23		;input b

ADD	R3,R0,R1	;R2 contains input b value

;show output string
LEA	R0,STR_OUT
PUTS

;Calculate multiplication of a,b

AND	R4,R4,#0	;define R4 = 0

;ITERATE_1: calculate result save to R4

ITERATE_1	ADD	R2,R2,#-1
		BRn	CONTINUE
		ADD 	R4,R4,R3
		BR	ITERATE_1

CONTINUE	AND	R2,R2,#0; ;define R2 = 0

;ITERATE_2: Tinh chu so hang chuc va hang don vi cua ket qua luu trong R4

ITERATE_2	ADD	R4,R4,#-10	
		BRn	TAKE
		ADD	R2,R2,#1	;R2 la chu so hang chuc
		BR	ITERATE_2
;TAKE: Save result to registers, check number of digits of result
TAKE		LD	R1,ASCII_0
		ADD	R3,R4,#10	;R3 la chu so hang don vi
		ADD	R2,R2,#0	;check R2 is zero or not
		BRz	OUTPUT_1_DIGITS	; if R2 = 0, output 1 digit
		ADD	R0,R2,R1
		TRAP	x21
		ADD	R0,R3,R1
		TRAP	x21
		BR	EXIT

OUTPUT_1_DIGITS	ADD	R0,R3,#0
		TRAP	x21


EXIT		TRAP	x25		;exit program
STR_OUT		.STRINGZ "a x b = "
ASCII_0		.FILL	#48
.END