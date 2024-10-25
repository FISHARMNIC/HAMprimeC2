
/*
********HAM PRIME**********
Compiled with love on Fri Oct 25 2024 10:29:58 GMT-0600 (Mountain Daylight Time)
**************************
*/

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
.type	__method_User_toString_, @function
.4byte 7
__STRING0__: .asciz " (age "
.4byte 2
__STRING1__: .asciz ")"
__ALLOCFOR___method_User_toString___ = 4
__SIZEOF_User__ = 8
# format "User" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	entry, @function
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
.4byte 24
__STRING8__: .asciz "! And in 1 year I will "
.4byte 27
__STRING9__: .asciz "Hey! My name is also Nico!"
__ALLOCFOR_entry__ = 12
__TEMP8_0__: .1byte 0
__TEMP32_0__: .4byte 0
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

# Reading property "name" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %esi
pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING1__
push %esi
call itos
add $4, %esp
push %eax
pushl $__STRING0__
push %ecx
pushl $4
call strjoinmany
add $20, %esp
mov %eax, %edi
popw __disable_gc__
# Loading local variable "out" @-4(%ebp)
mov %edi, -4(%ebp)
# requesting ownership for out (create)
lea -4(%ebp), %eax
push %eax
push %edi
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

# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for User
mov $__STRING2__, %edx
mov %edx, 0(%eax)
movl $18, 4(%eax)
# Loading local variable "me" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for me (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
pushl $__STRING3__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "awesomePerson" @-8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for awesomePerson (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov $1123477881, %ecx
# Loading local variable "age" @-12(%ebp)
mov %ecx, -12(%ebp)
pushw __disable_gc__; movw $1, __disable_gc__
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
mov %eax, %ecx
push %eax
pushl $__STRING4__
pushl $7
call strjoinmany
add $32, %esp
mov %eax, %ecx
popw __disable_gc__
push %ecx
call puts
add $4, %esp
movss -12(%ebp), %xmm0
movl $1, __xmm_sse_temp__
cvtsi2ss __xmm_sse_temp__, %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING7__
movl __TEMP32_0__, %edx
push %edx
call ftos
add $4, %esp
push %eax
pushl $__STRING8__
push -8(%ebp)
pushl $__STRING5__
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_User_toString_
call __method_User_toString_
mov %eax, %ecx
push %eax
pushl $__STRING4__
pushl $7
call strjoinmany
add $32, %esp
mov %eax, %ecx
popw __disable_gc__
push %ecx
call puts
add $4, %esp
# Reading property "name" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ecx
push %ecx
push %ecx
pushl $__STRING2__
call strcmp
add $8, %esp
pop %ecx
movb $0, __TEMP8_0__
cmp $0, %eax
setz __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL0__
pushl $__STRING9__
call puts
add $4, %esp
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
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
# me: 4
# awesomePerson: 8
# age: 12
