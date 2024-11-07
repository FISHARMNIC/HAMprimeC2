
/*
********HAM PRIME**********
Compiled with love on Thu Nov 07 2024 09:28:44 GMT-0700 (Mountain Standard Time)
**************************
*/

.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
.align 4

.extern __disable_gc__
.extern __rc_triggerSegfaultOnNullOwnership__
.extern __PRINT_TYPE_INT__
.extern __this__
.extern __xmm_sse_temp__
.extern ___TEMPORARY_OWNER___

######## user data section ########
.type	__method_Person_toString_, @function
.global __method_Person_toString_
.4byte 7
__STRING0__: .asciz "Name: "
.4byte 10
__STRING1__: .asciz " || Age: "
__ALLOCFOR___method_Person_toString___ = 4
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	entry, @function
.global entry
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
__ALLOCFOR_entry__ = 20
###################################
.text

#### compiler initation section ###
__init_for_out__:


ret
.global __init_for_out__
###################################

.global main
main:
call __init_for_out__
call entry
ret

###################################
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp

# Reading property "name" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %esi
pushw __disable_gc__; movw $1, __disable_gc__
push %esi
call itos
add $4, %esp
push %eax
pushl $__STRING1__
push %ecx
pushl $__STRING0__
pushl $4
call strjoinmany
add $20, %esp
mov %eax, %edi
popw __disable_gc__
# Loading local variable "outStr" @-4(%ebp)
mov %edi, -4(%ebp)
# requesting ownership for outStr (create)
lea -4(%ebp), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR outStr -> -4(%ebp)
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR outStr -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# outStr: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Loading local variable "size" @-4(%ebp)
mov $5, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR size -> -4(%ebp)
# Asked for -4(%ebp) allocations of "Person"
mov $4, %edx
mov -4(%ebp), %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %ecx
# Loading local variable "arr" @-8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for arr (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
mov $__STRING2__, %edx
mov %edx, 0(%eax)
movl $17, 4(%eax)
# note, read STACK VAR arr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 0(%eax)
# requesting ownership for array index
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
mov $__STRING3__, %edx
mov %edx, 0(%eax)
movl $17, 4(%eax)
# note, read STACK VAR arr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 4(%eax)
# requesting ownership for array index
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
mov $__STRING4__, %edx
mov %edx, 0(%eax)
movl $48, 4(%eax)
# note, read STACK VAR arr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 8(%eax)
# requesting ownership for array index
lea 8(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
mov $__STRING5__, %edx
mov %edx, 0(%eax)
movl $43, 4(%eax)
# note, read STACK VAR arr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 12(%eax)
# requesting ownership for array index
lea 12(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
mov $__STRING6__, %edx
mov %edx, 0(%eax)
movl $10, 4(%eax)
# note, read STACK VAR arr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 16(%eax)
# requesting ownership for array index
lea 16(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# Loading local variable "__LABEL2__" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
# Loading local variable "__LABEL3__" @-16(%ebp)
mov $0, %edx
mov %edx, -16(%ebp)
# note, read STACK VAR arr -> -8(%ebp)
# forEach loop
mov -8(%ebp), %eax # load arr
mov -4(%eax), %edx # get entry reference
mov 8(%edx),  %edx # get size
shr $2, %edx # divide by 4 (bytes to u32 or u16)
mov %edx, -16(%ebp) # size to arr len holder
mov (%eax), %eax # load first element into A
mov %eax, %ecx
# Loading local variable "item" @-20(%ebp)
mov %ecx, -20(%ebp)
# requesting ownership for item (create)
lea -20(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
__LABEL0__:
# comparison for forEach loop
mov -12(%ebp), %eax 
cmp -16(%ebp), %eax
jge __LABEL1__ # exit if finished
#indexing array
mov -8(%ebp), %eax
xor %esi, %esi
mov -12(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
mov %esi, -20(%ebp)
# note, read STACK VAR item -> -20(%ebp)
mov -20(%ebp), %edx
mov %edx, __this__
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
incw -12(%ebp)
jmp __LABEL0__
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
# size: 4
# arr: 8
# __LABEL2__: 12
# __LABEL3__: 16
# item: 20

