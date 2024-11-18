
/*
********HAM PRIME**********
Compiled with love on Mon Nov 18 2024 16:46:20 GMT-0700 (Mountain Standard Time)
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
.type	myVariadic, @function
.global myVariadic
.4byte 18
__STRING0__: .asciz "Argument %i: %s\n"
__ALLOCFOR_myVariadic__ = 4
.type	entry, @function
.global entry
.4byte 3
__STRING1__: .asciz "hi"
.4byte 4
__STRING2__: .asciz "bye"
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
myVariadic:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_myVariadic__, %esp

# Loading local variable "i" @-4(%ebp)
mov $1, %edx
mov %edx, -4(%ebp)
__LABEL0__:
# note, read STACK VAR i -> -4(%ebp)
# note, read PARAM numberOfArgs -> 8(%ebp)
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setle %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
# note, read STACK VAR i -> -4(%ebp)
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, %eax
add $2, %eax
mov (%ebp, %eax, 4), %ecx
push %ecx
# Calling function printf
push %ecx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %esi
add $12, %esp
pop %ecx
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
mov %ecx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function myVariadic
pushl $__STRING2__
pushl $__STRING1__
pushl $2
call myVariadic
mov %eax, %ecx
add $12, %esp
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

