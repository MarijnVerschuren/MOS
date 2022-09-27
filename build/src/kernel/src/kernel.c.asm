	.file	"kernel.c"
	.section .rdata,"dr"
LC1:
	.ascii "Hello World!\0"
	.text
	.p2align 4,,15
	.globl	_kernel
	.def	_kernel;	.scl	2;	.type	32;	.endef
_kernel:
LFB0:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	subl	$52, %esp
	.cfi_def_cfa_offset 64
	leal	44(%esp), %esi
	movl	$8, 4(%esp)
	movl	$655360, 44(%esp)
	movl	%esi, (%esp)
	call	_new_line
	xorl	%eax, %eax
	.p2align 4,,10
L2:
	movl	%eax, 4(%esp)
	addl	$1, %ebx
	movl	$15, 12(%esp)
	movl	$2, 8(%esp)
	movl	%esi, (%esp)
	call	_put_char
	cmpb	$-128, %bl
	movsbl	%bl, %eax
	jne	L2
	movl	%esi, (%esp)
	movl	$16, 4(%esp)
	call	_new_line
	movl	%esi, (%esp)
	movl	$1413754136, 4(%esp)
	movl	$1074340347, 8(%esp)
	call	_print_hex_64
	movl	%esi, (%esp)
	movl	$16, 4(%esp)
	call	_new_line
	movl	$1413754136, (%esp)
	movl	$1073291771, 4(%esp)
	call	_sin
	fstpl	24(%esp)
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_print_hex_64
	movl	%esi, (%esp)
	movl	$16, 4(%esp)
	call	_new_line
	movl	$1413754136, (%esp)
	movl	$1073291771, 4(%esp)
	call	_cos
	fstpl	24(%esp)
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_print_hex_64
	movl	%esi, (%esp)
	movl	$16, 4(%esp)
	call	_new_line
	movl	$1413754136, (%esp)
	movl	$1073291771, 4(%esp)
	call	_tan
	fstpl	24(%esp)
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_print_hex_64
	movl	%esi, (%esp)
	movl	$16, 4(%esp)
	call	_new_line
	movl	%esi, (%esp)
	movl	$15, 12(%esp)
	movl	$2, 8(%esp)
	movl	$LC1, 4(%esp)
	call	_print
	addl	$52, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE0:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_new_line;	.scl	2;	.type	32;	.endef
	.def	_put_char;	.scl	2;	.type	32;	.endef
	.def	_print_hex_64;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_tan;	.scl	2;	.type	32;	.endef
	.def	_print;	.scl	2;	.type	32;	.endef
