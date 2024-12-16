
/*
********HAM PRIME**********
Compiled with love on Sun Dec 15 2024 17:51:34 GMT-0700 (Mountain Standard Time)
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
.type	map__overload__d__, @function
.global map__overload__d__
__ALLOCFOR_map__overload__d____ = 8
.type	__method_Person_toString_, @function
.global __method_Person_toString_
.4byte 7
__STRING0__: .asciz "name: "
.4byte 8
__STRING1__: .asciz ", age: "
.4byte 1
__STRING2__: .asciz ""
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	entry, @function
.global entry
.4byte 4
__STRING3__: .asciz "Dad"
.4byte 4
__STRING4__: .asciz "Mom"
.4byte 4
__STRING5__: .asciz "Dog"
.4byte 4
__STRING6__: .asciz "Cat"
.4byte 4
__STRING7__: .asciz "Bob"
.4byte 4
__STRING8__: .asciz "Joe"
.4byte 5
__STRING9__: .asciz "Phil"
__ALLOCFOR_entry__ = 12
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 11
__STRING10__: .asciz "I love my "
__ALLOCFOR___anonymous_a____ = 0
__anonymous_b__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_b__, @function
.global __anonymous_b__
__ALLOCFOR___anonymous_b____ = 0
__anonymous_c__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_c__, @function
.global __anonymous_c__
.4byte 9
__STRING11__: .asciz " Jackson"
__ALLOCFOR___anonymous_c____ = 0
__TEMP32_0__: .4byte 0
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
map__overload__d__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_map__overload__d____, %esp # total stack allocation

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
__LABEL4__:
# note, read STACK VAR i -> -4(%ebp)
# note, read STACK VAR size -> -8(%ebp)
mov -4(%ebp), %eax
mov -8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL5__
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
#Set end
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL4__
__LABEL5__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
# size: 8
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

# Allocating array {__STRING3__,__STRING4__,__STRING5__,__STRING6__}
# pushing clobbers
# Allocation for array
pushl $0
pushl $16
call __rc_allocate__
add $8, %esp
# popping clobbers
pushl $__STRING3__
pushl $__STRING4__
pushl $__STRING5__
pushl $__STRING6__
pushl $4
pushl %eax
call __sinc_loadStringArray
add $24, %esp
# Moving arr to out
# optimized move from %eax to %ecx
mov %eax, %ecx
# creating variable "family" of type "array:dynamic" stack?=true
# Loading local variable "family" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for family (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Allocating array {1,2,3,4,5,6,7,8}
# pushing clobbers
# Allocation for array
pushl $0
pushl $32
call __rc_allocate__
add $8, %esp
# popping clobbers
# optimized move from 1 to 0(%eax)
movl $1, 0(%eax)
# optimized move from 2 to 4(%eax)
movl $2, 4(%eax)
# optimized move from 3 to 8(%eax)
movl $3, 8(%eax)
# optimized move from 4 to 12(%eax)
movl $4, 12(%eax)
# optimized move from 5 to 16(%eax)
movl $5, 16(%eax)
# optimized move from 6 to 20(%eax)
movl $6, 20(%eax)
# optimized move from 7 to 24(%eax)
movl $7, 24(%eax)
# optimized move from 8 to 28(%eax)
movl $8, 28(%eax)
# Moving arr to out
# optimized move from %eax to %ecx
mov %eax, %ecx
# creating variable "ages" of type "array:dynamic" stack?=true
# Loading local variable "ages" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for ages (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
push %ecx
# Asked for 3 allocations of "Person"
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
mov %eax, %ecx
# creating variable "people" of type "array:dynamic" stack?=true
# Loading local variable "people" @-12(%ebp) with "%ecx"
# optimized move from %ecx to -12(%ebp)
mov %ecx, -12(%ebp)
# requesting ownership for people (create)
lea -12(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx # Local allocation address for Person
# optimized move from __STRING7__ to 0(%eax)
mov $__STRING7__, %edx
mov %edx, 0(%eax)
# optimized move from 1 to 4(%eax)
movl $1, 4(%eax)
# note, read STACK VAR people -> -12(%ebp)
# Array set begin
mov -12(%ebp), %eax
mov %ecx, 0(%eax)
# requesting ownership for array index
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# pushing clobbers
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx # Local allocation address for Person
# optimized move from __STRING8__ to 0(%eax)
mov $__STRING8__, %edx
mov %edx, 0(%eax)
# optimized move from 2 to 4(%eax)
movl $2, 4(%eax)
# note, read STACK VAR people -> -12(%ebp)
# Array set begin
mov -12(%ebp), %eax
mov %ecx, 4(%eax)
# requesting ownership for array index
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# pushing clobbers
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx # Local allocation address for Person
# optimized move from __STRING9__ to 0(%eax)
mov $__STRING9__, %edx
mov %edx, 0(%eax)
# optimized move from 3 to 4(%eax)
movl $3, 4(%eax)
# note, read STACK VAR people -> -12(%ebp)
# Array set begin
mov -12(%ebp), %eax
mov %ecx, 8(%eax)
# requesting ownership for array index
lea 8(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
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
pushl __anonymous_b__ebpCapture__;mov %ebp, __anonymous_b__ebpCapture__
# note, read STACK VAR ages -> -8(%ebp)
# reading address of __anonymous_b__
lea __anonymous_b__, %ecx
# pushing clobbers
push %ecx
# Calling function map
push %ecx
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call map__overload__d__
mov %eax, %esi
add $8, %esp
# popping clobbers
pop %ecx
popl __anonymous_b__ebpCapture__
pushl __anonymous_c__ebpCapture__;mov %ebp, __anonymous_c__ebpCapture__
# note, read STACK VAR people -> -12(%ebp)
# reading address of __anonymous_c__
lea __anonymous_c__, %ecx
# pushing clobbers
push %ecx
# Calling function map
push %ecx
# TODO optimize if variable just do movl
mov -12(%ebp), %edx
push %edx
call map
mov %eax, %esi
add $8, %esp
# popping clobbers
pop %ecx
popl __anonymous_c__ebpCapture__
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
# note, read STACK VAR ages -> -8(%ebp)
# pushing multi-line clobbers
# printing array
mov -8(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
# popping multi-line clobbers
# note, read STACK VAR people -> -12(%ebp)
# pushing multi-line clobbers
# printing array (either string or format array)
mov -12(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
pushl $__method_Person_toString_ # load toString method
call print_formatArr
add $12, %esp
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
# people: 12
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM value -> 8(%ebp)
pushl $__STRING2__
push 8(%ebp)
pushl $__STRING10__
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
__anonymous_b__:
mov __anonymous_b__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_b____, %esp # total stack allocation

# note, read PARAM value -> 8(%ebp)
# note, read PARAM value -> 8(%ebp)
mov 8(%ebp), %eax
mov 8(%ebp), %ebx
mul %ebx
mov %eax, %esi
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
__anonymous_c__:
mov __anonymous_c__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_c____, %esp # total stack allocation

# note, read PARAM value -> 8(%ebp)
# Reading property "age" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from 4(%eax) to %esi
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %esi
mov %esi, %eax
add $1, %eax
mov %eax, %edi
# note, read PARAM value -> 8(%ebp)
# Reading property "age" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from %edi to 4(%eax)
mov %edi, 4(%eax)
# note, read PARAM value -> 8(%ebp)
# Reading property "name" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from 0(%eax) to %esi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %esi
pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING11__
push %esi
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %edi
popw __disable_gc__
# note, read PARAM value -> 8(%ebp)
# Reading property "name" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from %edi to 0(%eax)
mov %edi, 0(%eax)
# requesting ownership for 8(%ebp) (property)
lea 0(%eax), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM value -> 8(%ebp)
# optimized move from 8(%ebp) to __gc_dontClear__
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, __gc_dontClear__
# setting register "a" to "8(%ebp)"
mov 8(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read PARAM value -> 8(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

