	.file	"io.c"
	.globl	_HEX_DIGITS
	.section .rdata,"dr"
LC0:
	.ascii "0123456789abcdef\0"
	.data
	.align 4
_HEX_DIGITS:
	.long	LC0
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
