
/*
********HAM PRIME**********
Compiled with love on Tue Nov 19 2024 15:46:50 GMT-0700 (Mountain Standard Time)
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
.4byte 16
__STRING0__: .asciz "someVar is now "
.4byte 1
__STRING1__: .asciz ""
__ALLOCFOR_entry__ = 8
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 12
__STRING2__: .asciz "someVar is "
.4byte 21
__STRING3__: .asciz "setting someVar to: "
.4byte 4
__STRING4__: .asciz " + "
.4byte 4
__STRING5__: .asciz " = "
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
# optimized move from $123 to -4(%ebp)
mov $123, %edx
mov %edx, -4(%ebp)
# Loading local variable "otherVar" @-8(%ebp)
# optimized move from $456 to -8(%ebp)
mov $456, %edx
mov %edx, -8(%ebp)
pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
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
popl __anonymous_a__ebpCapture__
pushw __disable_gc__; movw $1, __disable_gc__
# note, read STACK VAR someVar -> -4(%ebp)
pushl $__STRING1__
push -4(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING0__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
popw __disable_gc__
push %ecx
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
# someVar: 4
# otherVar: 8
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp

pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING1__
mov -4(%ecx), %edx
push %edx
call itos
add $4, %esp
push %eax
pushl $__STRING2__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
push %ecx
push %esi
call puts
add $4, %esp
pop %ecx
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM pa -> 8(%ebp)
# note, read PARAM pb -> 12(%ebp)
# note, read PARAM pa -> 8(%ebp)
# note, read PARAM pb -> 12(%ebp)
mov 8(%ebp), %eax
add 12(%ebp), %eax
add -4(%ecx), %eax
mov %eax, %esi
pushl $__STRING1__
push %esi
call itos
add $4, %esp
push %eax
pushl $__STRING5__
mov -4(%ecx), %edx
push %edx
call itos
add $4, %esp
push %eax
pushl $__STRING4__
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
pushl $9
call strjoinmany
add $40, %esp
mov %eax, %edi
popw __disable_gc__
push %ecx
push %edi
call puts
add $4, %esp
pop %ecx
# note, read PARAM pa -> 8(%ebp)
# note, read PARAM pb -> 12(%ebp)
mov 8(%ebp), %eax
add 12(%ebp), %eax
add -4(%ecx), %eax
mov %eax, %esi
# SETTING someVar <- %esi
# optimized move from %esi to -4(%ecx)
mov %esi, -4(%ecx)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

