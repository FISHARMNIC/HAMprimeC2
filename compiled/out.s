
/*
********HAM PRIME**********
Compiled with love on Mon Dec 09 2024 14:31:31 GMT-0700 (Mountain Standard Time)
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
__ALLOCFOR_entry__ = 8
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
map:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_map__, %esp # total stack allocation

# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-4(%ebp) with "0"
# optimized move from 0 to -4(%ebp)
movl $0, -4(%ebp)
# note, read PARAM arr -> 8(%ebp)
# Get array size
mov 8(%ebp), %eax # load arr
mov -4(%eax), %edx # get entry reference
mov 8(%edx),  %ecx # get size
shr $2, %ecx # divide by 4 (bytes to u32 or u16)
# creating variable "size" of type "u32:borrowed" stack?=true
# Loading local variable "size" @-8(%ebp) with "%ecx"
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
# indexing array
mov 8(%ebp), %eax
# optimized move from -4(%ebp) to %edx
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
# note, read PARAM operation -> 12(%ebp)
# pushing clobbers
push %ecx
# Calling function __not_a_function__
push %ecx
call *12(%ebp)
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# note, read PARAM arr -> 8(%ebp)
# Array set begin
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
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# Allocating array {__STRING0__,__STRING1__,__STRING2__,__STRING3__}
# pushing clobbers
# Allocation for array
pushl $0
pushl $16
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx
pushl $__STRING0__
pushl $__STRING1__
pushl $__STRING2__
pushl $__STRING3__
pushl $4
pushl %ecx
call __sinc_loadStringArray
add $24, %esp
mov %ecx, %esi
# creating variable "family" of type "array:dynamic" stack?=true
# Loading local variable "family" @-4(%ebp) with "%esi"
# optimized move from %esi to -4(%ebp)
mov %esi, -4(%ebp)
# requesting ownership for family (create)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# Allocating array {1,2,3,4}
# pushing clobbers
# Allocation for array
pushl $0
pushl $16
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
mov %ecx, %esi
# creating variable "ages" of type "array:dynamic" stack?=true
# Loading local variable "ages" @-8(%ebp) with "%esi"
# optimized move from %esi to -8(%ebp)
mov %esi, -8(%ebp)
# requesting ownership for ages (create)
lea -8(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
# note, read STACK VAR family -> -4(%ebp)
# reading address of __anonymous_a__
lea __anonymous_a__, %ecx
# pushing clobbers
push %ecx
# Calling function map
push %ecx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call map
mov %eax, %esi
add $8, %esp
# popping clobbers
pop %ecx
popl __anonymous_a__ebpCapture__
# pushing clobbers
# Calling function __rc_collect__
call __rc_collect__
mov %eax, %ecx
# popping clobbers
# note, read STACK VAR family -> -4(%ebp)
# pushing multi-line clobbers
# printing array (either string or format array)
mov -4(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_stringArr
add $8, %esp
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
# family: 4
# ages: 8
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

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
# setting register "a" to "%esi"
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

