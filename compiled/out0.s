
/*
********HAM PRIME**********
Compiled with love on Sun Jan 12 2025 17:03:11 GMT-0800 (Pacific Standard Time)
**************************
*/

.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
.align 4

.extern __disable_gc__
.extern __rc_triggerSegfaultOnNullOwnership__
.extern __PRINT_TYPE_INT__
.extern __this__
.extern __xmm_sse_temp__
.extern ___TEMPORARY_OWNER___

######## user data section ########
.type	entry, @function
.global entry
.4byte 5
__STRING0__: .asciz "%u\n"
__STRING1__: .asciz "%u %u\n"
__ALLOCFOR_entry__ = 10
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line:  ------- #
#//------- line: entry function <  > ------- #
#//------- line: { ; ------- #
# {
# auto-return OK for entry function
ret
.global __init_for_out__
###################################

.global main
main:
call __init_for_out__
call entry
ret

###################################

jon:
	push %ebp
	mov %esp, %ebp

	mov %ebp, %eax
	add $8, %eax

	mov (%ebp), %ebx

	push %ebx
	push %eax
	pushl $__STRING1__
	call printf
	mov %eax, %ecx
	add $8, %esp

	mov %ebp, %esp
	pop %ebp
	ret

entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: "hi\n" ------- #
	#//------- line: printf ( __STRING0__ ) ------- #
	# pushing clobbers
	# Calling function printf
	mov %esp, %eax
	push %eax
	pushl $__STRING0__
	call printf
	mov %eax, %ecx
	add $8, %esp

	call jon
	# popping clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret

