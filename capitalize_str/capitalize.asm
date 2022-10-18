; Given a string from user, uppercase all characters in str and show on console
; Input: String a
; Output: Uppercase string a


.ORIG x3000
LEA	R0, INPUT_STR
PUTS	
ADD	R1,R1,#0	;define R1 = 0
LEA	R1, MEM 	; give address of MEM to 1

INPUT_LOOP	GETC
		PUTC
		
		LD 	R3,ENTER	; if input = enter means that input is finished.
		ADD	R3,R3,R0	; if R0 = enter, move to show result
		BRz	SHOW
		
		LD	R2,CHECK	; check normal char
		ADD	R2,R0,R2	; if R0 + CHECK (-97) >= 0 --> normal char
		BRzp	CONVERT

SAVE		STR	R0, R1, #0	;save character to current mem
		ADD	R1,R1,#1	;increase mem address by 1 for next char
		BR	INPUT_LOOP	;move back to input_loop

CONVERT		LD	R2, CAP
		ADD	R0, R0, R2	; capitalize
		BR	SAVE

SHOW		LEA	R0, OUTPUT_STR
		PUTS	
		LEA	R0, MEM
		PUTS
TRAP		x25
INPUT_STR	.STRINGZ "Input your string: "
OUTPUT_STR	.STRINGZ "Result: "
ENTER		.FILL	#-10	; negative of ENTER ascii code
CHECK		.FILL	#-97
CAP		.FILL	#-32
MEM	.BLKW	100; Save input string
.END
