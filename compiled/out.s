
.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
__PRINT_TYPE_INT__: .asciz "%i\n"
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"


.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"

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
.type	__constructor_Bignum_0_, @function
__ALLOCFOR___constructor_Bignum_0___ = 0
.type	__constructor_Bignum_1_, @function
__ALLOCFOR___constructor_Bignum_1___ = 0
.type	__method_Bignum_destroy_, @function
__ALLOCFOR___method_Bignum_destroy___ = 0
.type	__method_Bignum_print_, @function
.4byte 6
__STRING0__: .asciz "%Ff\n"
__ALLOCFOR___method_Bignum_print___ = 0
.type	__method_Bignum_set_, @function
__ALLOCFOR___method_Bignum_set___ = 0
.type	__method_Bignum_set_int_, @function
__ALLOCFOR___method_Bignum_set_int___ = 0
.type	__method_Bignum_add_, @function
__ALLOCFOR___method_Bignum_add___ = 4
.type	__method_Bignum_sub_, @function
__ALLOCFOR___method_Bignum_sub___ = 4
.type	__method_Bignum_mul_, @function
__ALLOCFOR___method_Bignum_mul___ = 4
.type	__method_Bignum_div_, @function
__ALLOCFOR___method_Bignum_div___ = 4
.type	__method_Bignum_sqrt_, @function
__ALLOCFOR___method_Bignum_sqrt___ = 4
.type	__method_Bignum_pow_, @function
__ALLOCFOR___method_Bignum_pow___ = 4
.type	__operator_Bignum_add_, @function
__ALLOCFOR___operator_Bignum_add___ = 0
.type	__operator_Bignum_sub_, @function
__ALLOCFOR___operator_Bignum_sub___ = 0
.type	__operator_Bignum_mul_, @function
__ALLOCFOR___operator_Bignum_mul___ = 0
.type	__operator_Bignum_div_, @function
__ALLOCFOR___operator_Bignum_div___ = 0
.type	__method_Bignum_toString_, @function
.4byte 2
__STRING1__: .asciz "0"
.4byte 2
__STRING2__: .asciz "."
__ALLOCFOR___method_Bignum_toString___ = 16
__SIZEOF_Bignum__ = 16
# format "Bignum" includes:
#   - PROPERTY (u32) mpprec
#   - PROPERTY (u32) mpsize
#   - PROPERTY (u32) mpexp
#   - PROPERTY (p32) mplimb
#   - CNSTRCTR __constructor_Bignum_0_ (0 parameters)
#   - CNSTRCTR __constructor_Bignum_1_ (1 parameters)
.type	entry, @function
.4byte 16
__STRING3__: .asciz "386415896392e-9"
.4byte 4
__STRING4__: .asciz "123"
__ALLOCFOR_entry__ = 12
__TEMP8_0__: .1byte 0
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
__constructor_Bignum_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Bignum_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Bignum__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set)
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_init
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_init
mov %eax, %ecx
add $4, %esp
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_Bignum_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Bignum_1___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Bignum__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set)
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_init_set_str
pushl $10
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_init_set_str
mov %eax, %ecx
add $12, %esp
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_destroy_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_destroy___, %esp

# Calling function __gmpf_clear
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_clear
mov %eax, %ecx
add $4, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_print_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_print___, %esp

# Calling function __gmp_printf
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
pushl $__STRING0__
call __gmp_printf
mov %eax, %ecx
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_set___, %esp

# Calling function __gmpf_set
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_set
mov %eax, %ecx
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_set_int_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_set_int___, %esp

# Calling function __gmpf_set_si
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_set_si
mov %eax, %ecx
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_add___, %esp

pushl __this__
# Calling function __constructor_Bignum_0_
call __constructor_Bignum_0_
mov %eax, %ecx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_add
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_add
mov %eax, %ecx
add $12, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# output: 4
__method_Bignum_sub_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_sub___, %esp

pushl __this__
# Calling function __constructor_Bignum_0_
call __constructor_Bignum_0_
mov %eax, %ecx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_sub
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_sub
mov %eax, %ecx
add $12, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# output: 4
__method_Bignum_mul_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_mul___, %esp

pushl __this__
# Calling function __constructor_Bignum_0_
call __constructor_Bignum_0_
mov %eax, %ecx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_mul
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_mul
mov %eax, %ecx
add $12, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# output: 4
__method_Bignum_div_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_div___, %esp

pushl __this__
# Calling function __constructor_Bignum_0_
call __constructor_Bignum_0_
mov %eax, %ecx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_div
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_div
mov %eax, %ecx
add $12, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# output: 4
__method_Bignum_sqrt_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_sqrt___, %esp

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# Loading local variable "output" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_sqrt
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_sqrt
mov %eax, %ecx
add $4, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# output: 4
__method_Bignum_pow_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_pow___, %esp

pushl __this__
# Calling function __constructor_Bignum_0_
call __constructor_Bignum_0_
mov %eax, %ecx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __gmpf_pow_ui
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_pow_ui
mov %eax, %ecx
add $12, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# output: 4
__operator_Bignum_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Bignum_add___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Bignum_add_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Bignum_add_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Bignum_sub_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Bignum_sub___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Bignum_sub_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Bignum_sub_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Bignum_mul_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Bignum_mul___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Bignum_mul_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Bignum_mul_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Bignum_div_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Bignum_div___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Bignum_div_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Bignum_div_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_toString___, %esp

push %ecx
# Asked for 16 allocations of "u8"
pushl $0
pushl $16
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %ecx
mov %ecx, %esi
# Loading local variable "allocated" @-4(%ebp)
mov %esi, -4(%ebp)
# requesting ownership for allocated (create)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "expptr" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
lea -8(%ebp), %ecx
push %ecx
# Calling function __gmpf_get_str
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
pushl $14
pushl $10
push %ecx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_get_str
mov %eax, %esi
add $20, %esp
pop %ecx
# Calling function substr
pushl $-1
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call substr
mov %eax, %ecx
add $12, %esp
# Loading local variable "end" @-12(%ebp)
mov %ecx, -12(%ebp)
# requesting ownership for end (create)
lea -12(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function strlen
# TODO optimize if variable just do movl
mov -12(%ebp), %edx
push %edx
call strlen
mov %eax, %ecx
add $4, %esp
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL0__
# converting conststr to string (variable assignation)
pushl $__STRING1__
call cptos
mov %eax, %ecx
add $4, %esp
# requesting ownership for end (set)
lea -12(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
# Calling function substr
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
pushl $0
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call substr
mov %eax, %ecx
add $12, %esp
pushw __disable_gc__; movw $1, __disable_gc__
push -12(%ebp)
pushl $__STRING2__
push %ecx
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
# Loading local variable "ssub" @-16(%ebp)
mov %esi, -16(%ebp)
# requesting ownership for ssub (create)
lea -16(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
mov -16(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# allocated: 4
# expptr: 8
# end: 12
# ssub: 16
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Bignum_1_
pushl $__STRING3__
call __constructor_Bignum_1_
mov %eax, %ecx
add $4, %esp
# Loading local variable "numA" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for numA (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __constructor_Bignum_1_
pushl $__STRING4__
call __constructor_Bignum_1_
mov %eax, %ecx
add $4, %esp
# Loading local variable "numB" @-8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for numB (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Bignum_div_
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call __operator_Bignum_div_
mov %eax, %ecx
add $4, %esp
# Loading local variable "numC" @-12(%ebp)
mov %ecx, -12(%ebp)
# requesting ownership for numC (create)
lea -12(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov -12(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_toString_
call __method_Bignum_toString_
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_toString_
call __method_Bignum_toString_
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
mov -8(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_toString_
call __method_Bignum_toString_
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_destroy_
call __method_Bignum_destroy_
mov %eax, %ecx
mov -8(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_destroy_
call __method_Bignum_destroy_
mov %eax, %ecx
mov -12(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_destroy_
call __method_Bignum_destroy_
mov %eax, %ecx
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
# numA: 4
# numB: 8
# numC: 12
