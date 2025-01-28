
/*
********HAM PRIME**********
Compiled with love on Mon Jan 27 2025 21:02:39 GMT-0700 (Mountain Standard Time)
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
.type	modify, @function
.global modify
__ALLOCFOR_modify__ = 0
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 16
__TEMP32_0__: .4byte 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: array arr , u32 outer , u32 inner , u32 value ------- #
#//------- line: modify function < arr,,,outer,,,inner,,,value > -> u32 ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
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
modify:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_modify__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: outer ------- #
	# note, read PARAM outer -> 12(%ebp)
	#//------- line: inner ------- #
	# note, read PARAM inner -> 16(%ebp)
	#//------- line: value ------- #
	# note, read PARAM value -> 20(%ebp)
	#//------- line: arr [ 12(%ebp) ] [ 16(%ebp) ] <- 20(%ebp) ------- #
	# note, read PARAM arr -> 8(%ebp)
	# indexing array
	mov 8(%ebp), %eax
	# optimized move from 12(%ebp) to %edx
	# setting register "d" to "12(%ebp)"
	mov 12(%ebp), %edx
	mov %edx, %edx
	mov (%eax, %edx, 4), %ecx
	# Array set begin
	mov 20(%ebp), %edx
	# array load trash awful. Fix this bad optimize
	push %ecx
	mov 16(%ebp), %eax
	shl $2, %eax
	add (%esp), %eax
	add $4, %esp
	mov %edx, (%eax)
	#Set end
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

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { { 1 , 2 , 3 } , { 4 , 5 , 6 } , { 7 , 8 , 9 } } ------- #
	# {
		# {
		# }
		# Allocating array {1,2,3},{4,5,6},{7,8,9}}
		# pushing clobbers
		# Allocation for array
		pushl $0
		pushl $12
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		# optimized move from 1 to 0(%eax)
		movl $1, 0(%eax)
		# optimized move from 2 to 4(%eax)
		movl $2, 4(%eax)
		# optimized move from 3 to 8(%eax)
		movl $3, 8(%eax)
		# Moving arr to out
		# optimized move from %eax to %ecx
		mov %eax, %ecx
		# {
		# }
		# Allocating array {4,5,6},{7,8,9}}
		# pushing clobbers
		push %ecx
		# Allocation for array
		pushl $0
		pushl $12
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %ecx
		# optimized move from 4 to 0(%eax)
		movl $4, 0(%eax)
		# optimized move from 5 to 4(%eax)
		movl $5, 4(%eax)
		# optimized move from 6 to 8(%eax)
		movl $6, 8(%eax)
		# Moving arr to out
		# optimized move from %eax to %esi
		mov %eax, %esi
		# {
		# }
		# Allocating array {7,8,9}}
		# pushing clobbers
		push %esi
		push %ecx
		# Allocation for array
		pushl $0
		pushl $12
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %ecx
		pop %esi
		# optimized move from 7 to 0(%eax)
		movl $7, 0(%eax)
		# optimized move from 8 to 4(%eax)
		movl $8, 4(%eax)
		# optimized move from 9 to 8(%eax)
		movl $9, 8(%eax)
		# Moving arr to out
		# optimized move from %eax to %edi
		mov %eax, %edi
	# }
	# Allocating array {%ecx,%esi,%edi}
	# pushing clobbers
	push %esi
	push %ecx
	push %edi
	# Allocation for array
	pushl $0
	pushl $12
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %edi
	pop %ecx
	pop %esi
	# requesting ownership (setting array index on init)
	lea 0(%eax), %edx
	push %edx
	pushl %ecx
	call __rc_requestOwnership__
	add $8, %esp
	# requesting ownership (setting array index on init)
	lea 4(%eax), %edx
	push %edx
	pushl %esi
	call __rc_requestOwnership__
	add $8, %esp
	# requesting ownership (setting array index on init)
	lea 8(%eax), %edx
	push %edx
	pushl %edi
	call __rc_requestOwnership__
	add $8, %esp
	# Moving arr to out
	# optimized move from %eax to __TEMP32_0__
	mov %eax, __TEMP32_0__
	#//------- line: create arr <- __TEMP32_0__ ------- #
	# creating variable "arr" of type "array:dynamic" stack?=true
	# Loading local variable "arr" @-4(%ebp) with "__TEMP32_0__"
	# optimized move from __TEMP32_0__ to -4(%ebp)
	# setting register "d" to "__TEMP32_0__"
	movl __TEMP32_0__, %edx
	mov %edx, -4(%ebp)
	# requesting ownership for arr (create)
	lea -4(%ebp), %eax
	push %eax
	push __TEMP32_0__
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line: 2 ------- #
	#//------- line: { 3 , 2 , 1 } ------- #
	# {
	# }
	# Allocating array {3,2,1}
	# pushing clobbers
	# Allocation for array
	pushl $0
	pushl $12
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	# optimized move from 3 to 0(%eax)
	movl $3, 0(%eax)
	# optimized move from 2 to 4(%eax)
	movl $2, 4(%eax)
	# optimized move from 1 to 8(%eax)
	movl $1, 8(%eax)
	# Moving arr to out
	# optimized move from %eax to %ecx
	mov %eax, %ecx
	#//------- line: arr [ 2 ] <- %ecx ------- #
	# note, read STACK VAR arr -> -4(%ebp)
	# Array set begin
	mov -4(%ebp), %eax
	mov %ecx, 8(%eax)
	# requesting ownership for array index
	lea 8(%eax), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#Set end
	#//------- line: 0 ------- #
	#//------- line: 2 ------- #
	#//------- line: 7 ------- #
	#//------- line: arr [ 0 ] [ 2 ] <- 7 ------- #
	# note, read STACK VAR arr -> -4(%ebp)
	# indexing array
	mov -4(%ebp), %eax
	mov 0(%eax), %ecx
	# Array set begin
	movl $7, 8(%ecx)
	#Set end
	#//------- line: 1 ------- #
	#//------- line: 1 ------- #
	#//------- line: 7 ------- #
	#//------- line: arr [ 1 ] [ 1 ] <- 7 ------- #
	# note, read STACK VAR arr -> -4(%ebp)
	# indexing array
	mov -4(%ebp), %eax
	mov 4(%eax), %ecx
	# Array set begin
	movl $7, 4(%ecx)
	#Set end
	#//------- line: arr , 2 , 0 , 7 ------- #
	# note, read STACK VAR arr -> -4(%ebp)
	#//------- line: modify ( -4(%ebp),,,2,,,0,,,7 ) ------- #
	# pushing clobbers
	# Calling function modify
	pushl $7
	pushl $0
	pushl $2
	# TODO optimize if variable just do movl
	mov -4(%ebp), %edx
	push %edx
	call modify
	mov %eax, %ecx
	add $16, %esp
	# popping clobbers
	# clobbering "c"
	# creating variable "__LABEL2__" of type "u32:borrowed" stack?=true
	# Loading local variable "__LABEL2__" @-8(%ebp) with "0"
	# optimized move from 0 to -8(%ebp)
	movl $0, -8(%ebp)
	# creating variable "__LABEL4__" of type "u32:borrowed" stack?=true
	# Loading local variable "__LABEL4__" @-12(%ebp) with "0"
	# optimized move from 0 to -12(%ebp)
	movl $0, -12(%ebp)
	#//------- line: sub in arr ------- #
	# note, read STACK VAR arr -> -4(%ebp)
	#//------- line: forEach ( sub,in,-4(%ebp) ) ------- #
	# forEach loop
	mov -4(%ebp), %eax # load arr
	mov -4(%eax), %edx # get entry reference
	mov 8(%edx),  %edx # get size
	shr $2, %edx # divide by 4 (bytes to u32 or u16)
	mov %edx, -12(%ebp) # size to arr len holder
	mov (%eax), %eax # load first element into A
	# creating variable "sub" of type "array:dynamic" stack?=true
	mov %eax, %ecx
	# Loading local variable "sub" @-16(%ebp) with "%ecx"
	# optimized move from %ecx to -16(%ebp)
	mov %ecx, -16(%ebp)
	__LABEL0__:
	# comparison for forEach loop
	mov -8(%ebp), %eax 
	cmp -12(%ebp), %eax
	jge __LABEL1__ # exit if finished
	# indexing array
	mov -4(%ebp), %eax
	# optimized move from -8(%ebp) to %edx
	# setting register "d" to "-8(%ebp)"
	mov -8(%ebp), %edx
	mov %edx, %edx
	mov (%eax, %edx, 4), %esi
	mov %esi, -16(%ebp)
	#//------- line: { ; ------- #
	# {
		#//------- line: sub ------- #
		# note, read STACK VAR sub -> -16(%ebp)
		#//------- line: print_ ( -16(%ebp) ) ------- #
		# pushing multi-line clobbers
		# printing array
		mov -16(%ebp), %eax
		push %eax     # load buffer
		mov -4(%eax), %edx
		pushl 8(%edx) # load size
		call print_arr32
		add $8, %esp
		# popping multi-line clobbers
		#//------- line: } ------- #
	# }
	__LABEL3__: # forEach "continue" jumps here
	incw -8(%ebp)
	jmp __LABEL0__
	__LABEL1__:
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# arr: 4
# __LABEL2__: 8
# __LABEL4__: 12
# sub: 16

