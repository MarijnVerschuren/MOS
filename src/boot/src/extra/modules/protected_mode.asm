[org 0x7c00]																; setting the address origin to 0x7c00 (offset that data has in a binary file)

; code
mov [BOOT_DISK], dl

CODE_SEG equ GDT_code - GDT_start											; offset of code descriptor definition 	(equ is used to set constants)
DATA_SEG equ GDT_data - GDT_start											; offset of data descriptor definition

cli																			; disable bios interupts
lgdt [GDT_descriptor]														; load GDT
; changing the last bit of cr0 to a "1" to enter 32 bit mode
mov eax, cr0																; load the value of cr0 because this register cant be edited directly
or eax, 1																	; edit the last bit of eax(cr0)
mov cr0, eax																; enter 32 bit mode
jmp CODE_SEG:protected_mode													; jump to the 32 bit code segment

[bits 32]
protected_mode:
	mov al, '0'																; put the character in the ax_low register
	mov ah, 0x0f															; put the color in the ax_high register
	mov [0xb8000], ax														; move the ax (color, char) register into the video memory
	jmp CODE_SEG:end


[bits 32]
end:																		; end of the program
	jmp $																	; infinite loop


; variables
GDT_start:																	; start of the global descryptor table
	GDT_null:																; empty GDT
		dq 0x0000000000000000
	GDT_code:																; code GDT
		dw 0xffff															; first 2 bytes of limit
		dw 0x0000															; first 2 bytes of base
		db 0x00																; next byte of base
		db 0b10011010														; ppt, type flags
		db 0b11001111														; other flags + last 4 bits of limit
		db 0x00																; last byte of base
	GDT_data:																; data GDT
		dw 0xffff															; first 2 bytes of limit
		dw 0x0000															; first 2 bytes of base
		db 0x00																; next byte of base
		db 0b10010010														; ppt, type flags
		db 0b11001111														; other flags + last 4 bits of limit
		db 0x00
GDT_end:

GDT_descriptor:
    dw GDT_end - GDT_start - 1
    dd GDT_start

BOOT_DISK: db 0x00

times 510-($-$$) db 0x00													; filling any unused space up to 510 bytes
db 0x55, 0xaa																; 55aa to declare sector bootable
