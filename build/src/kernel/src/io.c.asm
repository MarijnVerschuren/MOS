	.file	"io.c"
	.text
	.p2align 4,,15
	.globl	_put_char
	.def	_put_char;	.scl	2;	.type	32;	.endef
_put_char:
LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movzbl	52(%esp), %eax
	movl	48(%esp), %ebx
	movzbl	60(%esp), %esi
	movl	_PIXEL_CHARSET+4(,%eax,8), %edx
	movl	_PIXEL_CHARSET(,%eax,8), %eax
	movb	%al, 4(%esp)
	movl	%eax, 8(%esp)
	movl	(%ebx), %eax
	movl	%edx, 12(%esp)
	movl	$1717986919, %edx
	leal	-655360(%eax), %edi
	movl	%eax, %ebp
	movl	%eax, 16(%esp)
	movl	%edi, %eax
	imull	%edx
	movl	%edi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	movl	%edx, %ecx
	movzbl	56(%esp), %edx
	subl	%eax, %ecx
	leal	(%ecx,%ecx,4), %eax
	sall	$6, %eax
	subl	%eax, %edi
	movl	$320, %eax
	subl	%edi, %eax
	movl	%edi, %ecx
	movzbl	4(%esp), %edi
	leal	(%edi,%edx), %ebx
	movl	%ebx, %edi
	movzwl	%ax, %ebx
	cmpl	%ebx, %edi
	movl	%ebx, 20(%esp)
	jbe	L2
	movzbl	4(%esp), %edx
	cmpw	%dx, %ax
	jbe	L2
	leal	-1(%ebp,%ebx), %ebp
L3:
	movl	48(%esp), %eax
	movl	12(%esp), %edx
	movl	%ebp, (%eax)
	movl	8(%esp), %eax
	shrdl	$8, %edx, %eax
	shrl	$8, %edx
	movl	%edx, %edi
	orl	%eax, %edi
	je	L1
	movzbl	4(%esp), %edi
	movl	%edi, %ebx
	cmpb	$8, %bl
	ja	L70
L5:
	movl	%edi, %ecx
	movzbl	%cl, %ebx
	movl	$320, %ecx
	subl	%ebx, %ecx
	movl	%ebx, 4(%esp)
	movl	%edi, %ebx
	testb	%bl, %bl
	je	L1
	leal	-1(%edi), %ebp
	movl	%ebp, %ebx
	movzbl	%bl, %ebp
	leal	1(%ecx,%ebp), %ebx
	movl	%ebx, 8(%esp)
	movl	16(%esp), %ebx
	movb	$7, 16(%esp)
	addl	$6, %ebx
	.p2align 4,,10
L6:
	movl	%eax, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	L8
	movl	%esi, %ecx
	movb	%cl, -6(%ebx)
L8:
	movl	%edi, %ecx
	cmpb	$1, %cl
	je	L9
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	L10
	movl	%esi, %ecx
	movb	%cl, -5(%ebx)
L10:
	movl	%edi, %ecx
	cmpb	$2, %cl
	je	L9
	movl	%eax, %ecx
	andl	$4, %ecx
	testl	%ecx, %ecx
	je	L11
	movl	%esi, %ecx
	movb	%cl, -4(%ebx)
L11:
	movl	%edi, %ecx
	cmpb	$3, %cl
	je	L9
	movl	%eax, %ecx
	andl	$8, %ecx
	testl	%ecx, %ecx
	je	L12
	movl	%esi, %ecx
	movb	%cl, -3(%ebx)
L12:
	movl	%edi, %ecx
	cmpb	$4, %cl
	je	L9
	movl	%eax, %ecx
	andl	$16, %ecx
	testl	%ecx, %ecx
	je	L13
	movl	%esi, %ecx
	movb	%cl, -2(%ebx)
L13:
	movl	%edi, %ecx
	cmpb	$5, %cl
	je	L9
	movl	%eax, %ecx
	andl	$32, %ecx
	testl	%ecx, %ecx
	je	L14
	movl	%esi, %ecx
	movb	%cl, -1(%ebx)
L14:
	movl	%edi, %ecx
	cmpb	$6, %cl
	je	L9
	movl	%eax, %ecx
	andl	$64, %ecx
	testl	%ecx, %ecx
	je	L15
	movl	%esi, %ecx
	movb	%cl, (%ebx)
L15:
	movl	%edi, %ecx
	leal	1(%ebx), %ebp
	cmpb	$8, %cl
	jne	L9
	movl	%eax, %ecx
	andl	$128, %ecx
	testl	%ecx, %ecx
	je	L9
	movl	%esi, %ecx
	movb	%cl, 0(%ebp)
L9:
	movzbl	4(%esp), %ecx
	shrdl	%cl, %edx, %eax
	shrl	%cl, %edx
	testb	$32, %cl
	je	L71
	movl	%edx, %eax
	xorl	%edx, %edx
L71:
	addl	8(%esp), %ebx
	subb	$1, 16(%esp)
	jne	L6
L1:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L2:
	.cfi_restore_state
	movl	16(%esp), %edx
	movl	%edi, %ebx
	leal	(%edx,%edi), %ebp
	movl	$1717986919, %edx
	leal	-655360(%ebp), %edi
	movl	%edi, %eax
	imull	%edx
	movl	%edi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$6, %eax
	subl	%eax, %edi
	cmpl	%edi, %ecx
	jle	L3
	movl	16(%esp), %edx
	movl	20(%esp), %eax
	movl	%ebx, %ebp
	leal	2560(%edx,%eax), %eax
	movl	%eax, 16(%esp)
	addl	%eax, %ebp
	jmp	L3
	.p2align 4,,10
L70:
	movl	$8, %edi
	jmp	L5
	.cfi_endproc
LFE3:
	.p2align 4,,15
	.globl	_print
	.def	_print;	.scl	2;	.type	32;	.endef
_print:
LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movzbl	60(%esp), %eax
	movb	%al, 23(%esp)
	movzbl	56(%esp), %eax
	movl	%eax, 16(%esp)
L73:
	movl	52(%esp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L143
L89:
	movl	_PIXEL_CHARSET+4(,%eax,8), %edx
	movl	_PIXEL_CHARSET(,%eax,8), %eax
	addl	$1, 52(%esp)
	movl	%eax, %ebx
	movl	%eax, (%esp)
	movb	%al, 22(%esp)
	movl	48(%esp), %eax
	movl	%edx, 4(%esp)
	movl	(%eax), %ebp
	movl	$1717986919, %eax
	leal	-655360(%ebp), %esi
	imull	%esi
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$6, %eax
	subl	%eax, %esi
	movl	$320, %eax
	subl	%esi, %eax
	movl	%esi, %ecx
	movzbl	%bl, %esi
	movl	%esi, %edx
	addl	16(%esp), %esi
	movzwl	%ax, %edi
	movl	%edi, 12(%esp)
	cmpl	%edi, %esi
	jbe	L74
	cmpw	%dx, %ax
	jbe	L74
	leal	-1(%ebp,%edi), %esi
L75:
	movl	48(%esp), %eax
	movl	4(%esp), %edx
	movl	%esi, (%eax)
	movl	(%esp), %eax
	shrdl	$8, %edx, %eax
	shrl	$8, %edx
	movl	%edx, %esi
	orl	%eax, %esi
	je	L73
	movzbl	22(%esp), %edi
	movl	%edi, %ebx
	cmpb	$8, %bl
	jbe	L77
	movl	$8, %edi
L77:
	movl	%edi, %ebx
	movl	$320, %ecx
	movzbl	%bl, %ebx
	subl	%ebx, %ecx
	movl	%ebx, (%esp)
	movl	%edi, %ebx
	testb	%bl, %bl
	je	L73
	leal	-1(%edi), %esi
	movb	$7, 22(%esp)
	movl	%esi, %ebx
	movzbl	%bl, %esi
	leal	1(%ecx,%esi), %ebx
	leal	6(%ebp), %esi
	movl	%ebx, 12(%esp)
	movl	%edi, %ebx
	movzbl	23(%esp), %edi
	.p2align 4,,10
L78:
	movl	%eax, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	L80
	movl	%edi, %ecx
	movb	%cl, -6(%esi)
L80:
	cmpb	$1, %bl
	je	L81
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	L82
	movl	%edi, %ecx
	movb	%cl, -5(%esi)
L82:
	cmpb	$2, %bl
	je	L81
	movl	%eax, %ecx
	andl	$4, %ecx
	testl	%ecx, %ecx
	je	L83
	movl	%edi, %ecx
	movb	%cl, -4(%esi)
L83:
	cmpb	$3, %bl
	je	L81
	movl	%eax, %ecx
	andl	$8, %ecx
	testl	%ecx, %ecx
	je	L84
	movl	%edi, %ecx
	movb	%cl, -3(%esi)
L84:
	cmpb	$4, %bl
	je	L81
	movl	%eax, %ecx
	andl	$16, %ecx
	testl	%ecx, %ecx
	je	L85
	movl	%edi, %ecx
	movb	%cl, -2(%esi)
L85:
	cmpb	$5, %bl
	je	L81
	movl	%eax, %ecx
	andl	$32, %ecx
	testl	%ecx, %ecx
	je	L86
	movl	%edi, %ecx
	movb	%cl, -1(%esi)
L86:
	cmpb	$6, %bl
	je	L81
	movl	%eax, %ecx
	andl	$64, %ecx
	testl	%ecx, %ecx
	je	L87
	movl	%edi, %ecx
	movb	%cl, (%esi)
L87:
	cmpb	$8, %bl
	leal	1(%esi), %ebp
	jne	L81
	movl	%eax, %ecx
	andl	$128, %ecx
	testl	%ecx, %ecx
	je	L81
	movl	%edi, %ecx
	movb	%cl, 0(%ebp)
L81:
	movzbl	(%esp), %ecx
	shrdl	%cl, %edx, %eax
	shrl	%cl, %edx
	testb	$32, %cl
	je	L144
	movl	%edx, %eax
	xorl	%edx, %edx
L144:
	addl	12(%esp), %esi
	subb	$1, 22(%esp)
	jne	L78
	movl	52(%esp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L89
L143:
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L74:
	.cfi_restore_state
	movl	%esi, %ebx
	leal	0(%ebp,%esi), %esi
	movl	$1717986919, %eax
	leal	-655360(%esi), %edi
	imull	%edi
	movl	%edi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$6, %eax
	subl	%eax, %edi
	cmpl	%edi, %ecx
	jle	L75
	movl	12(%esp), %eax
	movl	%ebx, %esi
	leal	2560(%ebp,%eax), %ebp
	addl	%ebp, %esi
	jmp	L75
	.cfi_endproc
LFE4:
	.p2align 4,,15
	.globl	_new_line
	.def	_new_line;	.scl	2;	.type	32;	.endef
_new_line:
LFB5:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	movl	$1717986919, %edx
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %edi
	movzbl	20(%esp), %eax
	movl	(%edi), %esi
	leal	(%eax,%eax,4), %ecx
	leal	-655360(%esi), %ebx
	sall	$6, %ecx
	movl	%ebx, %eax
	imull	%edx
	movl	%ebx, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$6, %eax
	subl	%eax, %ebx
	subl	%ebx, %ecx
	addl	%ecx, %esi
	movl	%esi, (%edi)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE5:
	.p2align 4,,15
	.globl	_print_hex_8
	.def	_print_hex_8;	.scl	2;	.type	32;	.endef
_print_hex_8:
LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$36, %esp
	.cfi_def_cfa_offset 56
	movl	_HEX_DIGITS, %edi
	movl	60(%esp), %eax
	movl	%edi, 8(%esp)
	movl	%eax, 24(%esp)
	shrb	$4, %al
	movzbl	%al, %eax
	movzbl	(%edi,%eax), %eax
	movl	56(%esp), %edi
	movl	(%edi), %ebp
	movl	_PIXEL_CHARSET+4(,%eax,8), %edx
	movl	_PIXEL_CHARSET(,%eax,8), %eax
	leal	-655360(%ebp), %ecx
	movb	%al, 4(%esp)
	movl	%eax, 16(%esp)
	movl	%edx, 20(%esp)
	movl	%ecx, %eax
	movl	$1717986919, %edx
	imull	%edx
	movl	%ecx, %eax
	movzbl	4(%esp), %esi
	sarl	$31, %eax
	sarl	$7, %edx
	movl	%edx, %ebx
	movl	%esi, %edx
	addl	$2, %esi
	subl	%eax, %ebx
	leal	(%ebx,%ebx,4), %eax
	movl	%ecx, %ebx
	sall	$6, %eax
	subl	%eax, %ebx
	movl	$320, %eax
	subl	%ebx, %eax
	movzwl	%ax, %edi
	cmpl	%edi, %esi
	movl	%edi, 28(%esp)
	jbe	L148
	cmpw	%dx, %ax
	leal	-1(%ebp,%edi), %ecx
	jbe	L148
L149:
	movl	56(%esp), %eax
	movl	20(%esp), %edx
	movl	%ecx, (%eax)
	movl	16(%esp), %eax
	shrdl	$8, %edx, %eax
	shrl	$8, %edx
	movl	%edx, %esi
	orl	%eax, %esi
	je	L150
	movzbl	4(%esp), %esi
	movl	%esi, %ebx
	cmpb	$8, %bl
	ja	L280
L151:
	movl	%esi, %ebx
	movl	$320, %ecx
	movzbl	%bl, %edi
	subl	%edi, %ecx
	testb	%bl, %bl
	movl	%edi, 4(%esp)
	je	L152
	leal	-1(%esi), %ebx
	movb	$7, 8(%esp)
	movzbl	%bl, %ebx
	leal	1(%ecx,%ebx), %edi
	leal	6(%ebp), %ebx
	.p2align 4,,10
L153:
	movl	%eax, %ecx
	andl	$1, %ecx
	testl	%ecx, %ecx
	je	L155
	movb	$15, -6(%ebx)
L155:
	movl	%esi, %ecx
	cmpb	$1, %cl
	je	L156
	movl	%eax, %ecx
	andl	$2, %ecx
	testl	%ecx, %ecx
	je	L157
	movb	$15, -5(%ebx)
L157:
	movl	%esi, %ecx
	cmpb	$2, %cl
	je	L156
	movl	%eax, %ecx
	andl	$4, %ecx
	testl	%ecx, %ecx
	je	L158
	movb	$15, -4(%ebx)
L158:
	movl	%esi, %ecx
	cmpb	$3, %cl
	je	L156
	movl	%eax, %ecx
	andl	$8, %ecx
	testl	%ecx, %ecx
	je	L159
	movb	$15, -3(%ebx)
L159:
	movl	%esi, %ecx
	cmpb	$4, %cl
	je	L156
	movl	%eax, %ecx
	andl	$16, %ecx
	testl	%ecx, %ecx
	je	L160
	movb	$15, -2(%ebx)
L160:
	movl	%esi, %ecx
	cmpb	$5, %cl
	je	L156
	movl	%eax, %ecx
	andl	$32, %ecx
	testl	%ecx, %ecx
	je	L161
	movb	$15, -1(%ebx)
L161:
	movl	%esi, %ecx
	cmpb	$6, %cl
	je	L156
	movl	%eax, %ecx
	andl	$64, %ecx
	testl	%ecx, %ecx
	je	L162
	movb	$15, (%ebx)
L162:
	movl	%esi, %ecx
	leal	1(%ebx), %ebp
	cmpb	$8, %cl
	jne	L156
	movl	%eax, %ecx
	andl	$128, %ecx
	testl	%ecx, %ecx
	je	L156
	movb	$15, 0(%ebp)
L156:
	movzbl	4(%esp), %ecx
	shrdl	%cl, %edx, %eax
	shrl	%cl, %edx
	testb	$32, %cl
	je	L283
	movl	%edx, %eax
	xorl	%edx, %edx
L283:
	addl	%edi, %ebx
	subb	$1, 8(%esp)
	jne	L153
	movl	_HEX_DIGITS, %eax
	movl	%eax, 8(%esp)
L152:
	movl	56(%esp), %eax
	movl	(%eax), %ecx
L150:
	movl	24(%esp), %eax
	movl	8(%esp), %edi
	leal	-655360(%ecx), %esi
	andl	$15, %eax
	movzbl	(%edi,%eax), %eax
	movl	_PIXEL_CHARSET+4(,%eax,8), %edx
	movl	_PIXEL_CHARSET(,%eax,8), %eax
	movl	%edx, 12(%esp)
	movb	%al, 4(%esp)
	movl	$1717986919, %edx
	movl	%eax, 8(%esp)
	movl	%esi, %eax
	imull	%edx
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	movl	%edx, %ebx
	subl	%eax, %ebx
	leal	(%ebx,%ebx,4), %eax
	movl	%esi, %ebx
	movzbl	4(%esp), %esi
	sall	$6, %eax
	subl	%eax, %ebx
	movl	$320, %eax
	subl	%ebx, %eax
	movl	%esi, %edx
	addl	$2, %esi
	movzwl	%ax, %edi
	cmpl	%edi, %esi
	movl	%edi, 16(%esp)
	jbe	L164
	cmpw	%dx, %ax
	leal	-1(%ecx,%edi), %ebp
	jbe	L164
L165:
	movl	12(%esp), %edi
	movl	8(%esp), %esi
	movl	56(%esp), %eax
	shrdl	$8, %edi, %esi
	shrl	$8, %edi
	movl	%ebp, (%eax)
	movl	%edi, %edx
	orl	%esi, %edx
	je	L147
	movzbl	4(%esp), %edx
	cmpb	$8, %dl
	ja	L281
L167:
	movzbl	%dl, %eax
	movl	%eax, %ebx
	movl	%eax, 4(%esp)
	movl	$320, %eax
	subl	%ebx, %eax
	testb	%dl, %dl
	je	L147
	leal	-1(%edx), %ebx
	movzbl	%bl, %ebx
	leal	1(%eax,%ebx), %eax
	movl	$7, %ebx
	movl	%eax, 8(%esp)
	leal	6(%ecx), %eax
	.p2align 4,,10
L168:
	movl	%esi, %ebp
	andl	$1, %ebp
	testl	%ebp, %ebp
	je	L170
	movb	$15, -6(%eax)
L170:
	cmpb	$1, %dl
	je	L171
	movl	%esi, %ebp
	andl	$2, %ebp
	testl	%ebp, %ebp
	je	L172
	movb	$15, -5(%eax)
L172:
	cmpb	$2, %dl
	je	L171
	movl	%esi, %ebp
	andl	$4, %ebp
	testl	%ebp, %ebp
	je	L173
	movb	$15, -4(%eax)
L173:
	cmpb	$3, %dl
	je	L171
	movl	%esi, %ebp
	andl	$8, %ebp
	testl	%ebp, %ebp
	je	L174
	movb	$15, -3(%eax)
L174:
	cmpb	$4, %dl
	je	L171
	movl	%esi, %ebp
	andl	$16, %ebp
	testl	%ebp, %ebp
	je	L175
	movb	$15, -2(%eax)
L175:
	cmpb	$5, %dl
	je	L171
	movl	%esi, %ebp
	andl	$32, %ebp
	testl	%ebp, %ebp
	je	L176
	movb	$15, -1(%eax)
L176:
	cmpb	$6, %dl
	je	L171
	movl	%esi, %ebp
	andl	$64, %ebp
	testl	%ebp, %ebp
	je	L177
	movb	$15, (%eax)
L177:
	cmpb	$8, %dl
	leal	1(%eax), %ecx
	jne	L171
	movl	%esi, %ebp
	andl	$128, %ebp
	testl	%ebp, %ebp
	je	L171
	movb	$15, (%ecx)
L171:
	movzbl	4(%esp), %ecx
	shrdl	%cl, %edi, %esi
	shrl	%cl, %edi
	testb	$32, %cl
	je	L282
	movl	%edi, %esi
	xorl	%edi, %edi
L282:
	addl	8(%esp), %eax
	subb	$1, %bl
	jne	L168
L147:
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L164:
	.cfi_restore_state
	leal	(%ecx,%esi), %ebp
	movl	$1717986919, %edx
	leal	-655360(%ebp), %edi
	movl	%edi, %eax
	imull	%edx
	movl	%edi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$6, %eax
	subl	%eax, %edi
	cmpl	%edi, %ebx
	jle	L165
	movl	16(%esp), %eax
	leal	2560(%ecx,%eax), %ecx
	leal	(%ecx,%esi), %ebp
	jmp	L165
	.p2align 4,,10
L148:
	leal	0(%ebp,%esi), %ecx
	movl	$1717986919, %edx
	leal	-655360(%ecx), %edi
	movl	%edi, %eax
	imull	%edx
	movl	%edi, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	leal	(%edx,%edx,4), %eax
	sall	$6, %eax
	subl	%eax, %edi
	cmpl	%edi, %ebx
	jle	L149
	movl	28(%esp), %eax
	leal	2560(%ebp,%eax), %ebp
	leal	0(%ebp,%esi), %ecx
	jmp	L149
	.p2align 4,,10
L281:
	movl	$8, %edx
	jmp	L167
	.p2align 4,,10
L280:
	movl	$8, %esi
	jmp	L151
	.cfi_endproc
LFE6:
	.p2align 4,,15
	.globl	_print_hex_16
	.def	_print_hex_16;	.scl	2;	.type	32;	.endef
_print_hex_16:
LFB0:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	movl	28(%esp), %eax
	movl	24(%esp), %ebx
	movw	%ax, 12(%esp)
	movzbl	%ah, %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	12(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	addl	$16, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE0:
	.p2align 4,,15
	.globl	_print_hex_32
	.def	_print_hex_32;	.scl	2;	.type	32;	.endef
_print_hex_32:
LFB1:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	movzbl	23(%esp), %eax
	movl	16(%esp), %ebx
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	22(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	21(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	20(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE1:
	.p2align 4,,15
	.globl	_print_hex_64
	.def	_print_hex_64;	.scl	2;	.type	32;	.endef
_print_hex_64:
LFB2:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	movl	28(%esp), %eax
	movl	24(%esp), %ebx
	movl	%eax, 8(%esp)
	movl	32(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 12(%esp)
	shrl	$24, %eax
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	14(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	13(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	12(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	11(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	10(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	9(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	movzbl	8(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_print_hex_8
	addl	$16, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2:
	.globl	_PIXEL_CHARSET
	.section .rdata,"dr"
	.align 32
_PIXEL_CHARSET:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	3
	.long	0
	.long	24321
	.long	0
	.long	11523
	.long	0
	.long	-176338427
	.long	661
	.long	1192739845
	.long	287
	.long	572683013
	.long	1650
	.long	1494558213
	.long	1427
	.long	769
	.long	0
	.long	2446850
	.long	0
	.long	1747202
	.long	0
	.long	5586947
	.long	0
	.long	3047427
	.long	0
	.long	24577
	.long	0
	.long	917507
	.long	0
	.long	16385
	.long	0
	.long	77898755
	.long	0
	.long	-1717987836
	.long	6
	.long	1145398276
	.long	15
	.long	306746884
	.long	15
	.long	-1737976316
	.long	6
	.long	1156932612
	.long	4
	.long	-1737416956
	.long	6
	.long	-1720609276
	.long	6
	.long	574918404
	.long	2
	.long	-1721133564
	.long	6
	.long	-1729522172
	.long	6
	.long	8705
	.long	0
	.long	25089
	.long	0
	.long	35823619
	.long	0
	.long	7454723
	.long	0
	.long	11044867
	.long	0
	.long	38311428
	.long	2
	.long	-622449147
	.long	899
	.long	533081605
	.long	1123
	.long	398864133
	.long	995
	.long	277229061
	.long	930
	.long	415641349
	.long	995
	.long	394542853
	.long	1986
	.long	394542853
	.long	66
	.long	478555653
	.long	931
	.long	533082373
	.long	1123
	.long	1108385541
	.long	1992
	.long	-2078204155
	.long	402
	.long	1368731909
	.long	1106
	.long	277094661
	.long	1986
	.long	451817733
	.long	1123
	.long	-1697763067
	.long	1123
	.long	415641093
	.long	931
	.long	398864133
	.long	66
	.long	1489382917
	.long	1427
	.long	1472605957
	.long	1106
	.long	117845509
	.long	931
	.long	1108385541
	.long	264
	.long	415641861
	.long	931
	.long	415641861
	.long	277
	.long	1489383685
	.long	683
	.long	-1574293243
	.long	1122
	.long	1110061317
	.long	264
	.long	572661509
	.long	1986
	.long	3495682
	.long	0
	.long	304384259
	.long	0
	.long	3844866
	.long	0
	.long	10755
	.long	0
	.long	5
	.long	1984
	.long	2306
	.long	0
	.long	-1717698556
	.long	14
	.long	-1718152956
	.long	7
	.long	287178756
	.long	14
	.long	-1717663740
	.long	14
	.long	529924100
	.long	14
	.long	572992516
	.long	2
	.long	-1902535164
	.long	6
	.long	-1718152956
	.long	9
	.long	488948227
	.long	0
	.long	239698947
	.long	0
	.long	1398345988
	.long	9
	.long	488936195
	.long	0
	.long	1522270213
	.long	1387
	.long	-1718157308
	.long	9
	.long	-1718222844
	.long	6
	.long	395941636
	.long	1
	.long	-1902535164
	.long	8
	.long	295108612
	.long	1
	.long	-2044854268
	.long	7
	.long	572989956
	.long	12
	.long	-1718026236
	.long	14
	.long	1503199236
	.long	2
	.long	1489240069
	.long	683
	.long	-1768357884
	.long	9
	.long	-1902536444
	.long	6
	.long	378470404
	.long	15
	.long	287478787
	.long	0
	.long	32513
	.long	0
	.long	86544643
	.long	0
	.long	-1970798587
	.long	0
	.long	0
	.long	0
	.globl	_HEX_DIGITS
LC0:
	.ascii "0123456789abcdef\0"
	.data
	.align 4
_HEX_DIGITS:
	.long	LC0
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
