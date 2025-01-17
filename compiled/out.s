
/*
********HAM PRIME**********
Compiled with love on Thu Jan 16 2025 17:25:33 GMT-0700 (Mountain Standard Time)
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
.type	testLam, @function
.global testLam
__ALLOCFOR_testLam__ = 0
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 8
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 4
__STRING3__: .asciz "Joe"
.4byte 4
__STRING4__: .asciz "Jim"
__ALLOCFOR___anonymous_a____ = 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: Person format ------- #
#//------- line: { ; ------- #
# {
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
	#//------- line: . name string ------- #
	#//------- line: . age u32 ------- #
	#//------- line:  ------- #
	#//------- line: . toString method <  > -> auto ------- #
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
testLam:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_testLam__, %esp # total stack allocation

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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

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
	#//------- line: create Person : array jon ------- #
	# creating variable "jon" of type "array:dynamic" stack?=true
	# Loading local variable "jon" @-8(%ebp) with "0"
	# optimized move from 0 to -8(%ebp)
	movl $0, -8(%ebp)
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
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: __rc_collect__ (  ) ------- #
	# pushing clobbers
	# Calling function __rc_collect__
	call __rc_collect__
	mov %eax, %ecx
	# popping clobbers
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
	#//------- line: jon ------- #
	# note, read STACK VAR jon -> -8(%ebp)
	#//------- line: print_ ( -8(%ebp) ) ------- #
	# pushing multi-line clobbers
	# printing array (either string or format array)
	mov -8(%ebp), %eax
	push %eax     # load buffer
	mov -4(%eax), %edx
	pushl 8(%edx) # load size
	pushl $__method_Person_toString_ # load toString method
	call print_formatArr
	add $12, %esp
	# popping multi-line clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# bob: 4
# jon: 8
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

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
	#//------- line: 2 ------- #
	#//------- line: Person [ 2 ] ------- #
	# pushing clobbers
	push %esi
	push %ecx
	# Asked for 2 allocations of "Person"
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	pop %esi
	mov %eax, %esi
	#//------- line: jon <- %esi ------- #
	# SETTING jon <- %esi
	# requesting ownership for jon (set). 
	lea -8(%ecx), %eax
	push %eax
	push %esi
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 0 ------- #
	#//------- line: name : "Joe" , age : 123 ------- #
	#//------- line: Person < name,:,__STRING3__,,,age,:,123 > ------- #
	# pushing clobbers
	push %ecx
	# 
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %esi # Local allocation address for Person
	# char lit to string (explicit format init)
	pushl $__STRING3__
	call cptos
	add $4, %esp
	# requesting ownership (setting sub property)
	lea 0(%esi), %edx
	push %edx
	push %eax
	call __rc_requestOwnership__
	add $8, %esp
	# optimized move from 123 to 4(%eax)
	movl $123, 4(%eax)
	#//------- line: jon [ 0 ] <- %esi ------- #
	# Array set begin
	mov -8(%ecx), %eax
	mov %esi, 0(%eax)
	# requesting ownership for array index
	lea 0(%eax), %eax
	push %eax
	push %esi
	call __rc_requestOwnership__
	add $8, %esp
	#Set end
	#//------- line: 1 ------- #
	#//------- line: name : "Jim" , age : 456 ------- #
	#//------- line: Person < name,:,__STRING4__,,,age,:,456 > ------- #
	# pushing clobbers
	push %ecx
	# 
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %esi # Local allocation address for Person
	# char lit to string (explicit format init)
	pushl $__STRING4__
	call cptos
	add $4, %esp
	# requesting ownership (setting sub property)
	lea 0(%esi), %edx
	push %edx
	push %eax
	call __rc_requestOwnership__
	add $8, %esp
	# optimized move from 456 to 4(%eax)
	movl $456, 4(%eax)
	#//------- line: jon [ 1 ] <- %esi ------- #
	# Array set begin
	mov -8(%ecx), %eax
	mov %esi, 4(%eax)
	# requesting ownership for array index
	lea 4(%eax), %eax
	push %eax
	push %esi
	call __rc_requestOwnership__
	add $8, %esp
	#Set end
	#//------- line: } ------- #
# }
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

