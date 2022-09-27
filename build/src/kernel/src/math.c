#include "math.h"



f64_t sin(f64_t x) {
	f64_t y;
	__asm__ __volatile__("fsin" : "=t"(y) : "0"(x));
	return y;
}

f64_t cos(f64_t x) {
	f64_t y;
	__asm__ __volatile__("fcos" : "=t"(y) : "0"(x));
	return y;
}

f64_t tan(f64_t x) {
	return sin(x) / cos(x);
}

f64_t sqrt(f64_t x) {
	f64_t y;
	__asm__ __volatile__("fsqrt" : "=t"(y) : "0"(x));
}

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