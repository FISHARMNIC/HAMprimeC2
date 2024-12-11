
/*
********HAM PRIME**********
Compiled with love on Tue Dec 10 2024 21:17:31 GMT-0700 (Mountain Standard Time)
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
.4byte 1
__STRING0__: .asciz ""
.4byte 5
__STRING1__: .asciz " is "
.4byte 11
__STRING2__: .asciz " years old"
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	entry, @function
.global entry
.4byte 4
__STRING3__: .asciz "Jon"
.4byte 5
__STRING4__: .asciz "Mike"
__ALLOCFOR_entry__ = 16
###################################
.text

#### compiler initation section ###
__init_for_out__:

# auto-return OK for entry function
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
sub $__ALLOCFOR___method_Person_toString___, %esp # total stack allocation

pushw __disable_gc__; movw $1, __disable_gc__
# Reading property "name" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %esi
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %esi
pushl $__STRING2__
push %esi
call itos
add $4, %esp
push %eax
pushl $__STRING1__
push %ecx
pushl $__STRING0__
pushl $5
call strjoinmany
add $24, %esp
mov %eax, %edi
popw __disable_gc__
# optimized move from %edi to __gc_dontClear__
mov %edi, __gc_dontClear__
# setting register "a" to "%edi"
mov %edi, %eax
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
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# Allocating array {1,2,3}
# pushing clobbers
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx
# optimized move from 1 to 0(%ecx)
movl $1, 0(%ecx)
# optimized move from 2 to 4(%ecx)
movl $2, 4(%ecx)
# optimized move from 3 to 8(%ecx)
movl $3, 8(%ecx)
mov %ecx, %esi
# creating variable "arr" of type "array:dynamic" stack?=true
# Loading local variable "arr" @-4(%ebp) with "%esi"
# optimized move from %esi to -4(%ebp)
mov %esi, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR arr -> -4(%ebp)
# copying buffer
pushl -4(%ebp)
call __duplicate__
add $4, %esp

mov %eax, %ecx
# creating variable "bob" of type "array:dynamic" stack?=true
# Loading local variable "bob" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for bob (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR bob -> -8(%ebp)
# Array set begin
mov -8(%ebp), %eax
movl $4, 4(%eax)
#Set end
# note, read STACK VAR arr -> -4(%ebp)
# pushing multi-line clobbers
# printing array
mov -4(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
# popping multi-line clobbers
# note, read STACK VAR bob -> -8(%ebp)
# pushing multi-line clobbers
# printing array
mov -8(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
# popping multi-line clobbers
# pushing clobbers
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx # Local allocation address for Person
# optimized move from __STRING3__ to 0(%eax)
mov $__STRING3__, %edx
mov %edx, 0(%eax)
# optimized move from 123 to 4(%eax)
movl $123, 4(%eax)
# creating variable "jon" of type "Person:dynamic" stack?=true
# Loading local variable "jon" @-12(%ebp) with "%ecx"
# optimized move from %ecx to -12(%ebp)
mov %ecx, -12(%ebp)
# requesting ownership for jon (create)
lea -12(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR jon -> -12(%ebp)
# copying buffer
pushl -12(%ebp)
call __duplicate__
add $4, %esp

mov %eax, %ecx
# creating variable "mike" of type "Person:dynamic" stack?=true
# Loading local variable "mike" @-16(%ebp) with "%ecx"
# optimized move from %ecx to -16(%ebp)
mov %ecx, -16(%ebp)
# requesting ownership for mike (create)
lea -16(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR mike -> -16(%ebp)
# Reading property "name" in "-16(%ebp)"
movl -16(%ebp), %eax
# optimized move from __STRING4__ to 0(%eax)
mov $__STRING4__, %edx
mov %edx, 0(%eax)
# note, read STACK VAR jon -> -12(%ebp)
# pushing multi-line clobbers
# optimized move from -12(%ebp) to __this__
# setting register "d" to "-12(%ebp)"
mov -12(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %ecx
# popping clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR mike -> -16(%ebp)
# pushing multi-line clobbers
# optimized move from -16(%ebp) to __this__
# setting register "d" to "-16(%ebp)"
mov -16(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %ecx
# popping clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# setting register "a" to "0"
mov $0, %eax
# auto-return OK for entry function
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
# arr: 4
# bob: 8
# jon: 12
# mike: 16

