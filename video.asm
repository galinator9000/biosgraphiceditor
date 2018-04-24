bits 16

Imlec_Sifirla:
	mov ah, 0x2
	mov bh, 0
	xor dh, dh
	xor dl, dl
	int 0x10	
	ret

Imlec_Konum:
	mov ah, 0x3
	mov bh, 0
	int 0x10
	ret

Imlec_Ileri:
	call Imlec_Konum
	add dl, bl
	
	mov ah, 0x2
	mov bh, 0
	int 0x10
	ret
	
Imlec_Geri:
	call Imlec_Konum
	sub dl, bl
	
	mov ah, 0x2
	mov bh, 0
	int 0x10
	ret

Imlec_SatirAtla:
	call Imlec_Konum
	xor dl, dl
	inc dh
	
	mov ah, 0x2
	mov bh, 0
	int 0x10
	ret

Metin_Yazdir:
	Metin_Yazdir_Dongu:
		mov ah, 0xA
		mov bh, 0
		mov bl, 0x07
		mov cx, 1
		mov bl, 0x07
		mov al, byte [esi]
		
		cmp al, 0x0
		je Metin_Yazdir_DonguB
		
		int 0x10
		inc esi
		
		mov bl, 1
		call Imlec_Ileri
		
		jmp Metin_Yazdir_Dongu
		Metin_Yazdir_DonguB:
			ret
			
Karakter_Yazdir:
	mov ah, 0xA
	mov bh, 0
	mov bl, 0x07
	int 0x10
	ret

Hedef_X: dw 0x0000
Hedef_Y: dw 0x0000
Konum_X: dw 0x0000
Konum_Y: dw 0x0000

KareCiz:	; CX : X, DX : Y
	mov [Konum_X], word cx
	mov [Konum_Y], word dx

	add cx, bx
	add dx, bx
	mov [Hedef_X], word cx
	mov [Hedef_Y], word dx
	
	sub cx, bx
	sub dx, bx
	
	KareCizDongu:
		mov ah, 0xC
		mov bh, 0x0
		int 0x10
		
		inc cx
		
		cmp cx, word [Hedef_X]
		jne KareCizDongu
		
		mov cx, word [Konum_X]
		inc dx
		cmp dx, word [Hedef_Y]
		jne KareCizDongu
	ret

KareCiz_Bos:	; CX : X, DX : Y
	mov [Konum_X], word cx
	mov [Konum_Y], word dx

	add cx, bx
	add dx, bx
	mov [Hedef_X], word cx
	mov [Hedef_Y], word dx
	
	sub cx, bx
	sub dx, bx
	
	KareCiz_BosDongu_1:
		mov ah, 0xC
		mov bh, 0x0
		int 0x10
		
		inc cx
		
		cmp cx, word [Hedef_X]
		jne KareCiz_BosDongu_1
		
	KareCiz_BosDongu_2:
		mov ah, 0xC
		mov bh, 0x0
		int 0x10
		
		inc dx
		
		cmp dx, word [Hedef_Y]
		jne KareCiz_BosDongu_2
		
	KareCiz_BosDongu_3:
		mov ah, 0xC
		mov bh, 0x0
		int 0x10
		
		dec cx
		
		cmp cx, word [Konum_X]
		jne KareCiz_BosDongu_3
		
	KareCiz_BosDongu_4:
		mov ah, 0xC
		mov bh, 0x0
		int 0x10
		
		dec dx
		
		cmp dx, word [Konum_Y]
		jne KareCiz_BosDongu_4
	ret

DortgenXY: dd 0x00000000

DortgenCiz:	; CX : X, DX : Y
	mov [Konum_X], word cx
	mov [Konum_Y], word dx
	mov [DortgenXY], dword ebx

	add cx, bx
	shr ebx, byte 0x10
	add dx, bx
	mov [Hedef_X], word cx
	mov [Hedef_Y], word dx
	
	mov ebx, dword [DortgenXY]
		
	sub cx, bx
	shr ebx, byte 0x10
	sub dx, bx
	
	DortgenCizDongu:
		mov ah, 0xC
		mov bh, 0x0
		int 0x10
		
		inc cx
		
		cmp cx, word [Hedef_X]
		jne DortgenCizDongu
		
		mov cx, word [Konum_X]
		inc dx
		cmp dx, word [Hedef_Y]
		jne DortgenCizDongu
	ret
