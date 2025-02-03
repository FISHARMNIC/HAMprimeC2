
/*
********HAM PRIME**********
Compiled with love on Sun Feb 02 2025 22:40:37 GMT-0700 (Mountain Standard Time)
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
__STRING0__: .asciz "abc "
.4byte 5
__STRING1__: .asciz " def"
__ALLOCFOR_entry__ = 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: entry function <  > -> u32 ------- #
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: `abc ${123 + 456} def` ------- #
	pushw __disable_gc__; movw $1, __disable_gc__
	#//------- line: 123 + 456 ------- #
	mov $123, %eax
	add $456, %eax
	mov %eax, %ecx
	#//------- line: %ecx ------- #
	#//------- line: "abc " ------- #
	#//------- line: " def" ------- #
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	push %ecx
	call itos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING0__"
	movl $__STRING0__, %edx
	push %edx
	pushl $3
	call strjoinmany
	add $16, %esp
	mov %eax, %esi
	popw __disable_gc__
	#//------- line: print_ ( %esi ) ------- #
	# pushing multi-line clobbers
	push %esi
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret

