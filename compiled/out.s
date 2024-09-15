
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
.4byte 3
__STRING2__: .asciz "\n"
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.4byte 5
__STRING3__: .asciz "Nico"
.4byte 5
__STRING4__: .asciz "Nina"
.4byte 4
__STRING5__: .asciz "Mom"
.4byte 4
__STRING6__: .asciz "Dad"
.4byte 4
__STRING7__: .asciz "Rio"
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
pushl $__STRING2__
push %ecx
call itos
add $4, %esp
push %eax
pushl $__STRING1__
push %ebx
pushl $__STRING0__
pushl $5
call strjoinmany
add $24, %esp
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
# Loading local variable "arrsz" @-4(%ebp)
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
mov %ebx, 0(%eax)
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING4__, %edx
mov %edx, 0(%eax)
movl $17, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 4(%eax)
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING5__, %edx
mov %edx, 0(%eax)
movl $53, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 8(%eax)
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING6__, %edx
mov %edx, 0(%eax)
movl $62, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 12(%eax)
#Set end
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING7__, %edx
mov %edx, 0(%eax)
movl $10, 4(%eax)
#Array set begin
mov -8(%ebp), %eax
mov %ebx, 16(%eax)
#Set end
# Loading local variable "i" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
__LABEL0__:
mov -12(%ebp), %eax
movb $0, %bl
cmp $5, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
mov -8(%ebp), %eax
xor %ebx, %ebx
mov -12(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ebx
mov %ebx, __this__
push %ebx
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %ecx
pop %ebx
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
# arrsz: 4
# arr: 8
# i: 12
