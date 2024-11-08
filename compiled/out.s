
/*
********HAM PRIME**********
Compiled with love on Fri Nov 08 2024 09:45:51 GMT-0700 (Mountain Standard Time)
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
__ALLOCFOR_entry__ = 0
__TEMP32_0__: .4byte 0
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

mov $1115684864, %ecx
movl %ecx, __xmm_sse_temp__
sqrtss __xmm_sse_temp__, %xmm1
movss %xmm1, __TEMP32_0__
movl __TEMP32_0__, %edx
push %edx
call print_float_noPromo
add $4, %esp
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret

