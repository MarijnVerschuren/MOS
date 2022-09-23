[org 0x7c00]					; setting the address origin to 0x7c00 (offset that data has in a binary file)

; setup
mov [diskNum], dl				; storing the boot disk number in the "diskNum" variable
jmp main						; jump to the main function (entry point)


; functions
print:
	mov ah, 0x0e				; bois interrupt for printing
print_loop:
	mov al, [bx]				; load next char into the al register
	cmp al, 0x00				; comparing the current char to 0x00
	je print_end				; end the function when the char is 0x00
	int 0x10					; calling the bois interrupt
	inc bx						; incrementing the pointer
	jmp print_loop				; resetting the loop
print_end:
	ret


raise_disk_error:
	mov bx, diskError
	call print
	jmp end


raise_segment_error:
	mov bx, segmentError
	call print
	jmp end


load_drive_sectors:				; CHS addressing is used to read sectors from the hard drive (C: cilinder (track holding multiple sectors)[starts at 0], H: head (read head)[starts at 0], S: sector (drive sector)[starts at 1])
	mov ax, 0x00				; value has to be put into ax first because there are no cpu instructions that load a value into es directly
	mov es, ax					; multiplier to access higher memory locations (for higher pointers than 16 bit)[ es * 16 + bx = ptr ]
	mov ah, 0x02				; bois interrupt for loading sectors
	mov al, [segmentCount]		; number of sectors to load
	mov ch, 0					; cylinder number
	mov cl, 2					; number of first sector to load
	mov dh, 0					; head number
	mov dl, [diskNum]			; disk number
	mov bx, 0x7e00				; poiter to where the data should be loaded

	int 0x13					; calling the bois interrupt

	cmp al, [segmentCount]		; comparing the register that holds the segments loaded to its original value
	jne raise_segment_error		; raise segment error when the number of segments that have been loaded does not match with the number of segments required
	jc raise_disk_error			; raise disk error when carry flag is set (sign that "int 0x13" has failed)

	ret


main:
	call load_drive_sectors

	mov bx, successMsg			; address for the success message
	call print


end:							; end of the program
	jmp $						; infinite loop


; variables
diskNum:		db 0x00			; defining one byte to store the boot disk number
segmentCount:	db 0x01			; number of segments that have to be loaded
diskError:		db 'error disk could not be read...', 0x0a, 0x0d, 0x00				; 0x0d returns the char offset to 0 (for after readline)
segmentError:	db 'error incorrect number of segments read...', 0x0a, 0x0d, 0x00	; ^

times 510-($-$$) db 0x00		; filling any unused space up to 512 bytes
db 0x55, 0xaa					; 55aa to declare sector bootable


sector_2:						; start of sector 2

successMsg:		db 'successfully read the disk...', 0x0a, 0x0d, 0x00

times 512-($-sector_2) db 0x00	; padding up the rest of the sector



; TODO: data segmentation