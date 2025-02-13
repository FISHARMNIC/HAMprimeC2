
/*
********HAM PRIME**********
Compiled with love on Thu Feb 13 2025 10:59:32 GMT-0700 (Mountain Standard Time)
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
__STRING0__: .asciz "ABC "
.4byte 6
__STRING1__: .asciz " BOB "
__ALLOCFOR_entry__ = 4
###################################
.text

#### compiler initation section ###
__init_for_out__:

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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: "ABC " + 123 + " BOB " + 123 . 456 ------- #
	# setting register "c" to "1123477881"
	mov $1123477881, %ecx
	pushw __disable_gc__; movw $1, __disable_gc__
	push %ecx
	call ftos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	pushl $123
	call itos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING0__"
	movl $__STRING0__, %edx
	push %edx
	pushl $4
	call strjoinmany
	add $20, %esp
	mov %eax, %esi
	popw __disable_gc__
	#//------- line: create something <- %esi ------- #
	# creating variable "something" of type "string:dynamic" stack?=true
	# Loading local variable "something" @-4(%ebp) with "%esi"
	# optimized move from %esi to -4(%ebp)
	mov %esi, -4(%ebp)
	# requesting ownership for something (create)
	lea -4(%ebp), %eax
	push %eax
	push %esi
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: something ------- #
	# note, read STACK VAR something -> -4(%ebp)
	#//------- line: print_ ( -4(%ebp) ) ------- #
	# pushing multi-line clobbers
	push -4(%ebp)
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
# something: 4

