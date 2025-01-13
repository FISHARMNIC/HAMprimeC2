
/*
********HAM PRIME**********
Compiled with love on Sun Jan 12 2025 17:40:00 GMT-0800 (Pacific Standard Time)
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
.type	something, @function
.global something
__ALLOCFOR_something__ = 4
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 4
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line:  ------- #
#//------- line: something function <  > ------- #
#//------- line: { ; ------- #
# {
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
something:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_something__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: 10 ------- #
	#//------- line: u8 [ 10 ] ------- #
	# pushing clobbers
	push %ecx
	# Asked for 10 allocations of "u8"
	pushl $0
	pushl $10
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %ecx
	#//------- line: create inner <- %ecx ------- #
	# creating variable "inner" of type "array:dynamic" stack?=true
	# Loading local variable "inner" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for inner (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: } ------- #
# }
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp

mov %ebp, %esp
pop %ebp
ret
# inner: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: 10 ------- #
	#//------- line: u8 [ 10 ] ------- #
	# pushing clobbers
	push %ecx
	# Asked for 10 allocations of "u8"
	pushl $0
	pushl $10
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %ecx
	#//------- line: create alpha <- %ecx ------- #
	# creating variable "alpha" of type "array:dynamic" stack?=true
	# Loading local variable "alpha" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for alpha (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: something (  ) ------- #
	# pushing clobbers
	# Calling function something
	call something
	mov %eax, %ecx
	# popping clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# alpha: 4

