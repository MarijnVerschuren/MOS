mov al, 0x00		; start char
mov ah, 0x0e		; mov (0x0e) into ax-small (print operation)
print:				; printing a char
	int 0x10		; call bois interupt

	cmp al, 0xff
	je end			; break

	inc al 			; incrementing the char
	jmp print		; continue


end:
	jmp $			; endless loop to keep vm running


times 510-($-$$) db 0
db 0x55, 0xaa