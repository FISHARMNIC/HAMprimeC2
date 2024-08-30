
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
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (u32) age
#   - PROPERTY (p8) name
__STRING0__: .asciz "Nina"
__STRING1__: .asciz "Nina"
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
# Loading local variable "bob" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for bob (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
movl $17, 0(%eax)
mov $__STRING0__, %edx
mov %edx, 4(%eax)
# Loading local variable "nina" @-8(%ebp)
mov %ebx, -8(%ebp)
# requesting ownership for nina (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
__LABEL0__:
mov -12(%ebp), %eax
movb $0, %bl
cmp $1000, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
movl $17, 0(%eax)
mov $__STRING1__, %edx
mov %edx, 4(%eax)
mov %ebx, -8(%ebp)
# requesting ownership for nina (set)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
xor %eax, %eax
mov -12(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -12(%ebp)
jmp __LABEL0__
__LABEL1__:
movl $123, -8(%ebp)

mov %ebp, %esp
pop %ebp
ret
# bob: 4
# nina: 8
# i: 12
