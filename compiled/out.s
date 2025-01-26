
/*
********HAM PRIME**********
Compiled with love on Sat Jan 25 2025 20:40:33 GMT-0700 (Mountain Standard Time)
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
__STRING3__: .asciz "abc"
.4byte 4
__STRING4__: .asciz "def"
.4byte 4
__STRING5__: .asciz "gih"
.4byte 4
__STRING6__: .asciz "jkl"
.4byte 4
__STRING7__: .asciz "mno"
.4byte 4
__STRING8__: .asciz "pqr"
.4byte 4
__STRING9__: .asciz "stu"
__ALLOCFOR_entry__ = 4
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
__TEMP32_2__: .4byte 0
__TEMP32_3__: .4byte 0
__TEMP32_4__: .4byte 0
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
	#//------- line: . toString method <  > ------- #
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
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
	#//------- line: } ------- #
# }
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: name : "abc" , age : 1 ------- #
	#//------- line: name : "def" , age : 2 ------- #
	#//------- line: name : "gih" , age : 3 ------- #
	#//------- line: name : "jkl" , age : 4 ------- #
	#//------- line: name : "mno" , age : 5 ------- #
	#//------- line: name : "pqr" , age : 6 ------- #
	#//------- line: name : "stu" , age : 7 ------- #
	#//------- line: { ; Person < name,:,__STRING3__,,,age,:,1 > , ; Person < name,:,__STRING4__,,,age,:,2 > , ; Person < name,:,__STRING5__,,,age,:,3 > , ; Person < name,:,__STRING6__,,,age,:,4 > , ; Person < name,:,__STRING7__,,,age,:,5 > , ; Person < name,:,__STRING8__,,,age,:,6 > , ; Person < name,:,__STRING9__,,,age,:,7 > , ; } ------- #
	# {
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
		# optimized move from 1 to 4(%ecx)
		movl $1, 4(%ecx)
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
		# optimized move from 2 to 4(%esi)
		movl $2, 4(%esi)
		# pushing clobbers
		push %esi
		push %ecx
		# 
		pushl $0
		pushl $8
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %ecx
		pop %esi
		mov %eax, %edi # Local allocation address for Person
		# char lit to string (explicit format init)
		pushl $__STRING5__
		call cptos
		add $4, %esp
		# requesting ownership (setting sub property)
		lea 0(%edi), %edx
		push %edx
		push %eax
		call __rc_requestOwnership__
		add $8, %esp
		# optimized move from 3 to 4(%edi)
		movl $3, 4(%edi)
		# pushing clobbers
		push %esi
		push %ecx
		push %edi
		# 
		pushl $0
		pushl $8
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %edi
		pop %ecx
		pop %esi
		mov %eax, __TEMP32_0__ # Local allocation address for Person
		# char lit to string (explicit format init)
		pushl $__STRING6__
		call cptos
		add $4, %esp
		# requesting ownership (setting sub property)
		lea 0(__TEMP32_0__), %edx
		push %edx
		push %eax
		call __rc_requestOwnership__
		add $8, %esp
		# optimized move from 4 to 4(__TEMP32_0__)
		movl $4, 4(__TEMP32_0__)
		# pushing clobbers
		push %esi
		push %ecx
		push %edi
		# 
		pushl $0
		pushl $8
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %edi
		pop %ecx
		pop %esi
		mov %eax, __TEMP32_1__ # Local allocation address for Person
		# char lit to string (explicit format init)
		pushl $__STRING7__
		call cptos
		add $4, %esp
		# requesting ownership (setting sub property)
		lea 0(__TEMP32_1__), %edx
		push %edx
		push %eax
		call __rc_requestOwnership__
		add $8, %esp
		# optimized move from 5 to 4(__TEMP32_1__)
		movl $5, 4(__TEMP32_1__)
		# pushing clobbers
		push %esi
		push %ecx
		push %edi
		# 
		pushl $0
		pushl $8
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %edi
		pop %ecx
		pop %esi
		mov %eax, __TEMP32_2__ # Local allocation address for Person
		# char lit to string (explicit format init)
		pushl $__STRING8__
		call cptos
		add $4, %esp
		# requesting ownership (setting sub property)
		lea 0(__TEMP32_2__), %edx
		push %edx
		push %eax
		call __rc_requestOwnership__
		add $8, %esp
		# optimized move from 6 to 4(__TEMP32_2__)
		movl $6, 4(__TEMP32_2__)
		# pushing clobbers
		push %esi
		push %ecx
		push %edi
		# 
		pushl $0
		pushl $8
		call __rc_allocate__
		add $8, %esp
		# popping clobbers
		pop %edi
		pop %ecx
		pop %esi
		mov %eax, __TEMP32_3__ # Local allocation address for Person
		# char lit to string (explicit format init)
		pushl $__STRING9__
		call cptos
		add $4, %esp
		# requesting ownership (setting sub property)
		lea 0(__TEMP32_3__), %edx
		push %edx
		push %eax
		call __rc_requestOwnership__
		add $8, %esp
		# optimized move from 7 to 4(__TEMP32_3__)
		movl $7, 4(__TEMP32_3__)
	# }
	# Allocating array {;%ecx,;%esi,;%edi,;__TEMP32_0__,;__TEMP32_1__,;__TEMP32_2__,;__TEMP32_3__,;}
	# pushing clobbers
	push %esi
	push %ecx
	push %edi
	# Allocation for array
	pushl $0
	pushl $28
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
	# requesting ownership (setting array index on init)
	lea 12(%eax), %edx
	push %edx
	pushl __TEMP32_0__
	call __rc_requestOwnership__
	add $8, %esp
	# requesting ownership (setting array index on init)
	lea 16(%eax), %edx
	push %edx
	pushl __TEMP32_1__
	call __rc_requestOwnership__
	add $8, %esp
	# requesting ownership (setting array index on init)
	lea 20(%eax), %edx
	push %edx
	pushl __TEMP32_2__
	call __rc_requestOwnership__
	add $8, %esp
	# requesting ownership (setting array index on init)
	lea 24(%eax), %edx
	push %edx
	pushl __TEMP32_3__
	call __rc_requestOwnership__
	add $8, %esp
	# Moving arr to out
	# optimized move from %eax to __TEMP32_4__
	mov %eax, __TEMP32_4__
	#//------- line: ( __TEMP32_4__ ) ------- #
	#//------- line: create people <- __TEMP32_4__ ------- #
	# creating variable "people" of type "array:dynamic" stack?=true
	# Loading local variable "people" @-4(%ebp) with "__TEMP32_4__"
	# optimized move from __TEMP32_4__ to -4(%ebp)
	# setting register "d" to "__TEMP32_4__"
	movl __TEMP32_4__, %edx
	mov %edx, -4(%ebp)
	# requesting ownership for people (create)
	lea -4(%ebp), %eax
	push %eax
	push __TEMP32_4__
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: __rc_collect__ (  ) ------- #
	# pushing clobbers
	# Calling function __rc_collect__
	call __rc_collect__
	mov %eax, %ecx
	# popping clobbers
	#//------- line:  ------- #
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
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# people: 4

