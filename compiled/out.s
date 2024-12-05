
/*
********HAM PRIME**********
Compiled with love on Thu Dec 05 2024 01:54:13 GMT-0700 (Mountain Standard Time)
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
.type	entry, @function
.global entry
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
# Loading local variable "arr" @-4(%ebp)
# optimized move from %esi to -4(%ebp)
mov %esi, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-8(%ebp)
# optimized move from $0 to -8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
# note, read STACK VAR arr -> -4(%ebp)
# Setting pointer 5 -> -4(%ebp)
mov -4(%ebp), %eax
mov $5, %edx
movl %edx, (%eax)


# note, read STACK VAR arr -> -4(%ebp)
mov -4(%ebp), %eax
add $4, %eax
mov %eax, %ecx
# Setting pointer 6 -> %ecx
mov $6, %edx
movl %edx, (%ecx)


# note, read STACK VAR arr -> -4(%ebp)
mov -4(%ebp), %eax
add $8, %eax
mov %eax, %ecx
# Setting pointer 7 -> %ecx
mov $7, %edx
movl %edx, (%ecx)


__LABEL0__:
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
mov $0, %cl
cmp $3, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
mov $4, %ebx
mul %ebx
mov %eax, %ecx
# note, read STACK VAR arr -> -4(%ebp)
mov -4(%ebp), %eax
add %ecx, %eax
mov %eax, %esi
# dereferencing %esi
movl (%esi), %edi
push %edi
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
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
# arr: 4
# i: 8

