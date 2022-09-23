	.file	"kernel.c"
	.text
	.p2align 4,,15
	.globl	_print
	.def	_print;	.scl	2;	.type	32;	.endef
_print:
LFB2:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	movl	16(%esp), %ecx
	movl	12(%esp), %ebx
	movzbl	20(%esp), %esi
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	je	L1
	movl	(%ebx), %eax
	.p2align 4,,10
L3:
	movb	%dl, (%eax)
	movl	(%ebx), %eax
	movl	%esi, %edx
	addl	$1, %ecx
	movb	%dl, 1(%eax)
	movl	(%ebx), %eax
	addl	$2, %eax
	movl	%eax, (%ebx)
	movzbl	(%ecx), %edx
	testb	%dl, %dl
	jne	L3
L1:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2:
	.p2align 4,,15
	.globl	_kernel
	.def	_kernel;	.scl	2;	.type	32;	.endef
_kernel:
LFB3:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	$11822, %eax
	movl	$80, %edx
	movl	$753664, %ecx
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	movw	%ax, 13(%esp)
	leal	1(%esp), %eax
	movl	$1852404304, 1(%esp)
	movl	$1702109300, 5(%esp)
	movl	$773878904, 9(%esp)
	movb	$0, 15(%esp)
	.p2align 4,,10
L10:
	addl	$1, %eax
	movb	%dl, (%ecx)
	movb	$15, 1(%ecx)
	movzbl	(%eax), %edx
	addl	$2, %ecx
	testb	%dl, %dl
	jne	L10
	leal	-753664(%ecx), %ebx
	movl	$1717986919, %edx
	movl	%ebx, %eax
	imull	%edx
	movl	%ebx, %eax
	sarl	$31, %eax
	sarl	$6, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$5, %eax
	subl	%ebx, %eax
	leal	160(%ecx,%eax), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
L11:
	movb	%al, (%ecx,%eax,2)
	movb	%al, 1(%ecx,%eax,2)
	addl	$1, %eax
	cmpl	$256, %eax
	jne	L11
	leal	-753152(%ecx), %ebx
	movl	$1717986919, %edx
	movl	%ebx, %eax
	imull	%edx
	movl	%ebx, %eax
	sarl	$31, %eax
	sarl	$6, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$5, %eax
	subl	%ebx, %eax
	leal	672(%ecx,%eax), %edx
	xorl	%eax, %eax
	.p2align 4,,10
L12:
	movb	%al, (%edx,%eax,2)
	movb	$15, 1(%edx,%eax,2)
	addl	$1, %eax
	cmpl	$256, %eax
	jne	L12
	addl	$16, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE3:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
