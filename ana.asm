org 0x7C00
bits 16

jmp 0x0:Onyukle

Onyukle:
	mov [OnyuklenenSurucu], byte dl
	sti
	
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	xor esi, esi
	xor edi, edi
	xor esp, esp
	xor ebp, ebp
	
	mov esp, dword 0x9FFFF
	mov ebp, dword 0x9FFFF
	
	xor ah, ah
	mov al, byte 0x12
	int 0x10
	
	mov dl, [OnyuklenenSurucu]
	xor ah, ah
	int 0x13
	;~ jc Hata_Disk
	;~ cmp ah, 0x0
	;~ jne Hata_Disk
	
	mov ah, 0x2
	mov al, 60d
	mov ch, 0
	mov cl, 0x2
	mov dh, 0
	mov dl, [OnyuklenenSurucu]
	mov bx, word Onyukle2
	int 0x13
	;~ jc Hata_Disk
	;~ cmp ah, 0x0
	;~ jne Hata_Disk
	
	jmp 0x0:Onyukle2
Dur:
	cli
	hlt
	jmp Dur
	
	Hata_Disk:
		mov ah, 0xA
		mov al, 'D'
		mov bh, 0
		mov bl, 0x07
		mov cx, 0x8
		int 0x10
		jmp Dur
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
OnyuklenenSurucu: db 0x0
times 446 - ($ - $$) db 0x0
;; VBR Kaydı: 80 20 21 00 0B FE FF AC 00 08 00 00 00 D0 E6 00
dd 0x00212080
dd 0xACFFFE0B
dd 0x00000800
dd 0x00E6D000
times 48d db 0x0
db 0x55
db 0xAA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MBR Dışı - 0x7E00
Onyukle2:
	%include "basla.asm"
	jmp 0x0:Basla
	jmp Dur
%include "editor.asm"
%include "video.asm"
%include "debug.asm"
