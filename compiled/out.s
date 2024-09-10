
.1byte = .byte
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"


.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
######## user data section ########
__STRING0__: .asciz "bob"
__STRING1__: .asciz "%p : %s\n"
__STRING2__: .asciz "%p : %s\n"
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
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
pushl $0
pushl $4
call __rc_allocate__
add $8, %esp
mov %eax, %edi
mov $__STRING0__, %esi
mov $4, %ecx
rep movsb
mov %eax, %ebx
# Loading local variable "bob" @-4(%ebp)
mov %ebx, -4(%ebp)
pushl $0
pushl $10
call __rc_allocate__
add $8, %esp
mov %eax, %edi
mov $__STRING1__, %esi
mov $10, %ecx
rep movsb
mov %eax, %ebx
push %ebx
# Calling function printf
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
push %ebx
call printf
mov %eax, %ecx
add $12, %esp
pop %ebx
# Loading local variable "jon" @-8(%ebp)
mov -4(%ebp), %edx
mov %edx, -8(%ebp)
pushl $0
pushl $10
call __rc_allocate__
add $8, %esp
mov %eax, %edi
mov $__STRING2__, %esi
mov $10, %ecx
rep movsb
mov %eax, %ebx
push %ebx
# Calling function printf
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
push %ebx
call printf
mov %eax, %ecx
add $12, %esp
pop %ebx

mov %ebp, %esp
pop %ebp
ret
# bob: 4
# jon: 8
