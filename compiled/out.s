
.macro .1byte v
.byte \v
.endm
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
.extern __disable_gc__
######## user data section ########
.4byte 7
__STRING0__: .asciz " (age "
.4byte 2
__STRING1__: .asciz ")"
__ALLOCFOR___method_User_toString___ = 4
__SIZEOF_User__ = 8
# format "User" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.4byte 5
__STRING2__: .asciz "Nico"
.4byte 5
__STRING3__: .asciz "Nina"
.4byte 7
__STRING4__: .asciz "Hello "
.4byte 6
__STRING5__: .asciz " and "
.4byte 8
__STRING6__: .asciz "! I am "
.4byte 11
__STRING7__: .asciz " years old"
.4byte 27
__STRING8__: .asciz "Hey! My name is also Nico!"
__ALLOCFOR_entry__ = 12
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
pushl $__STRING1__
push %ecx
call itos
add $4, %esp
push %eax
pushl $__STRING0__
push %ebx
pushl $4
call strjoinmany
add $20, %esp
mov %eax, %esi
# Loading local variable "out" @-4(%ebp)
mov %esi, -4(%ebp)
# requesting ownership for out (create)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# out: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for User
mov $__STRING2__, %edx
mov %edx, 0(%eax)
movl $18, 4(%eax)
# Loading local variable "me" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for me (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl $__STRING3__
call cptos
add $4, %esp
mov %eax, %ebx
# Loading local variable "awesomePerson" @-8(%ebp)
mov %ebx, -8(%ebp)
# requesting ownership for awesomePerson (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov $1123477881, %ebx
# Loading local variable "age" @-12(%ebp)
mov %ebx, -12(%ebp)
pushl $__STRING7__
push -12(%ebp)
call ftos
add $4, %esp
push %eax
pushl $__STRING6__
push -8(%ebp)
pushl $__STRING5__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_User_toString_
call __method_User_toString_
mov %eax, %ebx
push %eax
pushl $__STRING4__
pushl $7
call strjoinmany
add $32, %esp
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
push %ebx
push %ecx
push %ebx
pushl $__STRING2__
call strcmp
add $8, %esp
pop %ecx
pop %ebx
xor %ecx, %ecx
cmp $0, %eax
setz %cl
cmpb $1, %cl
jne __LABEL0__
pushl $__STRING8__
call puts
add $4, %esp
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# me: 4
# awesomePerson: 8
# age: 12
