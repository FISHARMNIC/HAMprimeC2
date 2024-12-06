
/*
********HAM PRIME**********
Compiled with love on Thu Dec 05 2024 19:03:00 GMT-0700 (Mountain Standard Time)
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
.4byte 14
__STRING0__: .asciz "while loops: "
.4byte 15
__STRING1__: .asciz "forEach loops:"
__ALLOCFOR_entry__ = 20
__TEMP8_0__: .1byte 0
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
pushl $__STRING0__
call puts
add $4, %esp
# popping multi-line clobbers
# creating variable "count" of type "u32:borrowed" stack?=true
# Loading local variable "count" @-4(%ebp) with "$0"
# optimized move from $0 to -4(%ebp)
# setting register "d" to "$0"
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL0__:
# note, read STACK VAR count -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $15, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
# note, read STACK VAR count -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING count <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR count -> -4(%ebp)
mov -4(%ebp), %eax
mov $2, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL2__
jmp __LABEL0__ # "continue" statement in loop
jmp __LABEL3__
__LABEL2__:
# note, read STACK VAR count -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $13, %eax
sete %cl
cmpb $1, %cl # comparison for "elif" statement
jne __LABEL4__
jmp __LABEL1__ # "break" statement in loop
jmp __LABEL3__
__LABEL4__:
# note, read STACK VAR count -> -4(%ebp)
# pushing multi-line clobbers
push -4(%ebp)
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
jmp __LABEL3__
__LABEL5__:
__LABEL3__:
jmp __LABEL0__
__LABEL1__:
# pushing multi-line clobbers
pushl $__STRING1__
call puts
add $4, %esp
# popping multi-line clobbers
# Allocating array {1,2,3,4,5,6}
# pushing clobbers
# Allocation for array
pushl $0
pushl $24
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
# optimized move from 4 to 12(%ecx)
movl $4, 12(%ecx)
# optimized move from 5 to 16(%ecx)
movl $5, 16(%ecx)
# optimized move from 6 to 20(%ecx)
movl $6, 20(%ecx)
mov %ecx, %esi
# creating variable "arr" of type "array:dynamic" stack?=true
# Loading local variable "arr" @-8(%ebp) with "%esi"
# optimized move from %esi to -8(%ebp)
mov %esi, -8(%ebp)
# requesting ownership for arr (create)
lea -8(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# creating variable "__LABEL8__" of type "u32:borrowed" stack?=true
# Loading local variable "__LABEL8__" @-12(%ebp) with "$0"
# optimized move from $0 to -12(%ebp)
# setting register "d" to "$0"
mov $0, %edx
mov %edx, -12(%ebp)
# creating variable "__LABEL10__" of type "u32:borrowed" stack?=true
# Loading local variable "__LABEL10__" @-16(%ebp) with "$0"
# optimized move from $0 to -16(%ebp)
# setting register "d" to "$0"
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
# creating variable "item" of type "u32:borrowed" stack?=true
mov %eax, %ecx
# Loading local variable "item" @-20(%ebp) with "%ecx"
# optimized move from %ecx to -20(%ebp)
mov %ecx, -20(%ebp)
__LABEL6__:
# comparison for forEach loop
mov -12(%ebp), %eax 
cmp -16(%ebp), %eax
jge __LABEL7__ # exit if finished
# indexing array
mov -8(%ebp), %eax
# optimized move from -12(%ebp) to %edx
# setting register "d" to "-12(%ebp)"
mov -12(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
mov %esi, -20(%ebp)
# note, read STACK VAR item -> -20(%ebp)
mov -20(%ebp), %eax
mov $0, %cl
cmp $5, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL11__
jmp __LABEL7__ # "break" statement in loop
jmp __LABEL12__
__LABEL11__:
# note, read STACK VAR item -> -20(%ebp)
mov -20(%ebp), %eax
mov $0, %cl
cmp $3, %eax
sete %cl
cmpb $1, %cl # comparison for "elif" statement
jne __LABEL13__
jmp __LABEL9__ # "continue" statement in loop
jmp __LABEL12__
__LABEL13__:
# note, read STACK VAR item -> -20(%ebp)
# pushing multi-line clobbers
push -20(%ebp)
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
jmp __LABEL12__
__LABEL14__:
__LABEL12__:
__LABEL9__: # forEach "continue" jumps here
incw -12(%ebp)
jmp __LABEL6__
__LABEL7__:
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# count: 4
# arr: 8
# __LABEL8__: 12
# __LABEL10__: 16
# item: 20

