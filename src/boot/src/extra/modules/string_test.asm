[org 0x7c00]	; setting the address origin to 0x7c00 (offset that data has in a binary file)

mov ah, 0x0e
mov bx, string
print:
	mov al, [bx]; loading next char

	cmp al, 0x00
	je end		; break loop when null termenator is hit

	int 0x10	; calling bois interupt
	inc bx		; incrementing string pointer

	jmp print	; continue


end:
	jmp $		; endless loop to keep vm running


string:			; lables can be used as a varable because strings are directly encoded into the binary file
	db "als je dit leest ben ik er waarschijnlijk nii meer", 0x0a, 0x00	; (0x10) is a newline


times 510-($-$$) db 0
db 0x55, 0xaa