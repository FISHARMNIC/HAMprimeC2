	.file	"chunks.c"
	.text
	.p2align 4
	.globl	__rc_enterChunk__
	.type	__rc_enterChunk__, @function
__rc_enterChunk__:
.LFB22:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$12
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movl	__Roster@GOT(%ebx), %edx
	addl	$1, chunk_index@GOTOFF(%ebx)
	movl	$0, 8(%eax)
	movl	(%edx), %edx
	movl	%edx, (%eax)
	movl	__ChunkStack@GOTOFF(%ebx), %edx
	movl	%eax, __ChunkStack@GOTOFF(%ebx)
	movl	%edx, 4(%eax)
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE22:
	.size	__rc_enterChunk__, .-__rc_enterChunk__
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Empty or null chunk"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC1:
	.string	"||| - Old frame is between %p -> %p [%i?]\n"
	.section	.rodata.str1.1
.LC2:
	.string	"Chunk has %d bytes\n"
	.section	.rodata.str1.4
	.align 4
.LC3:
	.string	"|- Checking %p vs %p\n\t> dontClear is %p)\n\t> Allocation is %p\n\t> Going to GC because in scope?: %d\n\t> Owner's address is %p\n"
	.align 4
.LC4:
	.string	"\t ^- Discarding item was %p now %p\n"
	.section	.rodata.str1.1
.LC5:
	.string	"\t ^- Skipped "
	.text
	.p2align 4
	.globl	__rc_exitChunk__
	.type	__rc_exitChunk__, @function
__rc_exitChunk__:
.LFB23:
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
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	__ChunkStack@GOTOFF(%ebx), %eax
	subl	$1, chunk_index@GOTOFF(%ebx)
	movl	%eax, 28(%esp)
	testl	%eax, %eax
	je	.L5
	movl	8(%eax), %ecx
	testl	%ecx, %ecx
	jne	.L6
.L5:
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	puts@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
.L4:
	addl	$44, %esp
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
	.p2align 3
.L6:
	.cfi_restore_state
	movl	64(%esp), %eax
	cmpl	%eax, 68(%esp)
	setbe	%al
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 68
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	68(%esp)
	.cfi_def_cfa_offset 72
	pushl	76(%esp)
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	printf@PLT
	movl	44(%esp), %edi
	movl	__Roster@GOT(%ebx), %eax
	movl	(%edi), %ebp
	movl	(%eax), %esi
	movl	%ebp, 24(%esp)
	popl	%eax
	.cfi_def_cfa_offset 76
	leal	.LC2@GOTOFF(%ebx), %eax
	popl	%edx
	.cfi_def_cfa_offset 72
	pushl	8(%edi)
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	printf@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	testl	%esi, %esi
	je	.L16
	cmpl	%esi, %ebp
	je	.L16
	movl	__gc_dontClear__@GOT(%ebx), %eax
	movl	$0, 16(%esp)
	movl	%eax, 4(%esp)
	leal	.LC3@GOTOFF(%ebx), %eax
	movl	%eax, 12(%esp)
	leal	.LC5@GOTOFF(%ebx), %eax
	movl	%eax, 20(%esp)
	leal	.LC4@GOTOFF(%ebx), %eax
	movl	%eax, 24(%esp)
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L35:
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	pushl	%edx
	.cfi_def_cfa_offset 72
	pushl	%ebp
	.cfi_def_cfa_offset 76
	pushl	36(%esp)
	.cfi_def_cfa_offset 80
	call	printf@PLT
	popl	%eax
	.cfi_def_cfa_offset 76
	popl	%edx
	.cfi_def_cfa_offset 72
	pushl	%esi
	.cfi_def_cfa_offset 76
	pushl	28(%esp)
	.cfi_def_cfa_offset 80
	call	__roster_remove@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	%eax, %esi
	cmpl	8(%esp), %esi
	je	.L16
.L36:
	testl	%esi, %esi
	je	.L16
.L8:
	movl	(%esi), %ecx
	xorl	%edx, %edx
	movl	(%ecx), %eax
	testl	%eax, %eax
	je	.L11
	movl	(%eax), %edi
	xorl	%edx, %edx
	testl	%edi, %edi
	setne	%dl
.L11:
	cmpl	%eax, 64(%esp)
	movl	12(%ecx), %ebp
	setnb	%cl
	cmpl	%eax, 68(%esp)
	movl	%ecx, %edi
	setbe	%cl
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	andl	%ecx, %edi
	pushl	%eax
	.cfi_def_cfa_offset 72
	movl	%edi, %eax
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 76
	pushl	%esi
	.cfi_def_cfa_offset 80
	movl	20(%esp), %eax
	pushl	(%eax)
	.cfi_def_cfa_offset 84
	pushl	%edx
	.cfi_def_cfa_offset 88
	movl	%edx, 24(%esp)
	pushl	%ebp
	.cfi_def_cfa_offset 92
	pushl	40(%esp)
	.cfi_def_cfa_offset 96
	call	printf@PLT
	movl	32(%esp), %edx
	addl	$32, %esp
	.cfi_def_cfa_offset 64
	cmpl	%edx, %ebp
	jne	.L19
	movl	%edi, %eax
	testb	%al, %al
	je	.L12
.L19:
	movl	4(%esp), %eax
	cmpl	%ebp, (%eax)
	jne	.L35
.L12:
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	pushl	32(%esp)
	.cfi_def_cfa_offset 80
	call	puts@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	%esi, 16(%esp)
	movl	4(%esi), %esi
	cmpl	8(%esp), %esi
	jne	.L36
.L16:
	cmpl	$2048, chunk_index@GOTOFF(%ebx)
	movl	__ChunkStack@GOTOFF(%ebx), %eax
	movl	4(%eax), %eax
	movl	%eax, __ChunkStack@GOTOFF(%ebx)
	jle	.L4
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	pushl	40(%esp)
	.cfi_def_cfa_offset 80
	call	free@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	jmp	.L4
	.cfi_endproc
.LFE23:
	.size	__rc_exitChunk__, .-__rc_exitChunk__
	.globl	chunk_index
	.bss
	.align 4
	.type	chunk_index, @object
	.size	chunk_index, 4
chunk_index:
	.zero	4
	.globl	__ChunkStack
	.align 4
	.type	__ChunkStack, @object
	.size	__ChunkStack, 4
__ChunkStack:
	.zero	4
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB24:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE24:
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
