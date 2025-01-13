	.file	"chunks.c"
	.text
.Ltext0:
	.p2align 4
	.globl	__rc_enterChunk__
	.type	__rc_enterChunk__, @function
__rc_enterChunk__:
.LFB22:
	.file 1 "./chunks.c"
	.loc 1 19 1 view -0
	.cfi_startproc
	.loc 1 20 5 view .LVU1
	.loc 1 19 1 is_stmt 0 view .LVU2
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	.loc 1 20 32 view .LVU3
	pushl	$12
	.cfi_def_cfa_offset 32
	call	malloc@PLT
.LVL0:
	.loc 1 22 5 is_stmt 1 view .LVU4
	.loc 1 22 22 is_stmt 0 view .LVU5
	movl	Roster@GOT(%ebx), %edx
	.loc 1 23 19 view .LVU6
	movl	$0, 8(%eax)
	.loc 1 22 22 view .LVU7
	movl	(%edx), %edx
	movl	%edx, (%eax)
	.loc 1 23 5 is_stmt 1 view .LVU8
	.loc 1 24 5 view .LVU9
	.loc 1 24 19 is_stmt 0 view .LVU10
	movl	__chunkStack@GOTOFF(%ebx), %edx
	.loc 1 26 18 view .LVU11
	movl	%eax, __chunkStack@GOTOFF(%ebx)
	.loc 1 24 19 view .LVU12
	movl	%edx, 4(%eax)
	.loc 1 26 5 is_stmt 1 view .LVU13
	.loc 1 27 1 is_stmt 0 view .LVU14
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
	.string	"Empty chunk"
.LC1:
	.string	"./chunks.c"
.LC2:
	.string	"old_frame_esp < old_frame_ebp"
.LC3:
	.string	"Chunk has %d bytes\n"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC4:
	.string	"||| - Old frame is between %p -> %p [%i?]\n"
	.section	.rodata.str1.1
.LC5:
	.string	"roster_entry != 0"
	.section	.rodata.str1.4
	.align 4
.LC6:
	.string	"|- Checking %p vs %p\n\t> dontClear is %p)\n\t> Allocation is %p\n\t> Going to GC because in scope?: %d\n\t> Owner's address is %p\n"
	.align 4
.LC7:
	.string	"\t ^- Discarding item was %p now %p\n"
	.section	.rodata.str1.1
.LC8:
	.string	"\t ^- Skipped "
	.text
	.p2align 4
	.globl	__rc_exitChunk__
	.type	__rc_exitChunk__, @function
__rc_exitChunk__:
.LVL1:
.LFB23:
	.loc 1 30 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 31 5 view .LVU16
	.loc 1 30 1 is_stmt 0 view .LVU17
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
	.loc 1 31 22 view .LVU18
	movl	__chunkStack@GOTOFF(%ebx), %eax
	movl	%eax, 28(%esp)
.LVL2:
	.loc 1 33 5 is_stmt 1 view .LVU19
	.loc 1 33 7 is_stmt 0 view .LVU20
	testl	%eax, %eax
	je	.L32
	.loc 1 39 5 is_stmt 1 view .LVU21
	movl	64(%esp), %eax
.LVL3:
	.loc 1 39 5 is_stmt 0 view .LVU22
	cmpl	%eax, 68(%esp)
	jnb	.L33
	.loc 1 41 5 is_stmt 1 view .LVU23
	.loc 1 41 15 is_stmt 0 view .LVU24
	movl	28(%esp), %edi
	.loc 1 43 15 view .LVU25
	movl	Roster@GOT(%ebx), %eax
	.loc 1 46 5 view .LVU26
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	.loc 1 41 15 view .LVU27
	movl	(%edi), %ebp
	.loc 1 43 15 view .LVU28
	movl	(%eax), %esi
	.loc 1 46 5 view .LVU29
	leal	.LC3@GOTOFF(%ebx), %eax
	.loc 1 41 15 view .LVU30
	movl	%ebp, 24(%esp)
.LVL4:
	.loc 1 43 5 is_stmt 1 view .LVU31
	.loc 1 44 5 view .LVU32
	.loc 1 46 5 view .LVU33
	pushl	8(%edi)
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	printf@PLT
.LVL5:
	.loc 1 48 5 view .LVU34
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	$1
	.cfi_def_cfa_offset 84
	pushl	84(%esp)
	.cfi_def_cfa_offset 88
	pushl	92(%esp)
	.cfi_def_cfa_offset 92
	pushl	%eax
	.cfi_def_cfa_offset 96
	call	printf@PLT
.LVL6:
	.loc 1 50 5 view .LVU35
	.loc 1 50 10 view .LVU36
	.loc 1 50 31 is_stmt 0 view .LVU37
	addl	$32, %esp
	.cfi_def_cfa_offset 64
	.loc 1 50 10 view .LVU38
	testl	%esi, %esi
	je	.L8
	cmpl	%esi, %ebp
	je	.L8
.LBB2:
	.loc 1 66 9 view .LVU39
	movl	__gc_dontClear__@GOT(%ebx), %eax
.LBE2:
	.loc 1 44 15 view .LVU40
	movl	$0, 20(%esp)
.LBB3:
	.loc 1 66 9 view .LVU41
	movl	%eax, 12(%esp)
	leal	.LC6@GOTOFF(%ebx), %eax
	movl	%eax, 24(%esp)
	jmp	.L14
.LVL7:
	.p2align 4,,10
	.p2align 3
.L35:
	.loc 1 73 13 is_stmt 1 view .LVU42
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%edx
	.cfi_def_cfa_offset 72
	pushl	%ebp
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	printf@PLT
.LVL8:
	.loc 1 73 102 view .LVU43
	.loc 1 74 13 view .LVU44
	.loc 1 74 20 is_stmt 0 view .LVU45
	popl	%eax
	.cfi_def_cfa_offset 76
	popl	%edx
	.cfi_def_cfa_offset 72
	pushl	%esi
	.cfi_def_cfa_offset 76
	pushl	32(%esp)
	.cfi_def_cfa_offset 80
	call	__roster_remove@PLT
.LVL9:
	.loc 1 74 18 view .LVU46
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	.loc 1 74 20 view .LVU47
	movl	%eax, %esi
.LVL10:
	.loc 1 74 20 view .LVU48
.LBE3:
	.loc 1 50 10 is_stmt 1 view .LVU49
	cmpl	16(%esp), %esi
	je	.L8
.LVL11:
.L36:
	.loc 1 50 10 is_stmt 0 view .LVU50
	testl	%esi, %esi
	je	.L8
.LVL12:
.L14:
.LBB4:
	.loc 1 52 9 is_stmt 1 view .LVU51
	.loc 1 52 25 is_stmt 0 view .LVU52
	movl	(%esi), %ecx
.LVL13:
	.loc 1 54 9 is_stmt 1 view .LVU53
	testl	%ecx, %ecx
	je	.L34
	.loc 1 56 9 view .LVU54
	.loc 1 56 15 is_stmt 0 view .LVU55
	movl	(%ecx), %eax
.LVL14:
	.loc 1 57 9 is_stmt 1 view .LVU56
	.loc 1 59 9 view .LVU57
	.loc 1 59 11 is_stmt 0 view .LVU58
	testl	%eax, %eax
	je	.L16
	.loc 1 61 13 is_stmt 1 view .LVU59
	.loc 1 61 29 is_stmt 0 view .LVU60
	movl	(%eax), %edx
.LVL15:
.L10:
	.loc 1 64 9 is_stmt 1 view .LVU61
	.loc 1 66 9 is_stmt 0 view .LVU62
	cmpl	%eax, 64(%esp)
	.loc 1 64 14 view .LVU63
	movl	12(%ecx), %ebp
.LVL16:
	.loc 1 66 9 is_stmt 1 view .LVU64
	setnb	%cl
.LVL17:
	.loc 1 66 9 is_stmt 0 view .LVU65
	cmpl	%eax, 68(%esp)
	movl	%ecx, %edi
	setbe	%cl
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	andl	%ecx, %edi
	pushl	%eax
	.cfi_def_cfa_offset 72
.LVL18:
	.loc 1 66 9 view .LVU66
	movl	%edi, %eax
.LVL19:
	.loc 1 66 9 view .LVU67
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 76
	pushl	%esi
	.cfi_def_cfa_offset 80
	movl	28(%esp), %eax
	pushl	(%eax)
	.cfi_def_cfa_offset 84
	pushl	%edx
	.cfi_def_cfa_offset 88
	movl	%edx, 32(%esp)
	pushl	%ebp
	.cfi_def_cfa_offset 92
	pushl	52(%esp)
	.cfi_def_cfa_offset 96
	call	printf@PLT
.LVL20:
	.loc 1 66 304 is_stmt 1 view .LVU68
	.loc 1 71 9 view .LVU69
	.loc 1 71 57 is_stmt 0 view .LVU70
	movl	40(%esp), %edx
	.loc 1 71 12 view .LVU71
	addl	$32, %esp
	.cfi_def_cfa_offset 64
	.loc 1 71 57 view .LVU72
	cmpl	%ebp, %edx
	jne	.L17
	movl	%edi, %eax
	testb	%al, %al
	je	.L11
.L17:
	.loc 1 71 132 discriminator 3 view .LVU73
	movl	12(%esp), %eax
	cmpl	%ebp, (%eax)
	jne	.L35
.L11:
	.loc 1 78 13 is_stmt 1 view .LVU74
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	puts@PLT
.LVL21:
	.loc 1 78 41 view .LVU75
	.loc 1 79 13 view .LVU76
	.loc 1 80 13 view .LVU77
	.loc 1 80 18 is_stmt 0 view .LVU78
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	%esi, 20(%esp)
	movl	4(%esi), %esi
.LVL22:
	.loc 1 80 18 view .LVU79
.LBE4:
	.loc 1 50 10 is_stmt 1 view .LVU80
	cmpl	16(%esp), %esi
	jne	.L36
.LVL23:
.L8:
	.loc 1 84 5 view .LVU81
	.loc 1 84 32 is_stmt 0 view .LVU82
	movl	__chunkStack@GOTOFF(%ebx), %eax
	.loc 1 85 5 view .LVU83
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	.loc 1 84 18 view .LVU84
	movl	4(%eax), %eax
	.loc 1 85 5 view .LVU85
	pushl	40(%esp)
	.cfi_def_cfa_offset 80
	.loc 1 84 18 view .LVU86
	movl	%eax, __chunkStack@GOTOFF(%ebx)
	.loc 1 85 5 is_stmt 1 view .LVU87
	call	free@PLT
.LVL24:
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	.loc 1 86 1 is_stmt 0 view .LVU88
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL25:
	.loc 1 86 1 view .LVU89
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL26:
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
.LBB5:
	.loc 1 57 14 view .LVU90
	xorl	%edx, %edx
	jmp	.L10
.LVL27:
.L32:
	.loc 1 57 14 view .LVU91
.LBE5:
	.loc 1 35 9 is_stmt 1 view .LVU92
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	leal	.LC0@GOTOFF(%ebx), %eax
.LVL28:
	.loc 1 35 9 is_stmt 0 view .LVU93
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	puts@PLT
.LVL29:
	.loc 1 36 9 is_stmt 1 view .LVU94
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	.loc 1 86 1 is_stmt 0 view .LVU95
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
.LVL30:
.L34:
	.cfi_restore_state
.LBB6:
	.loc 1 54 9 is_stmt 1 discriminator 1 view .LVU96
	leal	__PRETTY_FUNCTION__.0@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	$54
	.cfi_def_cfa_offset 72
	pushl	%eax
	.cfi_def_cfa_offset 76
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	__assert_fail@PLT
.LVL31:
.L33:
	.cfi_restore_state
	.loc 1 54 9 is_stmt 0 discriminator 1 view .LVU97
.LBE6:
	.loc 1 39 5 is_stmt 1 discriminator 1 view .LVU98
	leal	__PRETTY_FUNCTION__.0@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 68
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	$39
	.cfi_def_cfa_offset 72
	pushl	%eax
	.cfi_def_cfa_offset 76
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	__assert_fail@PLT
.LVL32:
	.loc 1 39 5 is_stmt 0 discriminator 1 view .LVU99
	.cfi_endproc
.LFE23:
	.size	__rc_exitChunk__, .-__rc_exitChunk__
	.section	.rodata
	.align 4
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 17
__PRETTY_FUNCTION__.0:
	.string	"__rc_exitChunk__"
	.globl	__chunkStack
	.bss
	.align 4
	.type	__chunkStack, @object
	.size	__chunkStack, 4
__chunkStack:
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
	.text
.Letext0:
	.file 2 "./rollcall.h"
	.file 3 "./linked.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/assert.h"
	.file 6 "/usr/include/stdlib.h"
	.file 7 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x368
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF38
	.byte	0xc
	.long	.LASF39
	.long	.LASF40
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x5
	.long	0x6d
	.uleb128 0x6
	.long	.LASF14
	.byte	0x10
	.byte	0x2
	.byte	0x1c
	.byte	0x10
	.long	0xbb
	.uleb128 0x7
	.long	.LASF10
	.byte	0x2
	.byte	0x1e
	.byte	0xb
	.long	0x6b
	.byte	0
	.uleb128 0x7
	.long	.LASF11
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x33
	.byte	0x4
	.uleb128 0x7
	.long	.LASF12
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x33
	.byte	0x8
	.uleb128 0x7
	.long	.LASF13
	.byte	0x2
	.byte	0x21
	.byte	0xb
	.long	0x6b
	.byte	0xc
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x2
	.byte	0x22
	.byte	0x3
	.long	0x79
	.uleb128 0x9
	.byte	0x4
	.long	0xbb
	.uleb128 0x6
	.long	.LASF15
	.byte	0x8
	.byte	0x3
	.byte	0xa
	.byte	0x10
	.long	0xf5
	.uleb128 0x7
	.long	.LASF16
	.byte	0x3
	.byte	0xc
	.byte	0x15
	.long	0xc7
	.byte	0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x3
	.byte	0xd
	.byte	0x16
	.long	0xf5
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0xcd
	.uleb128 0x8
	.long	.LASF15
	.byte	0x3
	.byte	0xe
	.byte	0x3
	.long	0xcd
	.uleb128 0x6
	.long	.LASF18
	.byte	0xc
	.byte	0x3
	.byte	0x17
	.byte	0x10
	.long	0x13c
	.uleb128 0x7
	.long	.LASF19
	.byte	0x3
	.byte	0x19
	.byte	0xf
	.long	0x13c
	.byte	0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x3
	.byte	0x1a
	.byte	0x1d
	.long	0x142
	.byte	0x4
	.uleb128 0x7
	.long	.LASF12
	.byte	0x3
	.byte	0x1b
	.byte	0x9
	.long	0x33
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0xfb
	.uleb128 0x9
	.byte	0x4
	.long	0x107
	.uleb128 0x8
	.long	.LASF18
	.byte	0x3
	.byte	0x1c
	.byte	0x3
	.long	0x107
	.uleb128 0xa
	.long	.LASF20
	.byte	0x1
	.byte	0xd
	.byte	0x12
	.long	0x166
	.uleb128 0x5
	.byte	0x3
	.long	__chunkStack
	.uleb128 0x9
	.byte	0x4
	.long	0x148
	.uleb128 0xb
	.long	.LASF21
	.byte	0x1
	.byte	0xf
	.byte	0x12
	.long	0x13c
	.uleb128 0xb
	.long	.LASF22
	.byte	0x1
	.byte	0x10
	.byte	0xe
	.long	0x6b
	.uleb128 0xc
	.long	.LASF41
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.long	.LFB23
	.long	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x2cc
	.uleb128 0xd
	.long	.LASF23
	.byte	0x1
	.byte	0x1d
	.byte	0x1e
	.long	0x2cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF24
	.byte	0x1
	.byte	0x1d
	.byte	0x34
	.long	0x2cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.byte	0x1f
	.byte	0x16
	.long	0x166
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0xf
	.long	.LASF42
	.long	0x2e8
	.uleb128 0x5
	.byte	0x3
	.long	__PRETTY_FUNCTION__.0
	.uleb128 0x10
	.string	"end"
	.byte	0x1
	.byte	0x29
	.byte	0xf
	.long	0x13c
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0xe
	.long	.LASF26
	.byte	0x1
	.byte	0x2b
	.byte	0xf
	.long	0x13c
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0xe
	.long	.LASF27
	.byte	0x1
	.byte	0x2c
	.byte	0xf
	.long	0x13c
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x11
	.long	.Ldebug_ranges0+0
	.long	0x29e
	.uleb128 0xe
	.long	.LASF28
	.byte	0x1
	.byte	0x34
	.byte	0x19
	.long	0xc7
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0xe
	.long	.LASF29
	.byte	0x1
	.byte	0x38
	.byte	0xf
	.long	0x2cc
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0xe
	.long	.LASF30
	.byte	0x1
	.byte	0x39
	.byte	0xe
	.long	0x2d2
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0xe
	.long	.LASF31
	.byte	0x1
	.byte	0x40
	.byte	0xe
	.long	0x2d2
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x12
	.long	.LVL8
	.long	0x321
	.uleb128 0x12
	.long	.LVL9
	.long	0x32e
	.uleb128 0x12
	.long	.LVL20
	.long	0x321
	.uleb128 0x12
	.long	.LVL21
	.long	0x33a
	.uleb128 0x12
	.long	.LVL31
	.long	0x345
	.byte	0
	.uleb128 0x12
	.long	.LVL5
	.long	0x321
	.uleb128 0x12
	.long	.LVL6
	.long	0x321
	.uleb128 0x12
	.long	.LVL24
	.long	0x351
	.uleb128 0x12
	.long	.LVL29
	.long	0x33a
	.uleb128 0x12
	.long	.LVL32
	.long	0x345
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2d2
	.uleb128 0x9
	.byte	0x4
	.long	0x33
	.uleb128 0x13
	.long	0x74
	.long	0x2e8
	.uleb128 0x14
	.long	0x25
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.long	0x2d8
	.uleb128 0x15
	.long	.LASF43
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.long	.LFB22
	.long	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x321
	.uleb128 0xe
	.long	.LASF32
	.byte	0x1
	.byte	0x14
	.byte	0x16
	.long	0x166
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x12
	.long	.LVL0
	.long	0x35e
	.byte	0
	.uleb128 0x16
	.long	.LASF33
	.long	.LASF33
	.byte	0x4
	.value	0x14c
	.byte	0xc
	.uleb128 0x17
	.long	.LASF34
	.long	.LASF34
	.byte	0x3
	.byte	0x25
	.byte	0xb
	.uleb128 0x18
	.long	.LASF44
	.long	.LASF45
	.byte	0x7
	.byte	0
	.uleb128 0x17
	.long	.LASF35
	.long	.LASF35
	.byte	0x5
	.byte	0x45
	.byte	0xd
	.uleb128 0x16
	.long	.LASF36
	.long	.LASF36
	.byte	0x6
	.value	0x235
	.byte	0xd
	.uleb128 0x16
	.long	.LASF37
	.long	.LASF37
	.byte	0x6
	.value	0x21b
	.byte	0xe
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS1:
	.uleb128 .LVU19
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU34
	.uleb128 .LVU34
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU91
	.uleb128 .LVU91
	.uleb128 .LVU93
	.uleb128 .LVU93
	.uleb128 .LVU94
	.uleb128 .LVU94
	.uleb128 .LVU97
	.uleb128 .LVU97
	.uleb128 .LVU99
	.uleb128 .LVU99
	.uleb128 0
.LLST1:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
	.long	.LVL5-1-.Ltext0
	.value	0x5
	.byte	0x3
	.long	__chunkStack
	.long	.LVL5-1-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x57
	.long	.LVL7-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL28-.Ltext0
	.long	.LVL29-1-.Ltext0
	.value	0x5
	.byte	0x3
	.long	__chunkStack
	.long	.LVL29-1-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL31-.Ltext0
	.long	.LVL32-1-.Ltext0
	.value	0x5
	.byte	0x3
	.long	__chunkStack
	.long	.LVL32-1-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LVUS2:
	.uleb128 .LVU31
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU91
	.uleb128 .LVU96
	.uleb128 .LVU97
.LLST2:
	.long	.LVL4-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x55
	.long	.LVL7-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	0
	.long	0
.LVUS3:
	.uleb128 .LVU32
	.uleb128 .LVU48
	.uleb128 .LVU48
	.uleb128 .LVU50
	.uleb128 .LVU50
	.uleb128 .LVU78
	.uleb128 .LVU78
	.uleb128 .LVU79
	.uleb128 .LVU79
	.uleb128 .LVU89
	.uleb128 .LVU90
	.uleb128 .LVU91
	.uleb128 .LVU96
	.uleb128 .LVU97
.LLST3:
	.long	.LVL4-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL10-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL11-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 4
	.long	.LVL22-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x1
	.byte	0x56
	.long	0
	.long	0
.LVUS4:
	.uleb128 .LVU33
	.uleb128 .LVU42
	.uleb128 .LVU42
	.uleb128 .LVU77
	.uleb128 .LVU77
	.uleb128 .LVU79
	.uleb128 .LVU79
	.uleb128 .LVU81
	.uleb128 .LVU90
	.uleb128 .LVU91
	.uleb128 .LVU96
	.uleb128 .LVU97
.LLST4:
	.long	.LVL4-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL7-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	0
	.long	0
.LVUS5:
	.uleb128 .LVU53
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU66
	.uleb128 .LVU90
	.uleb128 .LVU91
	.uleb128 .LVU96
	.uleb128 .LVU97
.LLST5:
	.long	.LVL13-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x51
	.long	.LVL17-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 0
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x51
	.long	.LVL30-.Ltext0
	.long	.LVL31-1-.Ltext0
	.value	0x1
	.byte	0x51
	.long	0
	.long	0
.LVUS6:
	.uleb128 .LVU56
	.uleb128 .LVU67
	.uleb128 .LVU67
	.uleb128 .LVU68
	.uleb128 .LVU90
	.uleb128 .LVU91
.LLST6:
	.long	.LVL14-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LVL20-1-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LVUS7:
	.uleb128 .LVU42
	.uleb128 .LVU51
	.uleb128 .LVU57
	.uleb128 .LVU61
	.uleb128 .LVU61
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 .LVU81
	.uleb128 .LVU90
	.uleb128 .LVU91
.LLST7:
	.long	.LVL7-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL15-.Ltext0
	.long	.LVL20-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL20-1-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LVUS8:
	.uleb128 .LVU42
	.uleb128 .LVU51
	.uleb128 .LVU64
	.uleb128 .LVU81
.LLST8:
	.long	.LVL7-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x55
	.long	.LVL16-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x1
	.byte	0x55
	.long	0
	.long	0
.LVUS0:
	.uleb128 .LVU4
	.uleb128 0
.LLST0:
	.long	.LVL0-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB2-.Ltext0
	.long	.LBE2-.Ltext0
	.long	.LBB3-.Ltext0
	.long	.LBE3-.Ltext0
	.long	.LBB4-.Ltext0
	.long	.LBE4-.Ltext0
	.long	.LBB5-.Ltext0
	.long	.LBE5-.Ltext0
	.long	.LBB6-.Ltext0
	.long	.LBE6-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF26:
	.string	"list"
.LASF35:
	.string	"__assert_fail"
.LASF17:
	.string	"next"
.LASF24:
	.string	"old_frame_esp"
.LASF23:
	.string	"old_frame_ebp"
.LASF15:
	.string	"linked_t"
.LASF16:
	.string	"item"
.LASF34:
	.string	"__roster_remove"
.LASF7:
	.string	"short int"
.LASF29:
	.string	"owner_reference"
.LASF11:
	.string	"restricted"
.LASF40:
	.string	"/Users/squijano/Documents/HAMprimeC2/compiler/libs/garbage"
.LASF22:
	.string	"__gc_dontClear__"
.LASF42:
	.string	"__PRETTY_FUNCTION__"
.LASF39:
	.string	"./chunks.c"
.LASF45:
	.string	"__builtin_puts"
.LASF12:
	.string	"size"
.LASF43:
	.string	"__rc_enterChunk__"
.LASF5:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF31:
	.string	"owner_should_point_to"
.LASF25:
	.string	"save"
.LASF3:
	.string	"unsigned char"
.LASF13:
	.string	"pointer"
.LASF27:
	.string	"previous"
.LASF38:
	.string	"GNU C17 10.2.1 20210110 -m32 -mtune=generic -march=i686 -g -O2 -fasynchronous-unwind-tables"
.LASF20:
	.string	"__chunkStack"
.LASF10:
	.string	"owner"
.LASF0:
	.string	"unsigned int"
.LASF19:
	.string	"address"
.LASF8:
	.string	"long long unsigned int"
.LASF32:
	.string	"newItem"
.LASF41:
	.string	"__rc_exitChunk__"
.LASF36:
	.string	"free"
.LASF2:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF18:
	.string	"linked_chunks_t"
.LASF33:
	.string	"printf"
.LASF28:
	.string	"roster_entry"
.LASF1:
	.string	"long int"
.LASF44:
	.string	"puts"
.LASF6:
	.string	"signed char"
.LASF21:
	.string	"Roster"
.LASF14:
	.string	"roster_entry_t"
.LASF30:
	.string	"owner_points_to"
.LASF37:
	.string	"malloc"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
