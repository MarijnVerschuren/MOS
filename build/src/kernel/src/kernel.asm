section .text
	[bits 32]
	[extern _kernel]	; external reference to the kernel function

	call _kernel		; call the kernel
	jmp $				; infinite loop