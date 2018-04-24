bits 16

Panel_X: dw 0x0040	; Panelin başlangıç konumu.
Panel_Y: dw 0x0052
Secili_Renk: db 0x00

Klavye:
	mov ah, 0x00
	int 0x16
	ret

PikselKoy:
	mov bx, word 0x8
	mov cx, word [Panel_X]
	mov dx, word [Panel_Y]
	mov al, byte [Secili_Renk]
	call KareCiz
	
	ret

Renk_Degis:
	inc byte [Secili_Renk]
	and [Secili_Renk], byte 0xF
	
	mov cx, 0xA		; X Konum
	mov dx, 0x100	; Y Konum
	mov bx, 0x26	; Boyut
	mov al, byte [Secili_Renk]	; Renk
	call KareCiz
	
	ret

Editor:
	call Klavye		; Tuşa basılmışsa o tuşun ASCII karşılığı döner. Basılmamışsa 0 döner.
	
	cmp al, 0x00
	je Klavye_Atla
	
	cmp al, 'w'
	je Tus_W
	cmp al, 'a'
	je Tus_A
	cmp al, 's'
	je Tus_S
	cmp al, 'd'
	je Tus_D
	cmp al, 0x20
	je Tus_SPACE
	cmp al, 0x9
	je Tus_TAB
	
	jmp Klavye_Atla
	
	Tus_W:
		cmp [Panel_Y], word 0x53
		jle Klavye_Atla
		
		sub [Panel_Y], word 0x8
		
		jmp Klavye_Atla
		
	Tus_A:
		cmp [Panel_X], word 0x41
		jle Klavye_Atla
		
		sub [Panel_X], word 0x8
		
		jmp Klavye_Atla
		
	Tus_S:
		cmp [Panel_Y], word 0x1D2
		jge Klavye_Atla
		
		add [Panel_Y], word 0x8
		
		jmp Klavye_Atla
		
	Tus_D:
		cmp [Panel_X], word 0x261
		jge Klavye_Atla
		
		add [Panel_X], word 0x8
		
		jmp Klavye_Atla
		
	Tus_SPACE:
		call PikselKoy
		jmp Klavye_Atla
		
	Tus_TAB:
		call Renk_Degis
		jmp Klavye_Atla
	
	Klavye_Atla:
	jmp Editor
	jmp Dur
