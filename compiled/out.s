
/*
********HAM PRIME**********
Compiled with love on Sun Jan 05 2025 00:16:15 GMT-0800 (Pacific Standard Time)
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
.type	__constructor_StaticList_0_, @function
.global __constructor_StaticList_0_
__ALLOCFOR___constructor_StaticList_0___ = 0
.type	__method_StaticList_push_, @function
.global __method_StaticList_push_
__ALLOCFOR___method_StaticList_push___ = 12
.type	__method_StaticList_pop_, @function
.global __method_StaticList_pop_
.4byte 27
__STRING0__: .asciz "[LIST ERROR] list is empty"
__ALLOCFOR___method_StaticList_pop___ = 8
.type	__method_StaticList_delete_, @function
.global __method_StaticList_delete_
.4byte 35
__STRING1__: .asciz "[LIST ERROR] index is out of range"
__ALLOCFOR___method_StaticList_delete___ = 8
.type	__method_StaticList_set_, @function
.global __method_StaticList_set_
__ALLOCFOR___method_StaticList_set___ = 0
.type	__method_StaticList_get_, @function
.global __method_StaticList_get_
__ALLOCFOR___method_StaticList_get___ = 0
.type	__operator_StaticList_index_set_0__, @function
.global __operator_StaticList_index_set_0__
__ALLOCFOR___operator_StaticList_index_set_0____ = 0
.type	__operator_StaticList_index_get_1__, @function
.global __operator_StaticList_index_get_1__
__ALLOCFOR___operator_StaticList_index_get_1____ = 0
__SIZEOF_StaticList__ = 12
# format "StaticList" includes:
#   - PROPERTY (u32) occupied
#   - PROPERTY (u32) maxSize
#   - PROPERTY (p32) buffer
#   - CNSTRCTR __constructor_StaticList_0_ (0 parameters)
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 4
__TEMP8_0__: .1byte 0
__TEMP8_1__: .1byte 0
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
__constructor_StaticList_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_StaticList_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_StaticList__"
mov $__SIZEOF_StaticList__, %edx
push %edx
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set). 
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
push %ecx
# Asked for 10 allocations of "any"
pushl $0
pushl $40
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
mov %eax, %ecx
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 8(%eax)
mov %ecx, 8(%eax)
# requesting ownership for __this__ (property)
lea 8(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from 0 to 0(%eax)
movl $0, 0(%eax)
# Reading property "maxSize" in "__this__"
movl __this__, %eax
# optimized move from 10 to 4(%eax)
movl $10, 4(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticList_push_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticList_push___, %esp # total stack allocation

# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "oldSize" of type "u32:borrowed" stack?=true
# Loading local variable "oldSize" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR oldSize -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# creating variable "newSize" of type "u32:borrowed" stack?=true
# Loading local variable "newSize" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR oldSize -> -4(%ebp)
# note, read PARAM value -> 8(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# Array set begin
mov 8(%ebp), %edx
# array load trash awful. Fix this bad optimize
push %ecx
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edx, (%eax)
#Set end
# Reading property "maxSize" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# creating variable "max" of type "u32:borrowed" stack?=true
# Loading local variable "max" @-12(%ebp) with "%ecx"
# optimized move from %ecx to -12(%ebp)
mov %ecx, -12(%ebp)
# note, read STACK VAR newSize -> -8(%ebp)
# note, read STACK VAR max -> -12(%ebp)
mov -8(%ebp), %eax
mov -12(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setg %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL1__
# note, read STACK VAR max -> -12(%ebp)
mov -12(%ebp), %eax
mov $2, %ebx
mul %ebx
mov %eax, %ecx
# Reading property "maxSize" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# note, read STACK VAR max -> -12(%ebp)
# pushing clobbers
push %ecx
# Asked for -12(%ebp) allocations of "any"
mov $4, %edx
mov -12(%ebp), %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
mov %eax, %ecx
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %esi
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %esi
# realloc buffer
push %esi
push %ecx
call __copydata__
add $8, %esp
mov %eax, %edi
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from %edi to 8(%eax)
mov %edi, 8(%eax)
# requesting ownership for __this__ (property)
lea 8(%eax), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL2__
__LABEL1__:
# note, read STACK VAR newSize -> -8(%ebp)
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from -8(%ebp) to 0(%eax)
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, 0(%eax)
jmp __LABEL2__
__LABEL3__:
__LABEL2__:
# optimized move from __this__ to __gc_dontClear__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __gc_dontClear__
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# oldSize: 4
# newSize: 8
# max: 12
__method_StaticList_pop_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticList_pop___, %esp # total stack allocation

# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "currentSize" of type "u32:borrowed" stack?=true
# Loading local variable "currentSize" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR currentSize -> -4(%ebp)
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ecx
# creating variable "smallerSize" of type "u32:borrowed" stack?=true
# Loading local variable "smallerSize" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR currentSize -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL4__
# pushing multi-line clobbers
pushl $__STRING0__
call puts
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# Calling function quit
pushl $1
call quit
mov %eax, %ecx
add $4, %esp
# popping clobbers
jmp __LABEL5__
__LABEL4__:
# note, read STACK VAR smallerSize -> -8(%ebp)
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from -8(%ebp) to 0(%eax)
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, 0(%eax)
# note, read STACK VAR smallerSize -> -8(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
# optimized move from -8(%ebp) to %edx
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
# setting register "a" to "%esi"
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL5__
__LABEL6__:
__LABEL5__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# currentSize: 4
# smallerSize: 8
__method_StaticList_delete_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticList_delete___, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
mov 8(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setge %cl
# note, read PARAM index -> 8(%ebp)
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %esi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %esi
mov 8(%ebp), %eax
movb $0, __TEMP8_0__
cmp %esi, %eax
setl __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %cl
jne __LABEL7__
cmpb $1, __TEMP8_0__
sete __TEMP8_1__
__LABEL7__:
cmpb $1, __TEMP8_1__ # comparison for "if" statement
jne __LABEL8__
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# note, read PARAM index -> 8(%ebp)
mov 8(%ebp), %eax
mov $4, %ebx
mul %ebx
mov %eax, %esi
mov %ecx, %eax
add %esi, %eax
mov %eax, %edi
# creating variable "memoryAddress" of type "p8:borrowed" stack?=true
# Loading local variable "memoryAddress" @-4(%ebp) with "%edi"
# optimized move from %edi to -4(%ebp)
mov %edi, -4(%ebp)
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM index -> 8(%ebp)
mov %ecx, %eax
sub 8(%ebp), %eax
sub $1, %eax
mov %eax, %esi
mov %esi, %eax
mov $4, %ebx
mul %ebx
mov %eax, %edi
# creating variable "difference" of type "u32:borrowed" stack?=true
# Loading local variable "difference" @-8(%ebp) with "%edi"
# optimized move from %edi to -8(%ebp)
mov %edi, -8(%ebp)
# note, read STACK VAR memoryAddress -> -4(%ebp)
mov -4(%ebp), %eax
add $4, %eax
mov %eax, %ecx
# note, read STACK VAR memoryAddress -> -4(%ebp)
# setting register "s" to "%ecx"
mov %ecx, %esi
# note, read STACK VAR difference -> -8(%ebp)
# pushing clobbers
push %esi
push %ecx
# Calling function memcpy
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
push %esi
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call memcpy
mov %eax, %edi
add $12, %esp
# popping clobbers
pop %ecx
pop %esi
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# Reading property "occupied" in "__this__"
movl __this__, %eax
# optimized move from %esi to 0(%eax)
mov %esi, 0(%eax)
jmp __LABEL9__
__LABEL8__:
# pushing multi-line clobbers
pushl $__STRING1__
call puts
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# Calling function quit
pushl $1
call quit
mov %eax, %ecx
add $4, %esp
# popping clobbers
jmp __LABEL9__
__LABEL10__:
__LABEL9__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticList_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticList_set___, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
# note, read PARAM value -> 12(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# Array set begin
mov 12(%ebp), %edx
# array load trash awful. Fix this bad optimize
push %ecx
mov 8(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edx, (%eax)
#Set end
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticList_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticList_get___, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
# optimized move from 8(%ebp) to %edx
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
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
__operator_StaticList_index_set_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_StaticList_index_set_0____, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
# note, read PARAM value -> 12(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# Array set begin
mov 12(%ebp), %edx
# array load trash awful. Fix this bad optimize
push %ecx
mov 8(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edx, (%eax)
#Set end
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_StaticList_index_get_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_StaticList_index_get_1____, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
# optimized move from 8(%ebp) to %edx
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_StaticList_0_
call __constructor_StaticList_0_
mov %eax, %ecx
# popping clobbers
# creating variable "list" of type "StaticList:dynamic" stack?=true
# Loading local variable "list" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for list (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# setting register "c" to "1123434234"
mov $1123434234, %ecx
# note, read STACK VAR list -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_StaticList_push_
push %ecx
call __method_StaticList_push_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# setting register "c" to "1139030622"
mov $1139030622, %ecx
# note, read STACK VAR list -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_StaticList_push_
push %ecx
call __method_StaticList_push_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# setting register "c" to "1145401983"
mov $1145401983, %ecx
# note, read STACK VAR list -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_StaticList_push_
push %ecx
call __method_StaticList_push_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# note, read STACK VAR list -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticList_delete_
pushl $1
call __method_StaticList_delete_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR list -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticList_pop_
call __method_StaticList_pop_
mov %eax, %ecx
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call print_float_noPromo
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR list -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_StaticList_index_get_1__
pushl $0
call __operator_StaticList_index_get_1__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call print_float_noPromo
add $4, %esp
# popping multi-line clobbers
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# list: 4

