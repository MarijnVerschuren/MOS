	.file	"kernel.c"
	.section .rdata,"dr"
LC1:
	.ascii "0123456789abcdef\0"
	.text
	.p2align 4,,15
	.globl	_kernel
	.def	_kernel;	.scl	2;	.type	32;	.endef
_kernel:
LFB7:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$48, %esp
	.cfi_def_cfa_offset 64
	movb	$48, 753664
	movb	$48, 753665
	movb	$49, 753666
	movb	$48, 753667
	movb	$50, 753668
	movb	$48, 753669
	movb	$51, 753670
	movb	$48, 753671
	movb	$52, 753672
	movb	$48, 753673
	movb	$53, 753674
	movb	$48, 753675
	movb	$54, 753676
	movb	$48, 753677
	movb	$55, 753678
	movb	$48, 753679
	movb	$56, 753680
	movb	$48, 753681
	movb	$57, 753682
	movb	$48, 753683
	movb	$97, 753684
	movb	$48, 753685
	movb	$98, 753686
	movb	$48, 753687
	movb	$99, 753688
	movb	$48, 753689
	movb	$100, 753690
	movb	$48, 753691
	movb	$101, 753692
	movb	$48, 753693
	movb	$102, 753694
	movb	$48, 753695
	movb	$52, 753824
	movb	$48, 753825
	movb	$48, 753826
	movb	$48, 753827
	movb	$48, 753828
	movb	$48, 753829
	movb	$57, 753830
	movb	$48, 753831
	movb	$50, 753832
	movb	$48, 753833
	movb	$49, 753834
	movb	$48, 753835
	movb	$102, 753836
	movb	$48, 753837
	movb	$98, 753838
	movb	$48, 753839
	movb	$53, 753840
	movb	$48, 753841
	movb	$52, 753842
	movb	$48, 753843
	movb	$52, 753844
	movb	$48, 753845
	movb	$52, 753846
	movb	$48, 753847
	movb	$50, 753848
	movb	$48, 753849
	movb	$100, 753850
	movb	$48, 753851
	movb	$49, 753852
	movb	$48, 753853
	movb	$56, 753854
	movb	$48, 753855
	movl	$0x40490fdb, (%esp)
	call	_sin
	fstps	28(%esp)
	movl	28(%esp), %eax
	movb	$48, 753985
	movb	$48, 753987
	movb	$48, 753989
	movb	$48, 753991
	movl	%eax, %ebx
	movl	%eax, %edi
	movl	%eax, %ecx
	shrl	$24, %ebx
	movl	%eax, %edx
	shrl	$16, %ecx
	movl	%ebx, %eax
	andl	$15, %ebx
	shrw	$8, %dx
	movzbl	LC1(%ebx), %ebx
	shrb	$4, %al
	movb	$48, 753993
	movzbl	%al, %esi
	movb	$48, 753995
	movb	$48, 753997
	movzbl	LC1(%esi), %eax
	movb	$48, 753999
	movb	%bl, 753986
	movl	%ecx, %ebx
	andl	$15, %ecx
	movzbl	LC1(%ecx), %ecx
	shrb	$4, %bl
	movb	%al, 753984
	movl	%edi, %eax
	movzbl	%bl, %ebx
	andl	$15, %eax
	movzbl	LC1(%ebx), %ebx
	movzbl	LC1(%eax), %eax
	movb	%cl, 753990
	movl	%edx, %ecx
	andl	$15, %edx
	movzbl	LC1(%edx), %edx
	shrb	$4, %cl
	movzbl	%cl, %ecx
	movb	%bl, 753988
	movzbl	LC1(%ecx), %ecx
	movb	%al, 753998
	movb	%dl, 753994
	movl	%edi, %edx
	shrb	$4, %dl
	movzbl	%dl, %edx
	movb	%cl, 753992
	movzbl	LC1(%edx), %edx
	movb	%dl, 753996
	addl	$48, %esp
	.cfi_def_cfa_offset 16
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
LFE7:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_sin;	.scl	2;	.type	32;	.endef
