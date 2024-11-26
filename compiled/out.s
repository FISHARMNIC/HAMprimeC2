
/*
********HAM PRIME**********
Compiled with love on Tue Nov 26 2024 11:01:33 GMT-0800 (Pacific Standard Time)
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
__ALLOCFOR___method_Person_toString___ = 0
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
__ALLOCFOR_entry__ = 8
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
sub $__ALLOCFOR___method_Person_toString___, %esp # total stack allocation

# Reading property "name" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %esi
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
# optimized move from %edi to __gc_dontClear__
mov %edi, __gc_dontClear__
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

# Loading local variable "size" @-4(%ebp)
# optimized move from $5 to -4(%ebp)
mov $5, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR size -> -4(%ebp)
push %ecx
# Asked for -4(%ebp) allocations of "Person"
mov $4, %edx
mov -4(%ebp), %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %ecx
# Loading local variable "arr" @-8(%ebp)
# optimized move from %ecx to -8(%ebp)
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
# optimized move from __STRING2__ to 0(%eax)
mov $__STRING2__, %edx
mov %edx, 0(%eax)
# optimized move from 18 to 4(%eax)
movl $18, 4(%eax)
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
# optimized move from __STRING3__ to 0(%eax)
mov $__STRING3__, %edx
mov %edx, 0(%eax)
# optimized move from 18 to 4(%eax)
movl $18, 4(%eax)
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
# optimized move from __STRING4__ to 0(%eax)
mov $__STRING4__, %edx
mov %edx, 0(%eax)
# optimized move from 48 to 4(%eax)
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
# optimized move from __STRING5__ to 0(%eax)
mov $__STRING5__, %edx
mov %edx, 0(%eax)
# optimized move from 43 to 4(%eax)
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
# optimized move from __STRING6__ to 0(%eax)
mov $__STRING6__, %edx
mov %edx, 0(%eax)
# optimized move from 10 to 4(%eax)
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
# note, read STACK VAR arr -> -8(%ebp)
# printing array (either string or format array)
mov -8(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
pushl $__method_Person_toString_ # load toString method
call print_formatArr
add $12, %esp
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

