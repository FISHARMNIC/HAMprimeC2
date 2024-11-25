
/*
********HAM PRIME**********
Compiled with love on Sun Nov 24 2024 20:51:18 GMT-0800 (Pacific Standard Time)
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
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (u32) age
#   - PROPERTY (p8) name
.type	entry, @function
.global entry
.4byte 5
__STRING0__: .asciz "Nina"
__ALLOCFOR_entry__ = 12
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
mov %eax, %ecx
# optimized move from 1 to 0(%ecx)
movl $1, 0(%ecx)
# optimized move from 2 to 4(%ecx)
movl $2, 4(%ecx)
# optimized move from 3 to 8(%ecx)
movl $3, 8(%ecx)
mov %ecx, %esi
# Loading local variable "bob" @-4(%ebp)
# optimized move from %esi to -4(%ebp)
mov %esi, -4(%ebp)
# requesting ownership for bob (create)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
# optimized move from 17 to 0(%eax)
movl $17, 0(%eax)
# optimized move from __STRING0__ to 4(%eax)
mov $__STRING0__, %edx
mov %edx, 4(%eax)
# Loading local variable "nina" @-8(%ebp)
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for nina (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-12(%ebp)
# optimized move from $0 to -12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
__LABEL0__:
# note, read STACK VAR i -> -12(%ebp)
mov -12(%ebp), %eax
mov $0, %cl
cmp $100000, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
# optimized move from 17 to 0(%eax)
movl $17, 0(%eax)
# optimized move from __STRING0__ to 4(%eax)
mov $__STRING0__, %edx
mov %edx, 4(%eax)
# SETTING nina <- %ecx
# requesting ownership for nina (set). 
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR i -> -12(%ebp)
mov -12(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -12(%ebp)
mov %ecx, -12(%ebp)
jmp __LABEL0__
__LABEL1__:
# SETTING nina <- 123
# optimized move from 123 to -8(%ebp)
movl $123, -8(%ebp)
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# bob: 4
# nina: 8
# i: 12

