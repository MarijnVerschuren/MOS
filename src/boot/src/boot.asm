[org 0x7c00]																; setting the address origin to 0x7c00 (offset that data has in a binary file)
KERNEL_LOCATION equ 0x1000
CODE_SEG equ GDT_CODE - GDT_START
DATA_SEG equ GDT_DATA - GDT_START

mov [BOOT_DISK], dl															; storing the boot disk number in BOOT_DISK

xor ax, ax																	; clearing the ax register			: 0x0000
mov es, ax																	; pointer multiplier				: 0x0000
mov ds, ax																	; ser data sector pointer			: 0x0000
mov bp, 0x8000																; set base pointer
mov sp, bp																	; set stack pointer					: 0x8000

mov bx, KERNEL_LOCATION														; load location						: 0x1000
mov ah, 0x02																; disk read interrupt
mov al, 20																	; number of sectors to load			: 0x14
mov ch, 0																	; cylinder number					: 0x00
mov dh, 0																	; head number						: 0x00
mov cl, 2																	; number of first sector to load	: 0x02
mov dl, [BOOT_DISK]															; disk number
int 0x13																	; interrupt call

; TODO: error handling
; cmp al, [segmentCount]		; comparing the register that holds the segments loaded to its original value
; jne raise_segment_error		; raise segment error when the number of segments that have been loaded does not match with the number of segments required
; jc raise_disk_error			; raise disk error when carry flag is set (sign that "int 0x13" has failed)

mov ah, 0x00
mov ax, 0x03																; text mode interupt
int 0x10																	; interupt call (clears screen)

cli																			; disable bios interupts
lgdt [GDT_DESCRIOTOR]														; load GDT
; changing the last bit of cr0 to a "1" to enter 32 bit mode
mov eax, cr0																; load the value of cr0 because this register cant be edited directly
or eax, 1																	; edit the last bit of eax(cr0)
mov cr0, eax																; enter 32 bit mode
jmp CODE_SEG:START_KERNEL													; jump to the 32 bit code segment

jmp $																		; infinite loop

[bits 32]
START_KERNEL:
	mov ax, DATA_SEG														; set up segment register
		mov ds, ax															; set data segment
		mov ss, ax															; set stack segment
		mov es, ax															; set destination segment
		mov fs, ax
		mov gs, ax
		mov ebp, 0x90000													; set base pointer
		mov esp, ebp														; set stack pointer

	jmp KERNEL_LOCATION														; jump to the kernel


; variables
GDT_START:																	; start of the global descryptor table
	GDT_NULL:																; empty GDT
		dq 0x0000000000000000
	GDT_CODE:																; code GDT
		dw 0xffff															; first 2 bytes of limit
		dw 0x0000															; first 2 bytes of base
		db 0x00																; next byte of base
		db 0b10011010														; ppt, type flags
		db 0b11001111														; other flags + last 4 bits of limit
		db 0x00																; last byte of base
	GDT_DATA:																; data GDT
		dw 0xffff															; first 2 bytes of limit
		dw 0x0000															; first 2 bytes of base
		db 0x00																; next byte of base
		db 0b10010010														; ppt, type flags
		db 0b11001111														; other flags + last 4 bits of limit
		db 0x00
GDT_END:

GDT_DESCRIOTOR:
    dw GDT_END - GDT_START - 1
    dd GDT_START

BOOT_DISK: db 0x00

times 510-($-$$) db 0x00													; filling any unused space up to 510 bytes
db 0x55, 0xaa																; 55aa to declare sector bootable
