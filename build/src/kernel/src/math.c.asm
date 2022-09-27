	.file	"math.c"
	.text
	.p2align 4,,15
	.globl	_sin
	.def	_sin;	.scl	2;	.type	32;	.endef
_sin:
LFB0:
	.cfi_startproc
	fldl	4(%esp)
/APP
 # 7 "C:\Users\marij\OneDrive\Documenten\GitHub\MOS\build\src\kernel\src\math.c" 1
	fsin
 # 0 "" 2
/NO_APP
	ret
	.cfi_endproc
LFE0:
	.p2align 4,,15
	.globl	_cos
	.def	_cos;	.scl	2;	.type	32;	.endef
_cos:
LFB1:
	.cfi_startproc
	fldl	4(%esp)
/APP
 # 13 "C:\Users\marij\OneDrive\Documenten\GitHub\MOS\build\src\kernel\src\math.c" 1
	fcos
 # 0 "" 2
/NO_APP
	ret
	.cfi_endproc
LFE1:
	.p2align 4,,15
	.globl	_tan
	.def	_tan;	.scl	2;	.type	32;	.endef
_tan:
LFB2:
	.cfi_startproc
	fldl	4(%esp)
	fld	%st(0)
/APP
 # 7 "C:\Users\marij\OneDrive\Documenten\GitHub\MOS\build\src\kernel\src\math.c" 1
	fsin
 # 0 "" 2
/NO_APP
	fxch	%st(1)
/APP
 # 13 "C:\Users\marij\OneDrive\Documenten\GitHub\MOS\build\src\kernel\src\math.c" 1
	fcos
 # 0 "" 2
/NO_APP
	fdivrp	%st, %st(1)
	ret
	.cfi_endproc
LFE2:
	.p2align 4,,15
	.globl	_sqrt
	.def	_sqrt;	.scl	2;	.type	32;	.endef
_sqrt:
LFB3:
	.cfi_startproc
	fldl	4(%esp)
/APP
 # 23 "C:\Users\marij\OneDrive\Documenten\GitHub\MOS\build\src\kernel\src\math.c" 1
	fsqrt
 # 0 "" 2
/NO_APP
	fstp	%st(0)
	flds	LC0
	ret
	.cfi_endproc
LFE3:
	.section .rdata,"dr"
	.align 4
LC0:
	.long	2143289344
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
