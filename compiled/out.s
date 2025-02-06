
/*
********HAM PRIME**********
Compiled with love on Thu Feb 06 2025 14:45:08 GMT-0700 (Mountain Standard Time)
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
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (u32) age
#   - PROPERTY (p8) name
__SIZEOF_Student__ = 8
# format "Student" includes:
#   - PROPERTY (p0) info
#   - PROPERTY (u32) id
.type	giveNewID, @function
.global giveNewID
__ALLOCFOR_giveNewID__ = 0
.type	entry, @function
.global entry
.4byte 4
__STRING0__: .asciz "bob"
.4byte 42
__STRING1__: .asciz "The student %s (id #%i) is %i years old\n"
__ALLOCFOR_entry__ = 4
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
__TEMP32_2__: .4byte 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: Person format ------- #
#//------- line: { ; ------- #
# {
#//------- line: Student format ------- #
#//------- line: { ; ------- #
# {
#//------- line: Student stud , u32 new_id ------- #
#//------- line: giveNewID function < stud,,,new_id > -> u32 ------- #
#//------- line: { ; ------- #
# {
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
	#//------- line: . age u32 ------- #
	#//------- line: . name p8 ------- #
	#//------- line: } ------- #
# }
	#//------- line: . info Person ------- #
	#//------- line: . id u32 ------- #
	#//------- line: } ------- #
# }
giveNewID:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_giveNewID__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: new_id ------- #
	# note, read PARAM new_id -> 12(%ebp)
	#//------- line: stud . id <- 12(%ebp) ------- #
	# note, read PARAM stud -> 8(%ebp)
	# Reading property "id" in "8(%ebp)"
	movl 8(%ebp), %eax
	# optimized move from 12(%ebp) to 4(%eax)
	# setting register "d" to "12(%ebp)"
	mov 12(%ebp), %edx
	mov %edx, 4(%eax)
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
	#//------- line: age : 15 , name : "bob" ------- #
	#//------- line: id : 123 , info : Person < age,:,15,,,name,:,__STRING0__ > ------- #
	# pushing clobbers
	# 
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	mov %eax, %ecx # Local allocation address for Person
	# optimized move from 15 to 0(%ecx)
	movl $15, 0(%ecx)
	# optimized move from __STRING0__ to 4(%ecx)
	mov $__STRING0__, %edx
	mov %edx, 4(%ecx)
	#//------- line: Student < id,:,123,,,info,:,%ecx > ------- #
	# pushing clobbers
	push %ecx
	# 
	pushl $0
	pushl $8
	call __rc_allocate__
	add $8, %esp
	# popping clobbers
	pop %ecx
	mov %eax, %esi # Local allocation address for Student
	# requesting ownership (setting sub property)
	# POOOP
	lea 0(%esi), %edx
	push %edx
	pushl %ecx
	call __rc_requestOwnership__
	add $8, %esp
	# optimized move from 123 to 4(%esi)
	movl $123, 4(%esi)
	#//------- line: create bob <- %esi ------- #
	# creating variable "bob" of type "Student:dynamic" stack?=true
	# Loading local variable "bob" @-4(%ebp) with "%esi"
	# optimized move from %esi to -4(%ebp)
	mov %esi, -4(%ebp)
	# requesting ownership for bob (create)
	lea -4(%ebp), %eax
	push %eax
	push %esi
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: bob , 321 ------- #
	# note, read STACK VAR bob -> -4(%ebp)
	#//------- line: giveNewID ( -4(%ebp),,,321 ) ------- #
	# pushing clobbers
	# Calling function giveNewID
	pushl $321
	# TODO optimize if variable just do movl
	mov -4(%ebp), %edx
	push %edx
	call giveNewID
	mov %eax, %ecx
	add $8, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: 16 ------- #
	#//------- line: bob . info . age <- 16 ------- #
	# note, read STACK VAR bob -> -4(%ebp)
	# Reading property "info" in "-4(%ebp)"
	movl -4(%ebp), %eax
	# optimized move from 0(%eax) to %ecx
	# setting register "d" to "0(%eax)"
	mov 0(%eax), %edx
	mov %edx, %ecx
	# Reading property "age" in "%ecx"
	# optimized move from 16 to 0(%ecx)
	movl $16, 0(%ecx)
	#//------- line: "The student %s (id #%i) is %i years old\n" , bob . info . name , bob . id , bob . info . age ------- #
	# note, read STACK VAR bob -> -4(%ebp)
	# Reading property "info" in "-4(%ebp)"
	movl -4(%ebp), %eax
	# optimized move from 0(%eax) to %ecx
	# setting register "d" to "0(%eax)"
	mov 0(%eax), %edx
	mov %edx, %ecx
	# Reading property "name" in "%ecx"
	# optimized move from 4(%ecx) to %esi
	# setting register "d" to "4(%ecx)"
	mov 4(%ecx), %edx
	mov %edx, %esi
	# note, read STACK VAR bob -> -4(%ebp)
	# Reading property "id" in "-4(%ebp)"
	movl -4(%ebp), %eax
	# optimized move from 4(%eax) to %edi
	# setting register "d" to "4(%eax)"
	mov 4(%eax), %edx
	mov %edx, %edi
	# note, read STACK VAR bob -> -4(%ebp)
	# Reading property "info" in "-4(%ebp)"
	movl -4(%ebp), %eax
	# optimized move from 0(%eax) to __TEMP32_0__
	# setting register "d" to "0(%eax)"
	mov 0(%eax), %edx
	mov %edx, __TEMP32_0__
	# Reading property "age" in "__TEMP32_0__"
	movl __TEMP32_0__, %eax
	# optimized move from 0(%eax) to __TEMP32_1__
	# setting register "d" to "0(%eax)"
	mov 0(%eax), %edx
	mov %edx, __TEMP32_1__
	#//------- line: printf ( __STRING1__,,,%esi,,,%edi,,,__TEMP32_1__ ) ------- #
	# pushing clobbers
	push %esi
	push %ecx
	push %edi
	# Calling function printf
	# TODO optimize if variable just do movl
	mov __TEMP32_1__, %edx
	push %edx
	push %edi
	push %esi
	pushl $__STRING1__
	call printf
	mov %eax, __TEMP32_2__
	add $16, %esp
	# popping clobbers
	pop %edi
	pop %ecx
	pop %esi
	# clobbering "__TEMP32_2__"
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
# bob: 4

