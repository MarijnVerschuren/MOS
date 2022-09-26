	.file	"kernel.c"
	.text
	.p2align 4,,15
	.globl	_put_pix
	.def	_put_pix;	.scl	2;	.type	32;	.endef
_put_pix:
LFB0:
	.cfi_startproc
	movl	4(%esp), %eax
	movl	8(%esp), %ecx
	movl	(%eax), %edx
	movb	%cl, (%edx)
	addl	$1, (%eax)
	ret
	.cfi_endproc
LFE0:
	.p2align 4,,15
	.globl	_kernel
	.def	_kernel;	.scl	2;	.type	32;	.endef
_kernel:
LFB1:
	.cfi_startproc
	movl	$655360, %eax
	.p2align 4,,10
L3:
	movb	%al, (%eax)
	addl	$1, %eax
	cmpl	$719360, %eax
	jne	L3
	rep ret
	.cfi_endproc
LFE1:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
