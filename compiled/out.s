
/*
********HAM PRIME**********
Compiled with love on Fri Jan 17 2025 17:11:05 GMT-0700 (Mountain Standard Time)
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
.type	__method_Person_toString_, @function
.global __method_Person_toString_
.4byte 7
__STRING0__: .asciz "name: "
.4byte 8
__STRING1__: .asciz ", age: "
.4byte 1
__STRING2__: .asciz ""
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	entry, @function
.global entry
.4byte 4
__STRING3__: .asciz "Bob"
__ALLOCFOR_entry__ = 4
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: Person format ------- #
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
	#//------- line: . name string ------- #
	#//------- line: . age u32 ------- #
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: . toString method <  > ------- #
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp # total stack allocation

	#//------- line: { ; ------- #
	# {
		#//------- line: `name: ${this.name}, age: ${this.age}` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: this . name ------- #
		# Reading property "name" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: this . age ------- #
		# Reading property "age" in "__this__"
		movl __this__, %eax
		# optimized move from 4(%eax) to %esi
		# setting register "d" to "4(%eax)"
		mov 4(%eax), %edx
		mov %edx, %esi
		#//------- line: "name: " ------- #
		#//------- line: ", age: " ------- #
		#//------- line: "" ------- #
		# setting register "d" to "__STRING2__"
		movl $__STRING2__, %edx
		push %edx
		push %esi
		call itos
		add $4, %esp
		push %eax
		# setting register "d" to "__STRING1__"
		movl $__STRING1__, %edx
		push %edx
		push %ecx
		# setting register "d" to "__STRING0__"
		movl $__STRING0__, %edx
		push %edx
		pushl $5
		call strjoinmany
		add $24, %esp
		mov %eax, %edi
		popw __disable_gc__
		#//------- line: return ( %edi ) ------- #
		# optimized move from %edi to __gc_dontClear__
		mov %edi, __gc_dontClear__
		# setting register "a" to "%edi"
		mov %edi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
		#//------- line: } ------- #
	# }
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
	#//------- line: } ------- #
# }
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

	#//------- line: 1 ------- #
	#//------- line: Person [ 1 ] ------- #
	# pushing clobbers
	push %ecx
	# Asked for 1 allocations of "Person"
	pushl $0
	pushl $4
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %ecx
	#//------- line: create people <- %ecx ------- #
	# creating variable "people" of type "array:dynamic" stack?=true
	# Loading local variable "people" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for people (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 0 ------- #
	#//------- line: name : "Bob" , age : 124 ------- #
	#//------- line: Person < name,:,__STRING3__,,,age,:,124 > ------- #
	# pushing clobbers
	# 
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	mov %eax, %ecx # Local allocation address for Person
	# char lit to string (explicit format init)
	pushl $__STRING3__
	call cptos
	add $4, %esp
	# requesting ownership (setting sub property)
	lea 0(%ecx), %edx
	push %edx
	push %eax
	call __rc_requestOwnership__
	add $8, %esp
	# optimized move from 124 to 4(%ecx)
	movl $124, 4(%ecx)
	#//------- line: people [ 0 ] <- %ecx ------- #
	# note, read STACK VAR people -> -4(%ebp)
	# Array set begin
	mov -4(%ebp), %eax
	mov %ecx, 0(%eax)
	# requesting ownership for array index
	lea 0(%eax), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#Set end
	#//------- line: people ------- #
	# note, read STACK VAR people -> -4(%ebp)
	#//------- line: print_ ( -4(%ebp) ) ------- #
	# pushing multi-line clobbers
	# printing array (either string or format array)
	mov -4(%ebp), %eax
	push %eax     # load buffer
	mov -4(%eax), %edx
	pushl 8(%edx) # load size
	pushl $__method_Person_toString_ # load toString method
	call print_formatArr
	add $12, %esp
	# popping multi-line clobbers
	#//------- line: return 0 ------- #
	#//------- line: 0 ------- #
	# setting register "a" to "0"
	mov $0, %eax
	# auto-return OK for entry function
push %eax
call __rc_free_all__
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# people: 4

