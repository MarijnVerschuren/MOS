global sin


; [sin]  (rad)
; EAX (x-axis)
; EBX (y-axis)
sin:
	push	ebp
	mov		ebp, esp
	fld		long [eax]				; st(0) = EAX
	fsin							; st(0) = sin(EAX)  (angle is in radians)
	fstp	long [ebx]				; EBX = sin(EAX)
	pop		ebp
	ret