
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
__STRING0__: .asciz "%i %i \n"
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
pushl $12
call __rc_allocate__
add $8, %esp
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $3, 8(%eax)
mov %eax, %ebx
# Loading local variable "arr" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# copying buffer
lea -4(%ebp), %esi
mov (%esi), %ecx
mov -4(%ecx), %ecx
pushl 8(%ecx)
call __rc_allocate__
pop %ecx
mov %eax, %edi
rep movsb
# Loading local variable "bob" @-8(%ebp)
mov %eax, -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
movl $4, 4(%eax)
#Set end
mov -8(%ebp), %eax
mov 4(%eax), %ebx
mov -4(%ebp), %eax
mov 4(%eax), %ecx
push %ebx
push %ecx
# Calling function printf
push %ecx
push %ebx
pushl $__STRING0__
call printf
mov %eax, %esi
add $12, %esp
pop %ecx
pop %ebx

mov %ebp, %esp
pop %ebp
ret
# arr: 4
# bob: 8
