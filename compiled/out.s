
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
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
__ALLOCFOR___constructor_Bignum_0___ = 0
__ALLOCFOR___constructor_Bignum_1___ = 0
.4byte 6
__STRING0__: .asciz "%Ff\n"
__ALLOCFOR___method_Bignum_print___ = 0
__ALLOCFOR___method_Bignum_set___ = 0
__ALLOCFOR___method_Bignum_set_int___ = 0
__ALLOCFOR___method_Bignum_add___ = 4
__ALLOCFOR___method_Bignum_sub___ = 4
__ALLOCFOR___method_Bignum_mul___ = 4
__ALLOCFOR___method_Bignum_div___ = 4
__ALLOCFOR___method_Bignum_sqrt___ = 4
__ALLOCFOR___method_Bignum_pow___ = 4
__SIZEOF_Bignum__ = 16
# format "Bignum" includes:
#   - PROPERTY (u32) mpprec
#   - PROPERTY (u32) mpsize
#   - PROPERTY (u32) mpexp
#   - PROPERTY (p32) mplimb
#   - CNSTRCTR __constructor_Bignum_0_ (0 parameters)
#   - CNSTRCTR __constructor_Bignum_1_ (1 parameters)
.4byte 16
__STRING1__: .asciz "386415896392e-9"
.4byte 4
__STRING2__: .asciz "123"
__ALLOCFOR_entry__ = 8
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
pushl __this__
# Calling function __gmpf_init
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_init
mov %eax, %ebx
add $4, %esp
popl __this__
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
pushl __this__
# Calling function __gmpf_init_set_str
pushl $10
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_init_set_str
mov %eax, %ebx
add $12, %esp
popl __this__
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_print_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_print___, %esp

pushl __this__
# Calling function __gmp_printf
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
pushl $__STRING0__
call __gmp_printf
mov %eax, %ebx
add $8, %esp
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_set___, %esp

pushl __this__
# Calling function __gmpf_set
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_set
mov %eax, %ebx
add $8, %esp
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Bignum_set_int_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Bignum_set_int___, %esp

pushl __this__
# Calling function __gmpf_set_si
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __gmpf_set_si
mov %eax, %ebx
add $8, %esp
popl __this__
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
mov %eax, %ebx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl __this__
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
mov %eax, %ebx
add $12, %esp
popl __this__
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
mov %eax, %ebx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl __this__
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
mov %eax, %ebx
add $12, %esp
popl __this__
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
mov %eax, %ebx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl __this__
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
mov %eax, %ebx
add $12, %esp
popl __this__
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
mov %eax, %ebx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl __this__
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
mov %eax, %ebx
add $12, %esp
popl __this__
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
lea __this__, %esi
mov (%esi), %ecx
mov -4(%ecx), %ecx
pushl 8(%ecx)
call __rc_allocate__
pop %ecx
mov %eax, %edi
rep movsb
mov %eax, %ebx
# Loading local variable "output" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl __this__
# Calling function __gmpf_sqrt
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call __gmpf_sqrt
mov %eax, %ebx
add $4, %esp
popl __this__
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
mov %eax, %ebx
popl __this__
# Loading local variable "output" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for output (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl __this__
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
mov %eax, %ebx
add $12, %esp
popl __this__
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Bignum_1_
pushl $__STRING1__
call __constructor_Bignum_1_
mov %eax, %ebx
add $4, %esp
# Loading local variable "numA" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for numA (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Calling function __constructor_Bignum_1_
pushl $__STRING2__
call __constructor_Bignum_1_
mov %eax, %ebx
add $4, %esp
# Loading local variable "numB" @-8(%ebp)
mov %ebx, -8(%ebp)
# requesting ownership for numB (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_div_
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call __method_Bignum_div_
mov %eax, %ebx
add $4, %esp
mov %ebx, __this__
push %ebx
# Calling function __method_Bignum_print_
call __method_Bignum_print_
mov %eax, %ecx
pop %ebx
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_print_
call __method_Bignum_print_
mov %eax, %ebx
mov -8(%ebp), %edx
mov %edx, __this__
# Calling function __method_Bignum_print_
call __method_Bignum_print_
mov %eax, %ebx
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# numA: 4
# numB: 8
