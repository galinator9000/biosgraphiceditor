bits 16

_EAX: dd 0x00000000
_EBX: dd 0x00000000
_ECX: dd 0x00000000
_EDX: dd 0x00000000
_ESI: dd 0x00000000
_EDI: dd 0x00000000
_ESP: dd 0x00000000
_EBP: dd 0x00000000
_EAX_Str: db 'EAX ',0
_EBX_Str: db 'EBX ',0
_ECX_Str: db 'ECX ',0
_EDX_Str: db 'EDX ',0
_ESI_Str: db 'ESI ',0
_EDI_Str: db 'EDI ',0
_ESP_Str: db 'ESP ',0
_EBP_Str: db 'EBP ',0
_ZF_Str: db 'ZF ',0
_CF_Str: db 'CF ',0
_OF_Str: db 'OF ',0
_DF_Str: db 'DF ',0

Debug:
	pushad
	
	mov [_EAX], dword eax
	mov [_EBX], dword ebx
	mov [_ECX], dword ecx
	mov [_EDX], dword edx
	mov [_ESI], dword esi
	mov [_EDI], dword edi
	mov [_ESP], dword esp
	mov [_EBP], dword ebp

	; EAX
	mov esi, dword _EAX_Str
	call Metin_Yazdir
	mov eax, dword [_EAX]
	call Debug_DWORD
	
	; EBX
	mov esi, dword _EBX_Str
	call Metin_Yazdir
	mov eax, dword [_EBX]
	call Debug_DWORD
	
	; ECX
	mov esi, dword _ECX_Str
	call Metin_Yazdir
	mov eax, dword [_ECX]
	call Debug_DWORD
	
	; EDX
	mov esi, dword _EDX_Str
	call Metin_Yazdir
	mov eax, dword [_EDX]
	call Debug_DWORD
	
	; ESI
	mov esi, dword _ESI_Str
	call Metin_Yazdir
	mov eax, dword [_ESI]
	call Debug_DWORD
	
	; EDI
	mov esi, dword _EDI_Str
	call Metin_Yazdir
	mov eax, dword [_EDI]
	call Debug_DWORD
	
	; ESP
	mov esi, dword _ESP_Str
	call Metin_Yazdir
	mov eax, dword [_ESP]
	call Debug_DWORD
	
	; EBP
	mov esi, dword _EBP_Str
	call Metin_Yazdir
	mov eax, dword [_EBP]
	call Debug_DWORD
	
	call Imlec_SatirAtla
	popad
	ret
	
Deger1: dd 0x00000000
Deger2:	db 0x00
Deger3: dd 0x00000000
Debug_DWORD:
	mov [Deger1], dword 0xF
	mov [Deger2], byte 0x0
	mov [Deger3], dword eax
	
	mov bl, 0x8
	call Imlec_Ileri
	
	Debug_DWORD_Dongu:
		mov eax, dword [Deger3]
		and eax, dword [Deger1]		
		
		cmp [Deger2], byte 0x0
		je Debug_DWORD_Atla
		cmp [Deger2], byte 0x1
		je Debug_DWORD_1
		cmp [Deger2], byte 0x2
		je Debug_DWORD_2
		cmp [Deger2], byte 0x3
		je Debug_DWORD_3
		cmp [Deger2], byte 0x4
		je Debug_DWORD_4
		cmp [Deger2], byte 0x5
		je Debug_DWORD_5
		cmp [Deger2], byte 0x6
		je Debug_DWORD_6
		cmp [Deger2], byte 0x7
		je Debug_DWORD_7
		
		Debug_DWORD_1:
			shr eax, 4d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_2:
			shr eax, 8d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_3:
			shr eax, 12d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_4:
			shr eax, 16d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_5:
			shr eax, 20d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_6:
			shr eax, 24d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_7:
			shr eax, 28d
			jmp Debug_DWORD_Atla
			
		Debug_DWORD_Atla:
			cmp eax, dword 0x9
			jle Debug_DWORD_9danKucuk
			jmp Debug_DWORD_9danBuyuk
			
			Debug_DWORD_9danKucuk:
				add eax, byte 0x30
				jmp Debug_DWORD_Son
			Debug_DWORD_9danBuyuk:
				add eax, byte 0x37
				jmp Debug_DWORD_Son
				
			Debug_DWORD_Son:
				call Karakter_Yazdir
				mov bl, 1
				call Imlec_Geri
				
				shl dword [Deger1], 4d
				inc byte [Deger2]
				
				cmp [Deger2], byte 0x8
				jne Debug_DWORD_Dongu
	call Imlec_SatirAtla
	ret
