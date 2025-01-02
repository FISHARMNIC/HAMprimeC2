
/*
********HAM PRIME**********
Compiled with love on Wed Jan 01 2025 19:16:30 GMT-0800 (Pacific Standard Time)
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
.comm __LABEL0__, 12 #Allocation for array
sarr: .4byte 0
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

# Allocating array {1,2,3}
mov $__LABEL0__, %eax
# optimized move from 1 to 0(%eax)
movl $1, 0(%eax)
# optimized move from 2 to 4(%eax)
movl $2, 4(%eax)
# optimized move from 3 to 8(%eax)
movl $3, 8(%eax)
# Moving arr to out
# optimized move from %eax to %ecx
mov %eax, %ecx
# creating variable "sarr" of type "p32:borrowed" stack?=false
mov %ecx, sarr
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
# printing array
mov sarr, %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
# popping multi-line clobbers
# setting register "a" to "0"
mov $0, %eax
# auto-return OK for entry function
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

