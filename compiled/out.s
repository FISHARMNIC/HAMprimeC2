
.1byte = .byte
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
######## user data section ########
__STRING0__: .asciz "Nico"
__STRING1__: .asciz "Nina"
__STRING2__: .asciz "Hello "
__STRING3__: .asciz " and "
__STRING4__: .asciz "! I am "
__STRING5__: .asciz " years old."
__STRING6__: .asciz "output: %s\n"
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
# Loading local variable "nameA" @-4(%ebp)
mov $__STRING0__, %edx
mov %edx, -4(%ebp)
# Loading local variable "nameB" @-8(%ebp)
mov $__STRING1__, %edx
mov %edx, -8(%ebp)
mov $1123477881, %ebx
# Loading local variable "age" @-12(%ebp)
mov %ebx, -12(%ebp)
pushl $__STRING5__
push -12(%ebp)
call ftos
add $4, %esp
push %eax
pushl $__STRING4__
push -8(%ebp)
pushl $__STRING3__
push -4(%ebp)
pushl $__STRING2__
pushl $7
call strjoinmany
add $32, %esp
mov %eax, %ebx
# Loading local variable "out" @-16(%ebp)
mov %ebx, -16(%ebp)
# requesting ownership for out (create)
lea -16(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Calling function printf
# TODO optimize if variable just do movl
mov -16(%ebp), %edx
push %edx
pushl $__STRING6__
call printf
mov %eax, %ebx
add $8, %esp
mov $0, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# nameA: 4
# nameB: 8
# age: 12
# out: 16
