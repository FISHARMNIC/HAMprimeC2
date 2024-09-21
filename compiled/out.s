
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
__ALLOCFOR_newArr__ = 4
.4byte 11
__STRING0__: .asciz "%i %i %i\n"
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
newArr:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_newArr__, %esp
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $3, 8(%eax)
mov %eax, %ebx
# Loading local variable "someArr" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for someArr (create)
lea -4(%ebp), %eax
push %eax
push %ebx
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
# someArr: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Calling function newArr
call newArr
mov %eax, %ebx
# Loading local variable "bob" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for bob (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %eax
mov 0(%eax), %ebx
mov -4(%ebp), %eax
mov 4(%eax), %ecx
mov -4(%ebp), %eax
mov 8(%eax), %esi
push %ebx
push %esi
push %ecx
# Calling function printf
push %esi
push %ecx
push %ebx
pushl $__STRING0__
call printf
mov %eax, %edi
add $16, %esp
pop %ecx
pop %esi
pop %ebx
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# bob: 4
