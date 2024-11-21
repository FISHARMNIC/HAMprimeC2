
/*
********HAM PRIME**********
Compiled with love on Thu Nov 21 2024 01:40:24 GMT-0700 (Mountain Standard Time)
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
.4byte 5
__STRING0__: .asciz "%i\n"
__ALLOCFOR_entry__ = 8
__TEMP32_0__: .4byte 0
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
sub $__ALLOCFOR_entry__, %esp

# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
# optimized move from 1 to 0(%eax)
movl $1, 0(%eax)
# optimized move from 2 to 4(%eax)
movl $2, 4(%eax)
# optimized move from 3 to 8(%eax)
movl $3, 8(%eax)
mov %eax, %ecx
# Loading local variable "arr" @-4(%ebp)
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-8(%ebp)
# optimized move from $0 to -8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
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
push %esi
push %ecx
push %edi
# Calling function printf
push %edi
pushl $__STRING0__
call printf
mov %eax, __TEMP32_0__
add $8, %esp
pop %edi
pop %ecx
pop %esi
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

