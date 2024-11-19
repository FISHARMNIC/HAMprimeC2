
/*
********HAM PRIME**********
Compiled with love on Tue Nov 19 2024 01:42:19 GMT-0700 (Mountain Standard Time)
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
.type	doOperation, @function
.global doOperation
__ALLOCFOR_doOperation__ = 0
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 6
__STRING0__: .asciz "pb * "
.4byte 4
__STRING1__: .asciz " = "
.4byte 1
__STRING2__: .asciz ""
.4byte 20
__STRING3__: .asciz "Lambda called with "
.4byte 6
__STRING4__: .asciz " and "
__ALLOCFOR___anonymous_a____ = 4
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 0
###################################
.text

#### compiler initation section ###
__init_for_out__:


ret
.global __init_for_out__
###################################

.global main
main:
call __init_for_out__
call entry
ret

###################################
doOperation:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_doOperation__, %esp

# note, read PARAM a -> 8(%ebp)
# note, read PARAM b -> 12(%ebp)
# note, read PARAM operation -> 16(%ebp)
# Calling function __not_a_function__
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call *16(%ebp)
mov %eax, %ecx
add $8, %esp
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__anonymous_a__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp

# Loading local variable "c" @-4(%ebp)
mov $1, %edx
mov %edx, -4(%ebp)
__LABEL0__:
# note, read STACK VAR c -> -4(%ebp)
# note, read PARAM pa -> 8(%ebp)
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setle %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
pushw __disable_gc__; movw $1, __disable_gc__
# note, read STACK VAR c -> -4(%ebp)
# note, read PARAM pb -> 12(%ebp)
# note, read STACK VAR c -> -4(%ebp)
mov 12(%ebp), %eax
mov -4(%ebp), %ebx
mul %ebx
mov %eax, %ecx
pushl $__STRING2__
push %ecx
call itos
add $4, %esp
push %eax
pushl $__STRING1__
push -4(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING0__
pushl $5
call strjoinmany
add $24, %esp
mov %eax, %esi
popw __disable_gc__
push %esi
call puts
add $4, %esp
# note, read STACK VAR c -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING c <- %ecx
mov %ecx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM pa -> 8(%ebp)
# note, read PARAM pb -> 12(%ebp)
pushl $__STRING2__
push 12(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING4__
push 8(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING3__
pushl $5
call strjoinmany
add $24, %esp
mov %eax, %ecx
popw __disable_gc__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM pa -> 8(%ebp)
# note, read PARAM pb -> 12(%ebp)
pushl $__STRING2__
push 12(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING4__
push 8(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING3__
pushl $5
call strjoinmany
add $24, %esp
mov %eax, %esi
popw __disable_gc__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# c: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

lea __anonymous_a__, %ecx
push %ecx
# Calling function doOperation
push %ecx
pushl $5
pushl $4
call doOperation
mov %eax, %esi
add $12, %esp
pop %ecx
push %esi
call puts
add $4, %esp
mov $0, %eax
push %eax
call __rc_free_all__
pop %eax

mov %ebp, %esp
pop %ebp
ret
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret

