section .text
	[bits 32]
	[extern kernel]	; external reference to the kernel function

	call kernel		; call the kernel
	jmp $				; infinite loop