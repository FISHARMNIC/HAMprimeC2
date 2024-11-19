
/*
********HAM PRIME**********
Compiled with love on Tue Nov 19 2024 11:25:07 GMT-0700 (Mountain Standard Time)
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
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 4
.type	__anonymous_a__, @function
.global __anonymous_a__
__ALLOCFOR___anonymous_a____ = 0
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
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Loading local variable "someVar" @-4(%ebp)
mov $123, %edx
mov %edx, -4(%ebp)
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
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
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
# someVar: 4
__anonymous_a__:
mov %ebp, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp

# note, read PARAM pa -> 8(%ebp)
# note, read PARAM pb -> 12(%ebp)
mov 8(%ebp), %eax
add 12(%ebp), %eax
add someVar, %eax
mov %eax, %esi
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

