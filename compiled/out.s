
/*
********HAM PRIME**********
Compiled with love on Mon Nov 18 2024 10:42:08 GMT-0700 (Mountain Standard Time)
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
.type	__constructor_Vector_0_, @function
.global __constructor_Vector_0_
__ALLOCFOR___constructor_Vector_0___ = 0
.type	__method_Vector_add_, @function
.global __method_Vector_add_
__ALLOCFOR___method_Vector_add___ = 0
.type	__method_Vector_mul_, @function
.global __method_Vector_mul_
__ALLOCFOR___method_Vector_mul___ = 0
.type	__method_Vector_div_, @function
.global __method_Vector_div_
__ALLOCFOR___method_Vector_div___ = 0
.type	__operator_Vector_add_0__, @function
.global __operator_Vector_add_0__
__ALLOCFOR___operator_Vector_add_0____ = 4
.type	__operator_Vector_sub_1__, @function
.global __operator_Vector_sub_1__
__ALLOCFOR___operator_Vector_sub_1____ = 4
.type	__operator_Vector_mul_2__, @function
.global __operator_Vector_mul_2__
__ALLOCFOR___operator_Vector_mul_2____ = 4
.type	__operator_Vector_div_3__, @function
.global __operator_Vector_div_3__
__ALLOCFOR___operator_Vector_div_3____ = 4
.type	__method_Vector_dot_, @function
.global __method_Vector_dot_
__ALLOCFOR___method_Vector_dot___ = 4
.type	__method_Vector_cross_, @function
.global __method_Vector_cross_
__ALLOCFOR___method_Vector_cross___ = 4
.type	__method_Vector_magnitude_, @function
.global __method_Vector_magnitude_
__ALLOCFOR___method_Vector_magnitude___ = 0
.type	__method_Vector_normalize_, @function
.global __method_Vector_normalize_
__ALLOCFOR___method_Vector_normalize___ = 4
.type	__method_Vector_normalized_, @function
.global __method_Vector_normalized_
__ALLOCFOR___method_Vector_normalized___ = 4
.type	__method_Vector_toString_, @function
.global __method_Vector_toString_
.4byte 2
__STRING0__: .asciz "("
.4byte 3
__STRING1__: .asciz ", "
.4byte 2
__STRING2__: .asciz ")"
__ALLOCFOR___method_Vector_toString___ = 0
__SIZEOF_Vector__ = 12
# format "Vector" includes:
#   - PROPERTY (u32) x
#   - PROPERTY (u32) y
#   - PROPERTY (u32) z
#   - CNSTRCTR __constructor_Vector_0_ (3 parameters)
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 8
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
__TEMP32_2__: .4byte 0
__TEMP32_3__: .4byte 0
__TEMP32_4__: .4byte 0
__TEMP32_5__: .4byte 0
__TEMP32_6__: .4byte 0
__TEMP32_7__: .4byte 0
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
__constructor_Vector_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Vector_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Vector__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set). 
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM x -> 8(%ebp)
# Reading property "x" in "__this__"
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# note, read PARAM y -> 12(%ebp)
# Reading property "y" in "__this__"
movl __this__, %eax
mov 12(%ebp), %edx
mov %edx, 4(%eax)
# note, read PARAM z -> 16(%ebp)
# Reading property "z" in "__this__"
movl __this__, %eax
mov 16(%ebp), %edx
mov %edx, 8(%eax)
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Vector_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_add___, %esp

# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM vec -> 8(%ebp)
# Reading property "x" in "8(%ebp)"
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "x" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
# note, read PARAM vec -> 8(%ebp)
# Reading property "y" in "8(%ebp)"
movl 8(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "y" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
# note, read PARAM vec -> 8(%ebp)
# Reading property "z" in "8(%ebp)"
movl 8(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "z" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
movl __this__, %edx
mov %edx, __gc_dontClear__
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Vector_mul_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_mul___, %esp

# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM scale -> 8(%ebp)
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss 8(%ebp), %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "x" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
# note, read PARAM scale -> 8(%ebp)
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss 8(%ebp), %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "y" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
# note, read PARAM scale -> 8(%ebp)
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss 8(%ebp), %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "z" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
movl __this__, %edx
mov %edx, __gc_dontClear__
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Vector_div_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_div___, %esp

# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM scale -> 8(%ebp)
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss 8(%ebp), %xmm1
divss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "x" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
# note, read PARAM scale -> 8(%ebp)
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss 8(%ebp), %xmm1
divss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "y" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
# note, read PARAM scale -> 8(%ebp)
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss 8(%ebp), %xmm1
divss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "z" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
movl __this__, %edx
mov %edx, __gc_dontClear__
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Vector_add_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Vector_add_0____, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM other -> 8(%ebp)
# note, read STACK VAR dupe -> -4(%ebp)
pushl __this__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_add_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Vector_add_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__operator_Vector_sub_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Vector_sub_1____, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM other -> 8(%ebp)
# note, read STACK VAR dupe -> -4(%ebp)
pushl __this__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_add_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Vector_add_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__operator_Vector_mul_2__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Vector_mul_2____, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM scale -> 8(%ebp)
# note, read STACK VAR dupe -> -4(%ebp)
pushl __this__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_mul_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Vector_mul_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__operator_Vector_div_3__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Vector_div_3____, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM scale -> 8(%ebp)
# note, read STACK VAR dupe -> -4(%ebp)
pushl __this__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_div_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Vector_div_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__method_Vector_dot_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_dot___, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "x" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM other -> 8(%ebp)
# Reading property "x" in "8(%ebp)"
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "x" in "-4(%ebp)"
movl -4(%ebp), %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "y" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ecx
# note, read PARAM other -> 8(%ebp)
# Reading property "y" in "8(%ebp)"
movl 8(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "y" in "-4(%ebp)"
movl -4(%ebp), %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "z" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
# note, read PARAM other -> 8(%ebp)
# Reading property "z" in "8(%ebp)"
movl 8(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "z" in "-4(%ebp)"
movl -4(%ebp), %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
# note, read STACK VAR dupe -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __gc_dontClear__
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__method_Vector_cross_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_cross___, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
# note, read PARAM other -> 8(%ebp)
# Reading property "z" in "8(%ebp)"
movl 8(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %esi
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %edi
# note, read PARAM other -> 8(%ebp)
# Reading property "y" in "8(%ebp)"
movl 8(%ebp), %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_0__
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_1__
movl %edi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss __TEMP32_0__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_2__
movss __TEMP32_1__, %xmm0
movss __TEMP32_2__, %xmm1
subss %xmm1, %xmm0
movss %xmm0, __TEMP32_3__
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "x" in "-4(%ebp)"
movl -4(%ebp), %eax
movl __TEMP32_3__, %edx
mov %edx, 0(%eax)
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
# note, read PARAM other -> 8(%ebp)
# Reading property "x" in "8(%ebp)"
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %esi
# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %edi
# note, read PARAM other -> 8(%ebp)
# Reading property "z" in "8(%ebp)"
movl 8(%ebp), %eax
mov 8(%eax), %edx
mov %edx, __TEMP32_0__
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_1__
movl %edi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss __TEMP32_0__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_2__
movss __TEMP32_1__, %xmm0
movss __TEMP32_2__, %xmm1
subss %xmm1, %xmm0
movss %xmm0, __TEMP32_3__
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "y" in "-4(%ebp)"
movl -4(%ebp), %eax
movl __TEMP32_3__, %edx
mov %edx, 4(%eax)
# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM other -> 8(%ebp)
# Reading property "y" in "8(%ebp)"
movl 8(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %esi
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %edi
# note, read PARAM other -> 8(%ebp)
# Reading property "x" in "8(%ebp)"
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_0__
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_1__
movl %edi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss __TEMP32_0__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_2__
movss __TEMP32_1__, %xmm0
movss __TEMP32_2__, %xmm1
subss %xmm1, %xmm0
movss %xmm0, __TEMP32_3__
# note, read STACK VAR dupe -> -4(%ebp)
# Reading property "z" in "-4(%ebp)"
movl -4(%ebp), %eax
movl __TEMP32_3__, %edx
mov %edx, 8(%eax)
# note, read STACK VAR dupe -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __gc_dontClear__
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__method_Vector_magnitude_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_magnitude___, %esp

# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
movl %ecx, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movl %esi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %edi
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_1__
movl %edi, __xmm_sse_temp__
movss __xmm_sse_temp__, %xmm0
movss __TEMP32_1__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_2__
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, __TEMP32_3__
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, __TEMP32_4__
movss __TEMP32_3__, %xmm0
movss __TEMP32_4__, %xmm1
mulss %xmm1, %xmm0
movss %xmm0, __TEMP32_5__
movss __TEMP32_0__, %xmm0
movss __TEMP32_2__, %xmm1
addss %xmm1, %xmm0
movss __TEMP32_5__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_6__
sqrtss __TEMP32_6__, %xmm1
movss %xmm1, __TEMP32_7__
movl __TEMP32_7__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Vector_normalize_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_normalize___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Vector_magnitude_
call __method_Vector_magnitude_
mov %eax, %ecx
popl __this__
# Loading local variable "m" @-4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR m -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl
jne __LABEL0__
movl __this__, %edx
mov %edx, __gc_dontClear__
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
# note, read STACK VAR m -> -4(%ebp)
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Vector_div_
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __method_Vector_div_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# m: 4
__method_Vector_normalized_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_normalized___, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "dupe" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR dupe -> -4(%ebp)
pushl __this__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_normalize_
call __method_Vector_normalize_
mov %eax, %ecx
popl __this__
mov %ecx, __gc_dontClear__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
__method_Vector_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Vector_toString___, %esp

pushw __disable_gc__; movw $1, __disable_gc__
# Reading property "x" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "y" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %esi
# Reading property "z" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %edi
pushl $__STRING2__
push %edi
call ftos
add $4, %esp
push %eax
pushl $__STRING1__
push %esi
call ftos
add $4, %esp
push %eax
pushl $__STRING1__
push %ecx
call ftos
add $4, %esp
push %eax
pushl $__STRING0__
pushl $7
call strjoinmany
add $32, %esp
mov %eax, __TEMP32_0__
popw __disable_gc__
movl __TEMP32_0__, %edx
mov %edx, __gc_dontClear__
movl __TEMP32_0__, %eax
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

mov $1065353216, %ecx
mov $1077936128, %esi
mov $1082130432, %edi
push %esi
push %ecx
push %edi
# Calling function __constructor_Vector_0_
push %edi
push %esi
push %ecx
call __constructor_Vector_0_
mov %eax, __TEMP32_0__
add $12, %esp
pop %edi
pop %ecx
pop %esi
# Loading local variable "position" @-4(%ebp)
movl __TEMP32_0__, %edx
mov %edx, -4(%ebp)
# requesting ownership for position (create)
lea -4(%ebp), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
mov $1073741824, %ecx
mov $1088421888, %esi
mov $3231711232, %edi
push %esi
push %ecx
push %edi
# Calling function __constructor_Vector_0_
push %edi
push %esi
push %ecx
call __constructor_Vector_0_
mov %eax, __TEMP32_0__
add $12, %esp
pop %edi
pop %ecx
pop %esi
# Loading local variable "velocity" @-8(%ebp)
movl __TEMP32_0__, %edx
mov %edx, -8(%ebp)
# requesting ownership for velocity (create)
lea -8(%ebp), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR position -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_toString_
call __method_Vector_toString_
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
# note, read STACK VAR position -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_magnitude_
call __method_Vector_magnitude_
mov %eax, %ecx
push %ecx
call print_float_noPromo
add $4, %esp
# note, read STACK VAR position -> -4(%ebp)
# note, read STACK VAR velocity -> -8(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Vector_add_0__
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call __operator_Vector_add_0__
mov %eax, %ecx
add $4, %esp
mov %ecx, __this__
push %ecx
# Calling function __method_Vector_toString_
call __method_Vector_toString_
mov %eax, %esi
pop %ecx
push %esi
call puts
add $4, %esp
# note, read STACK VAR velocity -> -8(%ebp)
# note, read STACK VAR position -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Vector_cross_
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call __method_Vector_cross_
mov %eax, %ecx
add $4, %esp
mov %ecx, __this__
push %ecx
# Calling function __method_Vector_toString_
call __method_Vector_toString_
mov %eax, %esi
pop %ecx
push %esi
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
# position: 4
# velocity: 8

