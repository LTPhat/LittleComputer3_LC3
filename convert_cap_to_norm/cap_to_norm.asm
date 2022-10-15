; Input n characters ("a-z", "A-Z"). Write a program to convert from uppercase to lowercase. If input characters are lowercase, remain and show
; The program begins at the address of x3050
;Input: n --> Number of characters
;	characters

;Output: lowercase form of characters


.ORIG	x3050
LEA	R0,INPUT_NUMS
PUTS
TRAP	x20
OUT

LD	R1,ASCII_0
ADD	R2,R0,R1; R2 is the number of character from user
LEA	R0,INPUT_STR
PUTS

INPUT_LOOP	TRAP	x20
		OUT
		ADD	R5,R0,#0
		AND	R6,R6,#0
		BR	PROCESS

PROCESS		LD	R7,CHECK_INHOA
		ADD	R3,R5,R7
		BRn	CONVERT; tr.hop chu hoa
		BRp	IN_CHU_THUONG

IN_CHU_THUONG	ADD	R0,R5,#0
		OUT
		ADD	R2,R2,#-1
		BRp	INPUT_LOOP
		BRn	EXIT

CONVERT		LD	R1,CONVERT_NUMS ;convert to lowercase
		ADD	R6,R5,R1
		ADD	R0,R6,#0
		OUT
		ADD	R2,R2,#-1
		BRp	INPUT_LOOP
		BRn	EXIT
EXIT		TRAP 	x25
INPUT_NUMS	.STRINGZ "Define number of characters in your string: "
INPUT_STR	.STRINGZ "\nStart input here: "
ASCII_0		.FILL #-48
CHECK_INHOA	.FILL #-91
CONVERT_NUMS	.FILL #32
.END