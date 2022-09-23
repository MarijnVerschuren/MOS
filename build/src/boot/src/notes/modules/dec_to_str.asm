[org 0x7c00]		; setting the address origin to 0x7c00 (offset that data has in a binary file)


mov ax, 32767		; max 32767 (ax is 16 bit) and interpreted as signed
call base_10
mov bx, buffer		; passing args to print via register
call print_num


jmp $				; end



base_10:
	mov bx, buffer
	mov cx, 0
	base_convert_loop:
		cmp ax, 10
		jl set_char

		sub ax, 10
		inc cx
		jmp base_convert_loop

	set_char:
		add al, 0x30
		mov byte [bx], al
		inc bx

		jcxz end_base_10

		mov ax, cx
		mov cx, 0
		jmp base_convert_loop

	end_base_10:
		ret

print_num:
	mov ah, 0x0e	; calls BOIS routine 0x0e (Teletype Output) which adds a single char to the text video buffer
	mov cx, 0
	count_loop:
		mov al, byte [bx]
		cmp al, 0x00
		je print_loop

		inc cx
		inc bx
		jmp count_loop

	print_loop:
		dec bx		; bx was still pointing to its termenation char
		mov al, byte [bx]

		int 0x10
		dec cx

		jcxz end_print
		jmp print_loop


	end_print:
		ret
		


buffer:
	times 128 db 0x00

times 510-($-$$) db 0
db 0x55, 0xaa