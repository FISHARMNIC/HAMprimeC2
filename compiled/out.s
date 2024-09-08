
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
__ALLOCFOR___method_User_toString___ = 0
__SIZEOF_User__ = 8
# format "User" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) ID
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
__method_User_toString_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_User_toString___, %esp
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
push %ecx
call itos
add $4, %esp
push %eax
push %ebx
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %esi
mov %esi, %eax

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
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for User
mov $__STRING0__, %edx
mov %edx, 0(%eax)
movl $123, 4(%eax)
# Loading local variable "me" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for me (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "awesomePerson" @-8(%ebp)
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
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_User_toString_
call __method_User_toString_
mov %eax, %ebx
push %eax
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
# me: 4
# awesomePerson: 8
# age: 12
# out: 16
