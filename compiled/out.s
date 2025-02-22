
/*
********HAM PRIME**********
Compiled with love on Tue Feb 18 2025 12:04:35 GMT-0700 (Mountain Standard Time)
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
.4byte 4
__STRING0__: .asciz "jon"
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
	#//------- line: "jon" ------- #
	#//------- line: create jon <- __STRING0__ ------- #
	# creating variable "jon" of type "conststr:borrowed" stack?=true
	# converting conststr "__STRING0__" to dynamic string
	pushl $__STRING0__
	call cptos
	add $4, %esp
	mov %eax, %ecx
	# Loading local variable "jon" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for jon (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: jon , 4 ------- #
	# note, read STACK VAR jon -> -4(%ebp)
	#//------- line: 'b' ------- #
	#//------- line: @ ( -4(%ebp),,,4 ) <- 98 ------- #
	# Setting pointer 98 -> -4(%ebp),,,4
	lea -4(%ebp),,,4, %eax
	mov $98, %edx
	movl %edx, (%eax)
	

	#//------- line: jon ------- #
	# note, read STACK VAR jon -> -4(%ebp)
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
# jon: 4

