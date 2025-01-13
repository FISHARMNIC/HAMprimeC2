
/*
********HAM PRIME**********
Compiled with love on Mon Jan 13 2025 12:00:56 GMT-0700 (Mountain Standard Time)
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
.type	inner, @function
.global inner
__ALLOCFOR_inner__ = 4
.type	medium, @function
.global medium
__ALLOCFOR_medium__ = 4
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 8
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line:  ------- #
#//------- line: inner function <  > ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
#//------- line: medium function <  > ------- #
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
inner:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_inner__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: 1 ------- #
	#//------- line: u32 [ 1 ] ------- #
	# pushing clobbers
	push %ecx
	# Asked for 1 allocations of "u32"
	pushl $0
	pushl $4
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %ecx
	#//------- line: create someAlloc <- %ecx ------- #
	# creating variable "someAlloc" of type "array:dynamic" stack?=true
	# Loading local variable "someAlloc" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for someAlloc (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: } ------- #
# }
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
# someAlloc: 4
medium:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_medium__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: 1 ------- #
	#//------- line: u32 [ 1 ] ------- #
	# pushing clobbers
	push %ecx
	# Asked for 1 allocations of "u32"
	pushl $0
	pushl $4
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %ecx
	#//------- line: create someAlloc <- %ecx ------- #
	# creating variable "someAlloc" of type "array:dynamic" stack?=true
	# Loading local variable "someAlloc" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for someAlloc (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line: inner (  ) ------- #
	# pushing clobbers
	# Calling function inner
	call inner
	mov %eax, %ecx
	# popping clobbers
	#//------- line: } ------- #
# }
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
# someAlloc: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: create bob ------- #
	# creating variable "bob" of type "u32:borrowed" stack?=true
	# Loading local variable "bob" @-4(%ebp) with "0"
	# optimized move from 0 to -4(%ebp)
	movl $0, -4(%ebp)
	#//------- line: 0 ------- #
	#//------- line: create i <- 0 ------- #
	# creating variable "i" of type "u32:borrowed" stack?=true
	# Loading local variable "i" @-8(%ebp) with "0"
	# optimized move from 0 to -8(%ebp)
	movl $0, -8(%ebp)
	__LABEL0__:
	#//------- line: i <: 100000 ------- #
	# note, read STACK VAR i -> -8(%ebp)
	mov -8(%ebp), %eax
	mov $0, %cl
	cmp $100000, %eax
	setl %cl
	#//------- line: while ( %cl ) ------- #
	# comparison for WHILE loop
	cmpb $1, %cl
	jne __LABEL1__
	#//------- line: { ; ------- #
	# {
		#//------- line: 1 ------- #
		#//------- line: u32 [ 1 ] ------- #
		# pushing clobbers
		push %ecx
		# Asked for 1 allocations of "u32"
		pushl $0
		pushl $4
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %ecx
		mov %eax, %ecx
		#//------- line: bob <- %ecx ------- #
		# SETTING bob <- %ecx
		# requesting ownership for bob (set). 
		lea -4(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line:  ------- #
		#//------- line: medium (  ) ------- #
		# pushing clobbers
		# Calling function medium
		call medium
		mov %eax, %ecx
		# popping clobbers
		#//------- line: i + 1 ------- #
		# note, read STACK VAR i -> -8(%ebp)
		mov -8(%ebp), %eax
		add $1, %eax
		mov %eax, %ecx
		#//------- line: i <- %ecx ------- #
		# SETTING i <- %ecx
		# optimized move from %ecx to -8(%ebp)
		mov %ecx, -8(%ebp)
		#//------- line: } ------- #
	# }
	jmp __LABEL0__
	__LABEL1__:
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# bob: 4
# i: 8

