
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
.extern __disable_gc__
######## user data section ########
.4byte 7
__STRING0__: .asciz "Name: "
.4byte 10
__STRING1__: .asciz " || Age: "
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.4byte 5
__STRING2__: .asciz "Nico"
.4byte 5
__STRING3__: .asciz "Nina"
.4byte 4
__STRING4__: .asciz "Mom"
.4byte 4
__STRING5__: .asciz "Dad"
.4byte 4
__STRING6__: .asciz "Dog"
.4byte 3
__STRING7__: .asciz "\n"
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
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp
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
pushl $__STRING1__
push %ebx
pushl $__STRING0__
pushl $4
call strjoinmany
add $20, %esp
mov %eax, %esi
# taking ownership AND returning
mov %esi, ___TEMPORARY_OWNER___
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Loading local variable "size" @-4(%ebp)
mov $5, %edx
mov %edx, -4(%ebp)
# Asked for -4(%ebp) allocations of "Person"
mov $4, %edx
mov -4(%ebp), %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %ebx
# Loading local variable "arr" @-8(%ebp)
mov %ebx, -8(%ebp)
# requesting ownership for arr (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING2__, %edx
mov %edx, 0(%eax)
movl $17, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 0(%eax)
# requesting ownership for array index
lea 0(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING3__, %edx
mov %edx, 0(%eax)
movl $17, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 4(%eax)
# requesting ownership for array index
lea 4(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING4__, %edx
mov %edx, 0(%eax)
movl $48, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 8(%eax)
# requesting ownership for array index
lea 8(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING5__, %edx
mov %edx, 0(%eax)
movl $43, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 12(%eax)
# requesting ownership for array index
lea 12(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING6__, %edx
mov %edx, 0(%eax)
movl $10, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 16(%eax)
# requesting ownership for array index
lea 16(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
# Loading local variable "i" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
__LABEL0__:
mov -12(%ebp), %eax
mov -4(%ebp), %edx
movb $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
mov -8(%ebp), %eax
xor %ebx, %ebx
mov -12(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ebx
pushl $__STRING7__
push %ebx
mov %ebx, __this__
push %ebx
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %ecx
pop %ebx
pop %ebx
push %eax
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
xor %eax, %eax
mov -12(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -12(%ebp)
jmp __LABEL0__
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
# size: 4
# arr: 8
# i: 12
