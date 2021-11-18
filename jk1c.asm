ORG 0100H

	SETB P1.0
DONGU1:	
	JB P1.0,DONGU1
	 MOV R4,#0FFH
BASLANGIC:
	MOV DPTR,#NUM
        MOV A,#01H
	MOVC A,@A+DPTR; Dptr'ye deger atamasi
	MOV P3,#02H; Segmenti ekranda göster
	MOV P2,A
	ACALL GECIKME	
	
	MOV A,#02H
	MOVC A, @A+DPTR; Dptr'ye deger atamasi
	MOV P3,#08H; Segmenti ekranda göster
	MOV P2,A
	ACALL GECIKME
	
	MOV A,#00H
	MOVC A, @A+DPTR; Dptr'ye deger atamasi
	MOV P3,#01H; Segmenti ekranda göster
	MOV P2,A
	ACALL GECIKME
	
	MOV A,#03H
	MOVC A, @ A+DPTR; Dptr'ye deger atamasi
	MOV P3,#04H; Segmenti ekranda göster
	MOV P2,A
	ACALL GECIKME			
	DJNZ R4,BASLANGIC	

	 MOV P2,#00H;  Sıfır ekran için
	 ACALL GECIKME1 ;1 saniyelik bekleme için
	 SJMP DONGU1
GECIKME1:
	 MOV R7,#100D
	 MOV TMOD,#01H
	 L2:MOV TH0,#0DBH
	 MOV TL0,#0FFH
	 SETB TCON.4
	 L3:JNB TCON.5,L3
	 CLR TCON.4
	 CLR TCON.5
	 DJNZ R7,L2
	 RET
GECIKME:
	MOV R0, #200
	DJNZ R0, $
	RET
	
ORG 0000H

NUM:	DB  60H,1AH,0B0H,0AEH

END