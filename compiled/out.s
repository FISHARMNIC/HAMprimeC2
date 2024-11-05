
/*
********HAM PRIME**********
Compiled with love on Tue Nov 05 2024 16:58:07 GMT-0700 (Mountain Standard Time)
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
.4byte 5
__STRING0__: .asciz "abc "
.4byte 5
__STRING1__: .asciz " def"
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

pushw __disable_gc__; movw $1, __disable_gc__
mov $123, %eax
add $456, %eax
mov %eax, %ecx
pushl $__STRING1__
push %ecx
call itos
add $4, %esp
push %eax
pushl $__STRING0__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
push %esi
call puts
add $4, %esp
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret

