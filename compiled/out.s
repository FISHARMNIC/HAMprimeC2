
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
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
.4byte 13
__STRING0__: .asciz "result: %i\n"
__ALLOCFOR_entry__ = 16
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Loading local variable "a" @-4(%ebp)
mov $1, %edx
mov %edx, -4(%ebp)
# Loading local variable "b" @-8(%ebp)
mov $2, %edx
mov %edx, -8(%ebp)
# Loading local variable "max" @-12(%ebp)
mov $4000000, %edx
mov %edx, -12(%ebp)
# Loading local variable "sum" @-16(%ebp)
mov $0, %edx
mov %edx, -16(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
mov -12(%ebp), %edx
mov $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
# Math begin: [-4(%ebp) % 2]
xor %eax, %eax
mov -4(%ebp), %eax
mov $2, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %ebx
# Math end. result in %ebx
mov $0, %cl
cmp $0, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL2__
# Math begin: [-16(%ebp) + -4(%ebp)]
xor %eax, %eax
mov -16(%ebp), %eax
add -4(%ebp), %eax
mov %eax, %ebx
# Math end. result in %ebx
mov %ebx, -16(%ebp)
jmp __LABEL3__
__LABEL2__:
__LABEL3__:
# Math begin: [-8(%ebp) % 2]
xor %eax, %eax
mov -8(%ebp), %eax
mov $2, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %ebx
# Math end. result in %ebx
mov $0, %cl
cmp $0, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL4__
# Math begin: [-16(%ebp) + -8(%ebp)]
xor %eax, %eax
mov -16(%ebp), %eax
add -8(%ebp), %eax
mov %eax, %ebx
# Math end. result in %ebx
mov %ebx, -16(%ebp)
jmp __LABEL5__
__LABEL4__:
__LABEL5__:
# Math begin: [-4(%ebp) + -8(%ebp)]
xor %eax, %eax
mov -4(%ebp), %eax
add -8(%ebp), %eax
mov %eax, %ebx
# Math end. result in %ebx
mov %ebx, -4(%ebp)
# Math begin: [-4(%ebp) + -8(%ebp)]
xor %eax, %eax
mov -4(%ebp), %eax
add -8(%ebp), %eax
mov %eax, %ebx
# Math end. result in %ebx
mov %ebx, -8(%ebp)
jmp __LABEL0__
__LABEL1__:
# Calling function printf
# TODO optimize if variable just do movl
mov -16(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ebx
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# a: 4
# b: 8
# max: 12
# sum: 16
