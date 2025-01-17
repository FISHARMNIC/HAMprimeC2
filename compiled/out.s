
/*
********HAM PRIME**********
Compiled with love on Fri Jan 17 2025 15:42:34 GMT-0700 (Mountain Standard Time)
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
.type	testLam, @function
.global testLam
__ALLOCFOR_testLam__ = 0
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 4
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
__ALLOCFOR___anonymous_a____ = 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: fn lam ------- #
#//------- line: testLam function < lam > -> none ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
#//------- line: entry function <  > -> u32 ------- #
#//------- line: { ; ------- #
# {
# auto-return OK for entry function
#//------- line:  ------- #
#//------- line: __lambda__ __anonymous_a__ function <  > -> auto ------- #
#//------- line: { ------- #
# {
ret
.global __init_for_out__
###################################

.global main
main:
call __init_for_out__
call entry
ret

###################################
testLam:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_testLam__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line:  ------- #
	#//------- line: lam (  ) ------- #
	# note, read PARAM lam -> 8(%ebp)
	# pushing clobbers
	# Calling function __not_a_function__
	call *8(%ebp)
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { 123 , 456 } ------- #
	# {
	# }
	# Allocating array {123,456}
	# pushing clobbers
	# Allocation for array
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	# optimized move from 123 to 0(%eax)
	movl $123, 0(%eax)
	# optimized move from 456 to 4(%eax)
	movl $456, 4(%eax)
	# Moving arr to out
	# optimized move from %eax to %ecx
	mov %eax, %ecx
	#//------- line: create bob <- %ecx ------- #
	# creating variable "bob" of type "array:dynamic" stack?=true
	# Loading local variable "bob" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for bob (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: __asm__ "pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__" ------- #
	pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
	#//------- line: $ __anonymous_a__ ------- #
	# reading address of __anonymous_a__
	lea __anonymous_a__, %ecx
	#//------- line: testLam ( %ecx ) ------- #
	# pushing clobbers
	push %ecx
	# Calling function testLam
	push %ecx
	call testLam
	mov %eax, %esi
	add $4, %esp
	# popping clobbers
	pop %ecx
	#//------- line: __asm__ "popl __anonymous_a__ebpCapture__" ------- #
	popl __anonymous_a__ebpCapture__
	#//------- line: bob ------- #
	# note, read STACK VAR bob -> -4(%ebp)
	#//------- line: print_ ( -4(%ebp) ) ------- #
	# pushing multi-line clobbers
	# printing array
	mov -4(%ebp), %eax
	push %eax     # load buffer
	mov -4(%eax), %edx
	pushl 8(%edx) # load size
	call print_arr32
	add $8, %esp
	# popping multi-line clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# bob: 4
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { 456 , 789 } ------- #
	# {
	# }
	# Allocating array {456,789}
	# pushing clobbers
	push %ecx
	# Allocation for array
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	# optimized move from 456 to 0(%eax)
	movl $456, 0(%eax)
	# optimized move from 789 to 4(%eax)
	movl $789, 4(%eax)
	# Moving arr to out
	# optimized move from %eax to %esi
	mov %eax, %esi
	#//------- line: bob <- %esi ------- #
	# SETTING bob <- %esi
	# requesting ownership for bob (set). 
	lea -4(%ecx), %eax
	push %eax
	push %esi
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

