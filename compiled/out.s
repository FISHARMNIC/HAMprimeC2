
/*
********HAM PRIME**********
Compiled with love on Thu Nov 21 2024 10:33:06 GMT-0700 (Mountain Standard Time)
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
.type	map, @function
.global map
__ALLOCFOR_map__ = 8
.type	entry, @function
.global entry
.4byte 4
__STRING0__: .asciz "Dad"
.4byte 4
__STRING1__: .asciz "Mom"
.4byte 4
__STRING2__: .asciz "Dog"
.4byte 4
__STRING3__: .asciz "Cat"
__ALLOCFOR_entry__ = 16
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 11
__STRING4__: .asciz "I love my "
.4byte 1
__STRING5__: .asciz ""
__ALLOCFOR___anonymous_a____ = 0
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
map:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_map__, %esp

# Loading local variable "i" @-4(%ebp)
# optimized move from $0 to -4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
# note, read PARAM arr -> 8(%ebp)
# Get array size
mov 8(%ebp), %eax # load arr
mov -4(%eax), %edx # get entry reference
mov 8(%edx),  %ecx # get size
shr $2, %ecx # divide by 4 (bytes to u32 or u16)
# Loading local variable "size" @-8(%ebp)
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
__LABEL1__:
# note, read STACK VAR i -> -4(%ebp)
# note, read STACK VAR size -> -8(%ebp)
mov -4(%ebp), %eax
mov -8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL2__
# note, read STACK VAR i -> -4(%ebp)
# note, read STACK VAR i -> -4(%ebp)
# note, read PARAM arr -> 8(%ebp)
#indexing array
mov 8(%ebp), %eax
# optimized move from -4(%ebp) to %edx
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
# note, read PARAM operation -> 12(%ebp)
push %ecx
# Calling function __not_a_function__
push %ecx
call *12(%ebp)
mov %eax, %esi
add $4, %esp
pop %ecx
# note, read PARAM arr -> 8(%ebp)
#Array set begin
mov 8(%ebp), %eax
# array load trash awful. Fix this bad optimize
push %eax
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %esi, (%eax)
# requesting ownership for array index
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
#Set end
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL1__
__LABEL2__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
# size: 8
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Allocation for array
pushl $0
pushl $16
call __rc_allocate__
add $8, %esp
# optimized move from __STRING0__ to 0(%eax)
mov $__STRING0__, %edx
mov %edx, 0(%eax)
# optimized move from __STRING1__ to 4(%eax)
mov $__STRING1__, %edx
mov %edx, 4(%eax)
# optimized move from __STRING2__ to 8(%eax)
mov $__STRING2__, %edx
mov %edx, 8(%eax)
# optimized move from __STRING3__ to 12(%eax)
mov $__STRING3__, %edx
mov %edx, 12(%eax)
mov %eax, %ecx
# Loading local variable "family" @-4(%ebp)
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for family (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
# note, read STACK VAR family -> -4(%ebp)
lea __anonymous_a__, %ecx
push %ecx
# Calling function map
push %ecx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call map
mov %eax, %esi
add $8, %esp
pop %ecx
popl __anonymous_a__ebpCapture__
# Loading local variable "__LABEL5__" @-8(%ebp)
# optimized move from $0 to -8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
# Loading local variable "__LABEL6__" @-12(%ebp)
# optimized move from $0 to -12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
# note, read STACK VAR family -> -4(%ebp)
# forEach loop
mov -4(%ebp), %eax # load arr
mov -4(%eax), %edx # get entry reference
mov 8(%edx),  %edx # get size
shr $2, %edx # divide by 4 (bytes to u32 or u16)
mov %edx, -12(%ebp) # size to arr len holder
mov (%eax), %eax # load first element into A
mov %eax, %ecx
# Loading local variable "person" @-16(%ebp)
# optimized move from %ecx to -16(%ebp)
mov %ecx, -16(%ebp)
__LABEL3__:
# comparison for forEach loop
mov -8(%ebp), %eax 
cmp -12(%ebp), %eax
jge __LABEL4__ # exit if finished
#indexing array
mov -4(%ebp), %eax
# optimized move from -8(%ebp) to %edx
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
mov %esi, -16(%ebp)
# note, read STACK VAR person -> -16(%ebp)
push -16(%ebp)
call puts
add $4, %esp
incw -8(%ebp)
jmp __LABEL3__
__LABEL4__:
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
# family: 4
# __LABEL5__: 8
# __LABEL6__: 12
# person: 16
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp

pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM value -> 8(%ebp)
pushl $__STRING5__
push 8(%ebp)
pushl $__STRING4__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
# optimized move from %esi to __gc_dontClear__
mov %esi, __gc_dontClear__
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

