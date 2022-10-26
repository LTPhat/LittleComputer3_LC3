.ORIG X3000

	AND R0, R0, #0		;
	AND R5, R5, #0		;
	AND R6, R6, #0		; xoa cac thanh ghi de lam bien dem
	ADD R0, R0, #10		; co 6 gia tri can kiem -> bien dem R0 bat dau tu 6
	LD R1, MEM		; dua dia chi o nho dau tien vao R1

LOOP	LDR R2, R1, #0		; lay gia tri luu trong dia chi o nho dang chua trong R1 vao R2
	BRZ CHAN		; neu la so 0 thi toi label "CHAN"
	BRN NEG			; neu la so am thi toi label "NEG"

POS	ADD R2, R2, #-2		; vong lap cho so duong -> tru di 2 don vi	
	BRN LE			; neu xuat hien ket qua am -> di toi label "LE"
	BRZ CHAN		; neu xuat hien ket qua 0  -> di toi label "CHAN"
	BR POS			; lap lai vong lap "POS" neu ket qua duong

NEG	ADD R2, R2, #2		; vong lap cho so am -> cong them 2 don vi
	BRP LE			; neu xuat hien ket qua duong -> di toi label "LE"
	BRZ CHAN		; neu xuat hien ket qua 0  -> di toi label "CHAN"
	BR NEG			; lap lai vong lap "NEG" neu ket qua am

LE	ADD R5, R5, #1		; bien dem so le tang len 1 don vi
	BR NEXT			; toi label "NEXT"

CHAN	ADD R6, R6, #1		; bien dem so chan tang len 1 don vi
	BR NEXT			;


NEXT	ADD R1, R1, #1		; dia chi o nho luu trong R1 tang them 1
	ADD R0, R0, #-1		; bien dem R0 giam di 1
	BRP LOOP		; neu chua du 6 gia tri thi quay lai "LOOP"

	LD R0, ASCII		; "ASCII" -> R0
	ADD R0, R0, R6		; dua R5 ve ma Ascii de xuat
	TRAP X21		; xuat
	LEA R0, MESG		;
	TRAP X22		; xuat chuoi trong "MESG"
	
	LD R0, DOWN		;
	TRAP X21		; xuat ky tu xuong dong

	LD R0, ASCII		;
	ADD R0, R0, R5		; dua R6 ve ma Ascii de xuat
	TRAP X21		; xuat
	LEA R0, MESG2		; 
	TRAP X22		; xuat chuoi trong "MESG2"
	HALT			; lenh ket thuc chuong trinh

MEM .FILL X3070			; dia chi o nho dau tien la x3070
ASCII .FILL X30			; hang so dua he thap phan ve ma Ascii
DOWN .FILL X0D			; ma Ascii ky tu xuong dong
MESG .STRINGZ " SO CHAN"	;		
MESG2 .STRINGZ " SO LE"		; chuoi

.END				; khong con lenh nao sau lenh nay
	
	