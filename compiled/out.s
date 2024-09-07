
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
__STRING0__: .asciz "hello"
__STRING1__: .asciz " jon "
__STRING2__: .asciz "and bob"
__STRING3__: .asciz "output: %s\n"
__ALLOCFOR_entry__ = 4
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
movl $__STRING0__, %ebx
# Loading local variable "str" @-4(%ebp)
mov %ebx, -4(%ebp)
movl $__STRING1__, %ebx
movl $__STRING2__, %ecx
push %ecx
push %ebx
mov -4(%ebp), %edx
push %edx
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
mov %esi, -4(%ebp)
# requesting ownership for str (set)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# Calling function printf
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
pushl $__STRING3__
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
# str: 4
