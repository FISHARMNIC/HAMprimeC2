	.file	"chunks.c"
	.text
	.p2align 4
	.globl	__rc_enterChunk__
	.type	__rc_enterChunk__, @function
__rc_enterChunk__:
.LFB22:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	chunk_index@GOTOFF(%ebx), %esi
	cmpl	$2047, %esi
	jg	.L2
	movl	%esi, %eax
	sall	$4, %eax
	leal	linked_chunks_prealloc@GOTOFF(%ebx,%eax), %eax
.L3:
	movl	__Roster@GOT(%ebx), %edx
	addl	$1, %esi
	movl	$0, 8(%eax)
	movl	%esi, chunk_index@GOTOFF(%ebx)
	movl	(%edx), %edx
	movl	%edx, (%eax)
	movl	__ChunkStack@GOTOFF(%ebx), %edx
	movl	%eax, __ChunkStack@GOTOFF(%ebx)
	movl	%edx, 4(%eax)
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$16
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L3
	.cfi_endproc
.LFE22:
	.size	__rc_enterChunk__, .-__rc_enterChunk__
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	chunk_index@GOTOFF(%ebx), %edx
	movl	__ChunkStack@GOTOFF(%ebx), %esi
	subl	$1, %edx
	movl	%edx, chunk_index@GOTOFF(%ebx)
	testl	%esi, %esi
	je	.L6
	movl	8(%esi), %ecx
	testl	%ecx, %ecx
	je	.L8
	movl	__disable_gc__@GOT(%ebx), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L8
	movl	__Roster@GOT(%ebx), %eax
	movl	(%esi), %ecx
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L11
	cmpl	%eax, %ecx
	je	.L11
	movl	__gc_dontClear__@GOT(%ebx), %edx
	movl	%esi, 12(%esp)
	xorl	%edi, %edi
	movl	%ecx, %esi
	movl	%edx, 8(%esp)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L50:
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	__roster_remove@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	%eax, %esi
	je	.L23
.L51:
	testl	%eax, %eax
	je	.L23
.L16:
	movl	(%eax), %ecx
	xorl	%ebp, %ebp
	movl	(%ecx), %edx
	testl	%edx, %edx
	je	.L12
	movl	(%edx), %ebp
.L12:
	movl	12(%ecx), %ecx
	cmpl	%ecx, %ebp
	je	.L49
.L13:
	movl	8(%esp), %edx
	cmpl	%ecx, (%edx)
	jne	.L50
.L14:
	movl	%eax, %edi
	movl	4(%eax), %eax
.L54:
	cmpl	%eax, %esi
	jne	.L51
.L23:
	movl	12(%esp), %esi
	movl	chunk_index@GOTOFF(%ebx), %edx
.L11:
	cmpl	$2048, %edx
	jg	.L52
	movl	$0, (%esi)
	movl	$0, 4(%esi)
	movl	$0, 8(%esi)
.L19:
	movl	__ChunkStack@GOTOFF(%ebx), %eax
	movl	4(%eax), %eax
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	$2048, %edx
	jg	.L53
	movl	$0, (%esi)
	xorl	%eax, %eax
	movl	$0, 4(%esi)
	movl	$0, 8(%esi)
.L47:
	movl	%eax, __ChunkStack@GOTOFF(%ebx)
.L6:
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
	.p2align 3
.L49:
	.cfi_restore_state
	cmpl	48(%esp), %edx
	ja	.L14
	cmpl	52(%esp), %edx
	jnb	.L13
	movl	%eax, %edi
	movl	4(%eax), %eax
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L53:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	free@PLT
	movl	__ChunkStack@GOTOFF(%ebx), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	4(%eax), %eax
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L52:
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	free@PLT
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L19
	.cfi_endproc
.LFE23:
	.size	__rc_exitChunk__, .-__rc_exitChunk__
	.local	linked_chunks_prealloc
	.comm	linked_chunks_prealloc,32768,32
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
