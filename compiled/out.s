
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
__STRING0__: .asciz "%i\n"
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
# Loading local variable "i" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
__LABEL0__:
mov -8(%ebp), %eax
movb $0, %bl
cmp $3, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
xor %eax, %eax
mov -8(%ebp), %eax
mov $4, %ebx
mul %ebx
mov %eax, %ebx
push %ebx
xor %eax, %eax
mov -4(%ebp), %eax
add %ebx, %eax
mov %eax, %ecx
pop %ebx
# dereferencing %ecx
movl (%ecx), %esi
push %ebx
push %esi
push %ecx
# Calling function printf
push %esi
pushl $__STRING0__
call printf
mov %eax, %edi
add $8, %esp
pop %ecx
pop %esi
pop %ebx
xor %eax, %eax
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -8(%ebp)
jmp __LABEL0__
__LABEL1__:
mov $0, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# arr: 4
# i: 8
