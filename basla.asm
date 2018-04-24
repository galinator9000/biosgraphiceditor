bits 16

Basla:
	; Başlık.
	call Imlec_Sifirla
	call Imlec_SatirAtla
	mov al, '_'
	mov cx, 27d
	call Karakter_Yazdir
	mov bl, 50d
	call Imlec_Ileri
	mov al, '_'
	mov cx, 30d
	call Karakter_Yazdir
	call Imlec_Sifirla
	call Imlec_SatirAtla
	call Imlec_SatirAtla
	mov al, '_'
	mov cx, 80d
	call Karakter_Yazdir
	
	call Imlec_SatirAtla
	mov al, '_'
	mov cx, 80d
	call Karakter_Yazdir
	
	; "BIOS Grafik Editoru" yazısı.
	call Imlec_Sifirla
	call Imlec_SatirAtla	
	mov bl, 0x1D
	call Imlec_Ileri
	
	mov esi, dword Baslik
	call Metin_Yazdir
	
	; Arayüz hazırlanır.
	mov cx, 0xA		; X Konum
	mov dx, 0x52	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x0		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0x52	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x1		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0x67	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x2		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0x67	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x3		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0x7C	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x4		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0x7C	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x5		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0x91	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x6		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0x91	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x7		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0xA6	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x8		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0xA6	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0x9		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0xBB	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0xA		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0xBB	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0xB		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0xD0	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0xC		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0xD0	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0xD		; Renk
	call KareCiz
	
	mov cx, 0xA		; X Konum
	mov dx, 0xE5	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0xE		; Renk
	call KareCiz
	
	mov cx, 0x1F	; X Konum
	mov dx, 0xE5	; Y Konum
	mov bx, 0x10	; Boyut
	mov al, 0xF		; Renk
	call KareCiz
	
	mov cx, 0x9		; X Konum
	mov dx, 0xFF	; Y Konum
	mov bx, 0x27	; Boyut
	mov al, 0xF		; Renk
	call KareCiz_Bos
	
	mov cx, 0xA		; X Konum
	mov dx, 0x100	; Y Konum
	mov bx, 0x26	; Boyut
	mov al, 0x0		; Renk
	call KareCiz
	
	mov cx, 0x40
	mov dx, 0x52
	mov ebx, dword 0x01880228
	mov al, 0xF
	call DortgenCiz
	
	jmp Editor
	jmp Dur

Baslik: db 'BIOS Grafik Editoru',0
