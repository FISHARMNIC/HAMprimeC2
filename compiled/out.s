
.1byte = .byte
######## Auto included libs #######
.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"
###################################
.data
.align 4

######## user data section ########
factorial_res: .4byte 0
__ALLOCFOR_factorial__ = 4
__STRING0__: .asciz "0"
__STRING1__: .asciz "1"
__STRING2__: .asciz "1"
__STRING3__: .asciz "0"
__STRING4__: .asciz "0"
__ALLOCFOR_entry__ = 24
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
# Calling function bignum_set_fromInt
pushl $1
mov factorial_res, %edx
push %edx
call bignum_set_fromInt
mov %eax, %ebx
add $8, %esp
# Loading local variable "i" @-4(%ebp)
mov 8(%ebp), %edx
mov %edx, -4(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
movb $0, %bl
cmp $2, %eax
setge %bl
cmpb $1, %bl
jne __LABEL1__
# Calling function bignum_mul_intb
mov -4(%ebp), %edx
push %edx
mov factorial_res, %edx
push %edx
mov factorial_res, %edx
push %edx
call bignum_mul_intb
mov %eax, %ebx
add $12, %esp
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
movl factorial_res, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# i: 4
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
# Calling function bignum_setp
pushl $256
call bignum_setp
mov %eax, %ebx
add $4, %esp
# Loading local variable "sum_index" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
# Loading local variable "sum_end" @-8(%ebp)
mov $100, %edx
mov %edx, -8(%ebp)
# Calling function bignum
pushl $__STRING0__
call bignum
mov %eax, %ebx
add $4, %esp
# Loading local variable "sum" @-12(%ebp)
mov %ebx, -12(%ebp)
# Calling function bignum
pushl $__STRING1__
call bignum
mov %eax, %ebx
add $4, %esp
# Loading local variable "one" @-16(%ebp)
mov %ebx, -16(%ebp)
# Calling function bignum
pushl $__STRING2__
call bignum
mov %eax, %ebx
add $4, %esp
# Loading local variable "divisor" @-20(%ebp)
mov %ebx, -20(%ebp)
# Calling function bignum
pushl $__STRING3__
call bignum
mov %eax, %ebx
add $4, %esp
# Loading local variable "intermediate" @-24(%ebp)
mov %ebx, -24(%ebp)
# Calling function bignum
pushl $__STRING4__
call bignum
mov %eax, %ebx
add $4, %esp
mov %ebx, factorial_res
__LABEL2__:
mov -4(%ebp), %eax
mov -8(%ebp), %edx
movb $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL3__
# Calling function factorial
mov -4(%ebp), %edx
push %edx
call factorial
mov %eax, %ebx
add $4, %esp
push %ebx
# Calling function bignum_div
push %ebx
mov -16(%ebp), %edx
push %edx
mov -24(%ebp), %edx
push %edx
call bignum_div
mov %eax, %ecx
add $12, %esp
pop %ebx
# Calling function bignum_add
mov -24(%ebp), %edx
push %edx
mov -12(%ebp), %edx
push %edx
mov -12(%ebp), %edx
push %edx
call bignum_add
mov %eax, %ebx
add $12, %esp
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL2__
__LABEL3__:
# Calling function bignum_print
mov -12(%ebp), %edx
push %edx
call bignum_print
mov %eax, %ebx
add $4, %esp

mov %ebp, %esp
pop %ebp
ret
# sum_index: 4
# sum_end: 8
# sum: 12
# one: 16
# divisor: 20
# intermediate: 24
