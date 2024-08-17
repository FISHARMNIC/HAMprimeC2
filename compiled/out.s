
.1byte = .byte
######## Auto included libs #######

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
######## user data section ########
__ALLOCFOR_factorial__ = 0
__STRING0__: .asciz "%f"
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
movb $0, %bl
cmp $1, %eax
setge %bl
cmpb $1, %bl
jne __LABEL0__
xor %eax, %eax
mov 8(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
push %ebx
# Calling function factorial
push %ebx
call factorial
mov %eax, %ecx
add $4, %esp
pop %ebx
push %ebx
push %ecx
xor %eax, %eax
mov 8(%ebp), %eax
mov %ecx, %ebx
mul %ebx
mov %eax, %esi
pop %ebx
pop %ecx
mov %esi, %eax

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
mov $1, %eax

mov %ebp, %esp
pop %ebp
ret

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
mov $0, %ebx
# Loading local variable "sum" @-12(%ebp)
mov %ebx, -12(%ebp)
__LABEL2__:
mov -4(%ebp), %eax
mov -8(%ebp), %edx
movb $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL3__
# Calling function factorial
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call factorial
mov %eax, %ebx
add $4, %esp
mov $1065353216, %ecx
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ebx, __xmm_sse_temp__
cvtsi2ss __xmm_sse_temp__, %xmm1
divss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movss -12(%ebp), %xmm0
movss __TEMP32_0__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_1__
movl __TEMP32_1__, %edx
mov %edx, -12(%ebp)
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL2__
__LABEL3__:
# Calling function printf
movss -12(%ebp), %xmm0
cvtss2sd %xmm0, %xmm2
sub $8, %esp
movq %xmm2, (%esp)
pushl $__STRING0__
call printf
mov %eax, %ebx
add $8, %esp

mov %ebp, %esp
pop %ebp
ret
# sum_index: 4
# sum_end: 8
# sum: 12
