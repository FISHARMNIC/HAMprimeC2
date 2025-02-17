
/*
********HAM PRIME**********
Compiled with love on Sun Feb 16 2025 00:41:58 GMT-0700 (Mountain Standard Time)
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
.4byte 0xDA8A
.4byte 6
__STRING0__: .asciz "HELLO "
.4byte 0xDA8A
.4byte 4
__STRING1__: .asciz "ABC "
.4byte 0xDA8A
.4byte 5
__STRING2__: .asciz " BOB "
__ALLOCFOR_entry__ = 8
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: u32 sz ------- #
#//------- line: forward __rc_allocate_str__ function < sz > -> p32 ------- #
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
	#//------- line: "HELLO " ------- #
	#//------- line: create someStr <- __STRING0__ ------- #
	# creating variable "someStr" of type "conststr:borrowed" stack?=true
	# converting conststr "__STRING0__" to dynamic string
	pushl $__STRING0__
	call cptos
	add $4, %esp
	mov %eax, %ecx
	# Loading local variable "someStr" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for someStr (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: someStr + "ABC " + 123 + " BOB " + 123 . 456 ------- #
	# note, read STACK VAR someStr -> -4(%ebp)
	# setting register "c" to "1123477881"
	mov $1123477881, %ecx
	pushw __disable_gc__; movw $1, __disable_gc__
	push %ecx
	call ftos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING2__"
	movl $__STRING2__, %edx
	push %edx
	pushl $123
	call itos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	push -4(%ebp)
	pushl $5
	call strjoinmany
	add $24, %esp
	mov %eax, %esi
	popw __disable_gc__
	#//------- line: create something <- %esi ------- #
	# creating variable "something" of type "string:dynamic" stack?=true
	# Loading local variable "something" @-8(%ebp) with "%esi"
	# optimized move from %esi to -8(%ebp)
	mov %esi, -8(%ebp)
	# requesting ownership for something (create)
	lea -8(%ebp), %eax
	push %eax
	push %esi
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: something ------- #
	# note, read STACK VAR something -> -8(%ebp)
	#//------- line: print_ ( -8(%ebp) ) ------- #
	# pushing multi-line clobbers
	push -8(%ebp)
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
# someStr: 4
# something: 8

