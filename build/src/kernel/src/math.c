#include "math.h"




/*
;section .text
;	[bits 32]
;	global _sin
;	; [sin]  (rad)
;	; EAX (x-axis)
;	; EBX (y-axis)
;	_sin:
;		push	ebp
;		mov		ebp, esp
;		fld		qword [eax]				; st(0) = EAX
;		fsin							; st(0) = sin(EAX)  (angle is in radians)
;		fstp	qword [ebx]				; EBX = sin(EAX)
;		pop		ebp
;		ret
*/