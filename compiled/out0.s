
/*
********HAM PRIME**********
Compiled with love on Fri Nov 15 2024 21:51:12 GMT-0700 (Mountain Standard Time)
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
.4byte 12
__STRING0__: .asciz "My name is "
.4byte 11
__STRING1__: .asciz " and I am "
.4byte 11
__STRING2__: .asciz " years old"
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	greet, @function
.global greet
.4byte 7
__STRING3__: .asciz "hello "
__ALLOCFOR_greet__ = 0
###################################
.text

#### compiler initation section ###
__init_for_out0__:


ret
.global __init_for_out0__
###################################

# No main function

###################################
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp

pushw __disable_gc__; movw $1, __disable_gc__
# Reading property "name" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %esi
pushl $__STRING2__
push %esi
call itos
add $4, %esp
push %eax
pushl $__STRING1__
push %ecx
pushl $__STRING0__
pushl $5
call strjoinmany
add $24, %esp
mov %eax, %edi
popw __disable_gc__
mov %edi, __gc_dontClear__
mov %edi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
greet:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_greet__, %esp

# note, read PARAM name -> 8(%ebp)
pushw __disable_gc__; movw $1, __disable_gc__
push 8(%ebp)
pushl $__STRING3__
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
popw __disable_gc__
push %ecx
call puts
add $4, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

