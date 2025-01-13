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
	.string	"./chunks.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC1:
	.string	"old_frame_esp <= old_frame_ebp"
	.section	.rodata.str1.1
.LC2:
	.string	"roster_entry != 0"
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
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 1 31 22 view .LVU18
	movl	__chunkStack@GOTOFF(%ebx), %eax
	movl	%eax, 12(%esp)
.LVL2:
	.loc 1 33 5 is_stmt 1 view .LVU19
	.loc 1 33 7 is_stmt 0 view .LVU20
	testl	%eax, %eax
	je	.L4
	.loc 1 38 10 is_stmt 1 view .LVU21
	.loc 1 38 12 is_stmt 0 view .LVU22
	movl	8(%eax), %eax
.LVL3:
	.loc 1 38 12 view .LVU23
	testl	%eax, %eax
	je	.L4
	.loc 1 46 5 is_stmt 1 view .LVU24
	movl	48(%esp), %eax
	cmpl	%eax, 52(%esp)
	ja	.L39
	.loc 1 48 5 view .LVU25
	.loc 1 48 15 is_stmt 0 view .LVU26
	movl	12(%esp), %eax
	movl	(%eax), %esi
.LVL4:
	.loc 1 49 5 is_stmt 1 view .LVU27
	.loc 1 49 15 is_stmt 0 view .LVU28
	movl	Roster@GOT(%ebx), %eax
	movl	(%eax), %eax
.LVL5:
	.loc 1 50 5 is_stmt 1 view .LVU29
	.loc 1 52 49 view .LVU30
	.loc 1 54 5 view .LVU31
	.loc 1 54 10 view .LVU32
	cmpl	%eax, %esi
	je	.L15
	testl	%eax, %eax
	je	.L15
.LBB2:
	.loc 1 75 153 is_stmt 0 view .LVU33
	movl	__gc_dontClear__@GOT(%ebx), %ecx
.LBE2:
	.loc 1 50 15 view .LVU34
	xorl	%edi, %edi
.LBB3:
	.loc 1 75 153 view .LVU35
	movl	%ecx, 8(%esp)
	jmp	.L13
.LVL6:
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 77 102 is_stmt 1 view .LVU36
	.loc 1 78 13 view .LVU37
	.loc 1 78 20 is_stmt 0 view .LVU38
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
.LVL7:
	.loc 1 78 20 view .LVU39
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	__roster_remove@PLT
.LVL8:
	.loc 1 78 18 view .LVU40
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	.loc 1 78 18 view .LVU41
.LBE3:
	.loc 1 54 10 is_stmt 1 view .LVU42
	cmpl	%eax, %esi
	je	.L17
.L43:
	.loc 1 54 10 is_stmt 0 view .LVU43
	testl	%eax, %eax
	je	.L17
.LVL9:
.L13:
.LBB4:
	.loc 1 56 9 is_stmt 1 view .LVU44
	.loc 1 56 25 is_stmt 0 view .LVU45
	movl	(%eax), %edx
.LVL10:
	.loc 1 58 9 is_stmt 1 view .LVU46
	testl	%edx, %edx
	je	.L40
	.loc 1 60 9 view .LVU47
	.loc 1 60 15 is_stmt 0 view .LVU48
	movl	(%edx), %ecx
.LVL11:
	.loc 1 61 9 is_stmt 1 view .LVU49
	.loc 1 63 9 view .LVU50
	.loc 1 63 11 is_stmt 0 view .LVU51
	testl	%ecx, %ecx
	je	.L16
	.loc 1 65 13 is_stmt 1 view .LVU52
	.loc 1 65 29 is_stmt 0 view .LVU53
	movl	(%ecx), %ebp
.LVL12:
.L9:
	.loc 1 68 9 is_stmt 1 view .LVU54
	.loc 1 68 14 is_stmt 0 view .LVU55
	movl	12(%edx), %edx
.LVL13:
	.loc 1 70 304 is_stmt 1 view .LVU56
	.loc 1 75 9 view .LVU57
	.loc 1 75 12 is_stmt 0 view .LVU58
	cmpl	%edx, %ebp
	je	.L41
.L10:
	.loc 1 75 132 discriminator 3 view .LVU59
	movl	8(%esp), %ecx
.LVL14:
	.loc 1 75 132 discriminator 3 view .LVU60
	cmpl	%edx, (%ecx)
	jne	.L42
.L11:
	.loc 1 82 41 is_stmt 1 view .LVU61
	.loc 1 83 13 view .LVU62
.LVL15:
	.loc 1 84 13 view .LVU63
	.loc 1 84 18 is_stmt 0 view .LVU64
	movl	%eax, %edi
	movl	4(%eax), %eax
.LVL16:
.L44:
	.loc 1 84 18 view .LVU65
.LBE4:
	.loc 1 54 10 is_stmt 1 view .LVU66
	cmpl	%eax, %esi
	jne	.L43
.LVL17:
.L17:
	.loc 1 88 32 is_stmt 0 view .LVU67
	movl	__chunkStack@GOTOFF(%ebx), %eax
.LVL18:
.L7:
	.loc 1 88 5 is_stmt 1 view .LVU68
	.loc 1 89 5 is_stmt 0 view .LVU69
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	.loc 1 88 18 view .LVU70
	movl	4(%eax), %eax
	.loc 1 89 5 view .LVU71
	pushl	24(%esp)
	.cfi_def_cfa_offset 64
	.loc 1 88 18 view .LVU72
	movl	%eax, __chunkStack@GOTOFF(%ebx)
	.loc 1 89 5 is_stmt 1 view .LVU73
	call	free@PLT
.LVL19:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL20:
.L4:
	.loc 1 90 1 is_stmt 0 view .LVU74
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
.LVL21:
	.p2align 4,,10
	.p2align 3
.L41:
	.cfi_restore_state
.LBB5:
	.loc 1 75 57 discriminator 2 view .LVU75
	cmpl	%ecx, 48(%esp)
	jb	.L11
	cmpl	%ecx, 52(%esp)
	jbe	.L10
	.loc 1 82 41 is_stmt 1 view .LVU76
	.loc 1 83 13 view .LVU77
.LVL22:
	.loc 1 84 13 view .LVU78
	.loc 1 84 18 is_stmt 0 view .LVU79
	movl	%eax, %edi
	movl	4(%eax), %eax
.LVL23:
	.loc 1 84 18 view .LVU80
	jmp	.L44
.LVL24:
	.p2align 4,,10
	.p2align 3
.L16:
	.loc 1 61 14 view .LVU81
	xorl	%ebp, %ebp
	jmp	.L9
.LVL25:
.L15:
	.loc 1 61 14 view .LVU82
.LBE5:
	.loc 1 54 10 view .LVU83
	movl	12(%esp), %eax
.LVL26:
	.loc 1 54 10 view .LVU84
	jmp	.L7
.LVL27:
.L40:
.LBB6:
	.loc 1 58 9 is_stmt 1 discriminator 1 view .LVU85
	leal	__PRETTY_FUNCTION__.0@GOTOFF(%ebx), %eax
.LVL28:
	.loc 1 58 9 is_stmt 0 discriminator 1 view .LVU86
	pushl	%eax
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	$58
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	__assert_fail@PLT
.LVL29:
.L39:
	.cfi_restore_state
	.loc 1 58 9 discriminator 1 view .LVU87
.LBE6:
	.loc 1 46 5 is_stmt 1 discriminator 1 view .LVU88
	leal	__PRETTY_FUNCTION__.0@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 52
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	$46
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	__assert_fail@PLT
.LVL30:
	.loc 1 46 5 is_stmt 0 discriminator 1 view .LVU89
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
	.file 4 "/usr/include/assert.h"
	.file 5 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x31a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF37
	.byte	0xc
	.long	.LASF38
	.long	.LASF39
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
	.long	.LASF40
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.long	.LFB23
	.long	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x296
	.uleb128 0xd
	.long	.LASF23
	.byte	0x1
	.byte	0x1d
	.byte	0x1e
	.long	0x296
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF24
	.byte	0x1
	.byte	0x1d
	.byte	0x34
	.long	0x296
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
	.long	.LASF41
	.long	0x2b2
	.uleb128 0x5
	.byte	0x3
	.long	__PRETTY_FUNCTION__.0
	.uleb128 0x10
	.string	"end"
	.byte	0x1
	.byte	0x30
	.byte	0xf
	.long	0x13c
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0xe
	.long	.LASF26
	.byte	0x1
	.byte	0x31
	.byte	0xf
	.long	0x13c
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0xe
	.long	.LASF27
	.byte	0x1
	.byte	0x32
	.byte	0xf
	.long	0x13c
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x11
	.long	.Ldebug_ranges0+0
	.long	0x283
	.uleb128 0xe
	.long	.LASF28
	.byte	0x1
	.byte	0x38
	.byte	0x19
	.long	0xc7
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0xe
	.long	.LASF29
	.byte	0x1
	.byte	0x3c
	.byte	0xf
	.long	0x296
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0xe
	.long	.LASF30
	.byte	0x1
	.byte	0x3d
	.byte	0xe
	.long	0x29c
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0xe
	.long	.LASF31
	.byte	0x1
	.byte	0x44
	.byte	0xe
	.long	0x29c
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x12
	.long	.LVL8
	.long	0x2eb
	.uleb128 0x12
	.long	.LVL29
	.long	0x2f7
	.byte	0
	.uleb128 0x12
	.long	.LVL19
	.long	0x303
	.uleb128 0x12
	.long	.LVL30
	.long	0x2f7
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x29c
	.uleb128 0x9
	.byte	0x4
	.long	0x33
	.uleb128 0x13
	.long	0x74
	.long	0x2b2
	.uleb128 0x14
	.long	0x25
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.long	0x2a2
	.uleb128 0x15
	.long	.LASF42
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.long	.LFB22
	.long	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x2eb
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
	.long	0x310
	.byte	0
	.uleb128 0x16
	.long	.LASF33
	.long	.LASF33
	.byte	0x3
	.byte	0x25
	.byte	0xb
	.uleb128 0x16
	.long	.LASF34
	.long	.LASF34
	.byte	0x4
	.byte	0x45
	.byte	0xd
	.uleb128 0x17
	.long	.LASF35
	.long	.LASF35
	.byte	0x5
	.value	0x235
	.byte	0xd
	.uleb128 0x17
	.long	.LASF36
	.long	.LASF36
	.byte	0x5
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
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS1:
	.uleb128 .LVU19
	.uleb128 .LVU23
	.uleb128 .LVU23
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU82
	.uleb128 .LVU82
	.uleb128 .LVU85
	.uleb128 .LVU85
	.uleb128 .LVU87
	.uleb128 .LVU87
	.uleb128 .LVU89
	.uleb128 .LVU89
	.uleb128 0
.LLST1:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x5
	.byte	0x3
	.long	__chunkStack
	.long	.LVL6-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL25-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x5
	.byte	0x3
	.long	__chunkStack
	.long	.LVL27-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL29-.Ltext0
	.long	.LVL30-1-.Ltext0
	.value	0x5
	.byte	0x3
	.long	__chunkStack
	.long	.LVL30-1-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LVUS2:
	.uleb128 .LVU27
	.uleb128 .LVU74
	.uleb128 .LVU75
	.uleb128 .LVU87
.LLST2:
	.long	.LVL4-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL21-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x56
	.long	0
	.long	0
.LVUS3:
	.uleb128 .LVU29
	.uleb128 .LVU40
	.uleb128 .LVU40
	.uleb128 .LVU64
	.uleb128 .LVU64
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU68
	.uleb128 .LVU75
	.uleb128 .LVU79
	.uleb128 .LVU79
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU84
	.uleb128 .LVU85
	.uleb128 .LVU86
.LLST3:
	.long	.LVL5-.Ltext0
	.long	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 4
	.long	.LVL16-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 4
	.long	.LVL23-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LVUS4:
	.uleb128 .LVU30
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU63
	.uleb128 .LVU63
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU68
	.uleb128 .LVU75
	.uleb128 .LVU78
	.uleb128 .LVU78
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU82
	.uleb128 .LVU82
	.uleb128 .LVU85
	.uleb128 .LVU85
	.uleb128 .LVU87
.LLST4:
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL6-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x1
	.byte	0x57
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x1
	.byte	0x57
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x1
	.byte	0x57
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL23-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x57
	.long	.LVL25-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL27-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x57
	.long	0
	.long	0
.LVUS5:
	.uleb128 .LVU36
	.uleb128 .LVU39
	.uleb128 .LVU46
	.uleb128 .LVU56
	.uleb128 .LVU56
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU67
	.uleb128 .LVU75
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 .LVU82
	.uleb128 .LVU85
	.uleb128 .LVU87
.LLST5:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL10-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL13-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.long	.LVL21-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL27-.Ltext0
	.long	.LVL29-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	0
	.long	0
.LVUS6:
	.uleb128 .LVU36
	.uleb128 .LVU39
	.uleb128 .LVU49
	.uleb128 .LVU60
	.uleb128 .LVU60
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU67
	.uleb128 .LVU75
	.uleb128 .LVU82
.LLST6:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 0
	.byte	0x6
	.long	.LVL11-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x51
	.long	.LVL14-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 0
	.byte	0x6
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x3
	.byte	0x77
	.sleb128 0
	.byte	0x6
	.long	.LVL21-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x51
	.long	0
	.long	0
.LVUS7:
	.uleb128 .LVU36
	.uleb128 .LVU44
	.uleb128 .LVU50
	.uleb128 .LVU54
	.uleb128 .LVU54
	.uleb128 .LVU68
	.uleb128 .LVU75
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 .LVU82
.LLST7:
	.long	.LVL6-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x55
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL12-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x1
	.byte	0x55
	.long	.LVL21-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x55
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LVUS8:
	.uleb128 .LVU36
	.uleb128 .LVU40
	.uleb128 .LVU56
	.uleb128 .LVU67
	.uleb128 .LVU75
	.uleb128 .LVU81
.LLST8:
	.long	.LVL6-.Ltext0
	.long	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL13-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL21-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x52
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
.LASF34:
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
.LASF33:
	.string	"__roster_remove"
.LASF7:
	.string	"short int"
.LASF29:
	.string	"owner_reference"
.LASF11:
	.string	"restricted"
.LASF39:
	.string	"/Users/squijano/Documents/HAMprimeC2/compiler/libs/garbage"
.LASF22:
	.string	"__gc_dontClear__"
.LASF41:
	.string	"__PRETTY_FUNCTION__"
.LASF38:
	.string	"./chunks.c"
.LASF12:
	.string	"size"
.LASF42:
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
.LASF37:
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
.LASF40:
	.string	"__rc_exitChunk__"
.LASF35:
	.string	"free"
.LASF2:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF18:
	.string	"linked_chunks_t"
.LASF28:
	.string	"roster_entry"
.LASF1:
	.string	"long int"
.LASF6:
	.string	"signed char"
.LASF21:
	.string	"Roster"
.LASF14:
	.string	"roster_entry_t"
.LASF30:
	.string	"owner_points_to"
.LASF36:
	.string	"malloc"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
