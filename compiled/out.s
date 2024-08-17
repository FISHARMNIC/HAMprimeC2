
.1byte = .byte
######## Auto included libs #######
.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"
###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
######## user data section ########
__ALLOCFOR___constructor_Vector_0___ = 0
__ALLOCFOR___method_Vector_add___ = 0
__ALLOCFOR___method_Vector_scale___ = 0
__STRING0__: .asciz "(%f, %f, %f)\n"
__ALLOCFOR___method_Vector_print___ = 0
__SIZEOF_Vector__ = 12
# format "Vector" includes:
#   - PROPERTY (u32) x
#   - PROPERTY (u32) y
#   - PROPERTY (u32) z
#   - CNSTRCTR __constructor_Vector_0_ (3 parameters)
__ALLOCFOR_entry__ = 8
__TEMP32_0__: .4byte 0
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
__constructor_Vector_0_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___constructor_Vector_0___, %esp
mov $__SIZEOF_Vector__, %edx
push %edx
call __allocate_wsize__ #Allocate for THIS
add $4, %esp
mov %eax, __this__
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
movl __this__, %eax
mov 12(%ebp), %edx
mov %edx, 4(%eax)
movl __this__, %eax
mov 16(%ebp), %edx
mov %edx, 8(%eax)
movl __this__, %eax

mov %ebp, %esp
pop %ebp
ret
__method_Vector_add_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_Vector_add___, %esp
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ecx
movl %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
movl 8(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ecx
movl %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
movl 8(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
movl %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
movl __this__, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
__method_Vector_scale_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_Vector_scale___, %esp
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ecx
movl %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
movl 8(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ecx
movl %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
movl 8(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
movl %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
movl __this__, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
__method_Vector_print_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_Vector_print___, %esp
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %esi
push %ebx
push %esi
push %ecx
# Calling function printf
# awful optimization. do later. sorry
mov %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
cvtss2sd %xmm0, %xmm2
sub $8, %esp
movq %xmm2, (%esp)
# awful optimization. do later. sorry
mov %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
cvtss2sd %xmm0, %xmm2
sub $8, %esp
movq %xmm2, (%esp)
# awful optimization. do later. sorry
mov %ebx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
cvtss2sd %xmm0, %xmm2
sub $8, %esp
movq %xmm2, (%esp)
pushl $__STRING0__
call printf
mov %eax, %edi
add $28, %esp
pop %ecx
pop %esi
pop %ebx

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
mov $0, %ebx
mov $1065353216, %ecx
mov $0, %esi
push %ebx
push %esi
push %ecx
# Calling function __constructor_Vector_0_
push %esi
push %ecx
push %ebx
call __constructor_Vector_0_
mov %eax, %edi
add $12, %esp
pop %ecx
pop %esi
pop %ebx
# Loading local variable "position" @-4(%ebp)
mov %edi, -4(%ebp)
mov $1065353216, %ebx
mov $0, %ecx
mov $0, %esi
push %ebx
push %esi
push %ecx
# Calling function __constructor_Vector_0_
push %esi
push %ecx
push %ebx
call __constructor_Vector_0_
mov %eax, %edi
add $12, %esp
pop %ecx
pop %esi
pop %ebx
# Loading local variable "velocity" @-8(%ebp)
mov %edi, -8(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_add_
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call __method_Vector_add_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_print_
call __method_Vector_print_
mov %eax, %ebx

mov %ebp, %esp
pop %ebp
ret
# position: 4
# velocity: 8
