
.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
__PRINT_TYPE_INT__: .asciz "%i\n"
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
.global ___TEMPORARY_OWNER___
.global __this__
.extern __disable_gc__
######## user data section ########
.type	factorial, @function
__ALLOCFOR_factorial__ = 0
.type	entry, @function
__ALLOCFOR_entry__ = 12
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:

ret
###################################

main:
    call __init__
    call entry
    ret

###################################
factorial:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_factorial__, %esp

mov 8(%ebp), %eax
mov $0, %cl
cmp $1, %eax
setge %cl
cmpb $1, %cl
jne __LABEL0__
mov 8(%ebp), %eax
sub $1, %eax
mov %eax, %ecx
push %ecx
# Calling function factorial
push %ecx
call factorial
mov %eax, %esi
add $4, %esp
pop %ecx
mov 8(%ebp), %eax
mov %esi, %ebx
mul %ebx
mov %eax, %edi
mov %edi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
mov $1, %eax
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

# Loading local variable "sum_index" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
# Loading local variable "sum_end" @-8(%ebp)
mov $10, %edx
mov %edx, -8(%ebp)
# Loading local variable "sum" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
__LABEL2__:
mov -4(%ebp), %eax
mov -8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL3__
mov $1065353216, %ecx
push %ecx
# Calling function factorial
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call factorial
mov %eax, %esi
add $4, %esp
pop %ecx
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
cvtsi2ss __xmm_sse_temp__, %xmm1
divss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movss -12(%ebp), %xmm0
movss __TEMP32_0__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_1__
movl __TEMP32_1__, %edx
mov %edx, -12(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
mov %ecx, -4(%ebp)
jmp __LABEL2__
__LABEL3__:
push -12(%ebp)
call print_float_noPromo
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
# sum_index: 4
# sum_end: 8
# sum: 12
