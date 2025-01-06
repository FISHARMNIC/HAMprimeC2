
/*
********HAM PRIME**********
Compiled with love on Mon Jan 06 2025 10:49:00 GMT-0800 (Pacific Standard Time)
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
.type	__constructor_StaticLLNode_0_, @function
.global __constructor_StaticLLNode_0_
__ALLOCFOR___constructor_StaticLLNode_0___ = 0
__SIZEOF_StaticLLNode__ = 8
# format "StaticLLNode" includes:
#   - PROPERTY (u32) value
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_StaticLLNode_0_ (1 parameters)
.type	__constructor_StaticLL_0_, @function
.global __constructor_StaticLL_0_
__ALLOCFOR___constructor_StaticLL_0___ = 0
.type	__method_StaticLL_empty_, @function
.global __method_StaticLL_empty_
__ALLOCFOR___method_StaticLL_empty___ = 0
.type	__method_StaticLL_push_, @function
.global __method_StaticLL_push_
__ALLOCFOR___method_StaticLL_push___ = 4
.type	__method_StaticLL_pushFront_, @function
.global __method_StaticLL_pushFront_
__ALLOCFOR___method_StaticLL_pushFront___ = 4
.type	__method_StaticLL_pop_, @function
.global __method_StaticLL_pop_
.4byte 37
__STRING0__: .asciz "[LL ERROR] Cannot pop, list is empty"
__ALLOCFOR___method_StaticLL_pop___ = 12
.type	__method_StaticLL_popFront_, @function
.global __method_StaticLL_popFront_
__ALLOCFOR___method_StaticLL_popFront___ = 4
.type	__method_StaticLL_get_, @function
.global __method_StaticLL_get_
.4byte 30
__STRING1__: .asciz "[LL ERROR] Index out of range"
__ALLOCFOR___method_StaticLL_get___ = 8
.type	__method_StaticLL_set_, @function
.global __method_StaticLL_set_
__ALLOCFOR___method_StaticLL_set___ = 8
.type	__operator_StaticLL_index_get_0__, @function
.global __operator_StaticLL_index_get_0__
__ALLOCFOR___operator_StaticLL_index_get_0____ = 0
.type	__operator_StaticLL_index_set_1__, @function
.global __operator_StaticLL_index_set_1__
__ALLOCFOR___operator_StaticLL_index_set_1____ = 0
.type	__method_StaticLL_forEach_, @function
.global __method_StaticLL_forEach_
__ALLOCFOR___method_StaticLL_forEach___ = 8
__SIZEOF_StaticLL__ = 12
# format "StaticLL" includes:
#   - PROPERTY (p0) start
#   - PROPERTY (p0) end
#   - PROPERTY (p0) secondLast
#   - CNSTRCTR __constructor_StaticLL_0_ (0 parameters)
.type	__constructor_DynamicLLNode_0_, @function
.global __constructor_DynamicLLNode_0_
__ALLOCFOR___constructor_DynamicLLNode_0___ = 0
__SIZEOF_DynamicLLNode__ = 8
# format "DynamicLLNode" includes:
#   - PROPERTY (u32) value
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_DynamicLLNode_0_ (1 parameters)
.type	__constructor_DynamicLL_0_, @function
.global __constructor_DynamicLL_0_
__ALLOCFOR___constructor_DynamicLL_0___ = 0
.type	__method_DynamicLL_empty_, @function
.global __method_DynamicLL_empty_
__ALLOCFOR___method_DynamicLL_empty___ = 0
.type	__method_DynamicLL_push_, @function
.global __method_DynamicLL_push_
__ALLOCFOR___method_DynamicLL_push___ = 4
.type	__method_DynamicLL_pushFront_, @function
.global __method_DynamicLL_pushFront_
__ALLOCFOR___method_DynamicLL_pushFront___ = 4
.type	__method_DynamicLL_pop_, @function
.global __method_DynamicLL_pop_
__ALLOCFOR___method_DynamicLL_pop___ = 12
.type	__method_DynamicLL_popFront_, @function
.global __method_DynamicLL_popFront_
__ALLOCFOR___method_DynamicLL_popFront___ = 4
.type	__method_DynamicLL_get_, @function
.global __method_DynamicLL_get_
__ALLOCFOR___method_DynamicLL_get___ = 8
.type	__method_DynamicLL_set_, @function
.global __method_DynamicLL_set_
__ALLOCFOR___method_DynamicLL_set___ = 8
.type	__operator_DynamicLL_index_get_2__, @function
.global __operator_DynamicLL_index_get_2__
__ALLOCFOR___operator_DynamicLL_index_get_2____ = 0
.type	__operator_DynamicLL_index_set_3__, @function
.global __operator_DynamicLL_index_set_3__
__ALLOCFOR___operator_DynamicLL_index_set_3____ = 0
.type	__method_DynamicLL_forEach_, @function
.global __method_DynamicLL_forEach_
__ALLOCFOR___method_DynamicLL_forEach___ = 8
__SIZEOF_DynamicLL__ = 12
# format "DynamicLL" includes:
#   - PROPERTY (p0) start
#   - PROPERTY (p0) end
#   - PROPERTY (p0) secondLast
#   - CNSTRCTR __constructor_DynamicLL_0_ (0 parameters)
.type	entry, @function
.global entry
.4byte 8
__STRING2__: .asciz "Empty? "
.4byte 1
__STRING3__: .asciz ""
.4byte 23
__STRING4__: .asciz "Removing 2 elements..."
.4byte 3
__STRING5__: .asciz "\n"
.4byte 7
__STRING6__: .asciz "apples"
.4byte 8
__STRING7__: .asciz "oranges"
.4byte 8
__STRING8__: .asciz "peaches"
.4byte 12
__STRING9__: .asciz "blueberries"
.4byte 5
__STRING10__: .asciz "----"
__ALLOCFOR_entry__ = 4
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
__ALLOCFOR___anonymous_a____ = 0
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
__constructor_StaticLLNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_StaticLLNode_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_StaticLLNode__"
mov $__SIZEOF_StaticLLNode__, %edx
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
# note, read PARAM value -> 8(%ebp)
# Reading property "value" in "__this__"
movl __this__, %eax
# optimized move from 8(%ebp) to 0(%eax)
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# setting register "c" to "0"
mov $0, %ecx
# Reading property "next" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# requesting ownership for __this__ (property)
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_StaticLL_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_StaticLL_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_StaticLL__"
mov $__SIZEOF_StaticLL__, %edx
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
# setting register "c" to "0"
mov $0, %ecx
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# setting register "c" to "0"
mov $0, %ecx
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticLL_empty_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_empty___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL0__
# setting register "a" to "1"
mov $1, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticLL_push_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_push___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL2__
# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_StaticLLNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_StaticLLNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
jmp __LABEL3__
__LABEL2__:
# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_StaticLLNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_StaticLLNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "newEnd" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "newEnd" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for newEnd (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "secondLast" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 8(%eax)
mov %ecx, 8(%eax)
# note, read STACK VAR newEnd -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from -4(%ebp) to 4(%ecx)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%ecx)
# requesting ownership for %ecx (property)
lea 4(%ecx), %eax
push %eax
push -4(%ebp)
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR newEnd -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 4(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%eax)
jmp __LABEL3__
__LABEL4__:
__LABEL3__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticLL_pushFront_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_pushFront___, %esp # total stack allocation

# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_StaticLLNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_StaticLLNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "newNode" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "newNode" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for newNode (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read STACK VAR newNode -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# requesting ownership for -4(%ebp) (property)
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL5__
# note, read STACK VAR newNode -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 4(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%eax)
jmp __LABEL6__
__LABEL5__:
__LABEL6__:
# note, read STACK VAR newNode -> -4(%ebp)
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 0(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push -4(%ebp)
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# newNode: 4
__method_StaticLL_pop_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_pop___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL7__
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING0__"
movl $__STRING0__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
jmp __LABEL8__
__LABEL7__:
__LABEL8__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL9__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "rval" of type "u32:borrowed" stack?=true
# Loading local variable "rval" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0 to 0(%eax)
movl $0, 0(%eax)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# note, read STACK VAR rval -> -8(%ebp)
# setting register "a" to "-8(%ebp)"
mov -8(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR rval -> -8(%ebp)
jmp __LABEL10__
__LABEL9__:
__LABEL12__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from 4(%ecx) to %esi
# setting register "d" to "4(%ecx)"
mov 4(%ecx), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $0, %esi
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL13__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL12__
__LABEL13__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "value" in "%ecx"
# optimized move from 0(%ecx) to %esi
# setting register "d" to "0(%ecx)"
mov 0(%ecx), %edx
mov %edx, %esi
# creating variable "rval" of type "u32:borrowed" stack?=true
# Loading local variable "rval" @-12(%ebp) with "%esi"
# optimized move from %esi to -12(%ebp)
mov %esi, -12(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# note, read STACK VAR rval -> -12(%ebp)
# setting register "a" to "-12(%ebp)"
mov -12(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR rval -> -12(%ebp)
jmp __LABEL10__
__LABEL11__:
__LABEL10__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
__method_StaticLL_popFront_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_popFront___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "rval" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "rval" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for rval (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR rval -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL14__
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING0__"
movl $__STRING0__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
jmp __LABEL15__
__LABEL14__:
__LABEL15__:
# note, read STACK VAR rval -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov -4(%ebp), %eax
movb $0, __TEMP8_0__
cmp %ecx, %eax
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL16__
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
jmp __LABEL17__
__LABEL16__:
__LABEL17__:
# note, read STACK VAR rval -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR rval -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# rval: 4
__method_StaticLL_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_get___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL18__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL19__
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM index -> 8(%ebp)
mov -8(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL20__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL21__
__LABEL20__:
__LABEL21__:
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL18__
__LABEL19__:
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING1__"
movl $__STRING1__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
# i: 8
__method_StaticLL_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_set___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL22__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL23__
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM index -> 8(%ebp)
mov -8(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL24__
# note, read PARAM value -> 12(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 12(%ebp) to 0(%eax)
# setting register "d" to "12(%ebp)"
mov 12(%ebp), %edx
mov %edx, 0(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL25__
__LABEL24__:
__LABEL25__:
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL22__
__LABEL23__:
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING1__"
movl $__STRING1__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
# i: 8
__operator_StaticLL_index_get_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_StaticLL_index_get_0____, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_get_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_StaticLL_get_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_StaticLL_index_set_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_StaticLL_index_set_1____, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
# note, read PARAM value -> 12(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_set_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_StaticLL_set_
mov %eax, %ecx
add $8, %esp
# popping clobbers
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_StaticLL_forEach_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_forEach___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL26__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL27__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM func -> 8(%ebp)
# pushing clobbers
push %ecx
# Calling function __not_a_function__
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
push %ecx
call *8(%ebp)
mov %eax, %esi
add $8, %esp
# popping clobbers
pop %ecx
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL26__
__LABEL27__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
# i: 8
__constructor_DynamicLLNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_DynamicLLNode_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_DynamicLLNode__"
mov $__SIZEOF_DynamicLLNode__, %edx
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
# note, read PARAM value -> 8(%ebp)
# Reading property "value" in "__this__"
movl __this__, %eax
# optimized move from 8(%ebp) to 0(%eax)
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push 8(%ebp)
call __rc_requestOwnership__
add $8, %esp
# setting register "c" to "0"
mov $0, %ecx
# Reading property "next" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# requesting ownership for __this__ (property)
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_DynamicLL_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_DynamicLL_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_DynamicLL__"
mov $__SIZEOF_DynamicLL__, %edx
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
# setting register "c" to "0"
mov $0, %ecx
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# setting register "c" to "0"
mov $0, %ecx
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_DynamicLL_empty_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_empty___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL28__
# setting register "a" to "1"
mov $1, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL29__
__LABEL28__:
__LABEL29__:
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_DynamicLL_push_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_push___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL30__
# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_DynamicLLNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_DynamicLLNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
jmp __LABEL31__
__LABEL30__:
# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_DynamicLLNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_DynamicLLNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "newEnd" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "newEnd" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for newEnd (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "secondLast" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 8(%eax)
mov %ecx, 8(%eax)
# note, read STACK VAR newEnd -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from -4(%ebp) to 4(%ecx)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%ecx)
# requesting ownership for %ecx (property)
lea 4(%ecx), %eax
push %eax
push -4(%ebp)
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR newEnd -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 4(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%eax)
jmp __LABEL31__
__LABEL32__:
__LABEL31__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_DynamicLL_pushFront_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_pushFront___, %esp # total stack allocation

# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_DynamicLLNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_DynamicLLNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "newNode" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "newNode" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for newNode (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read STACK VAR newNode -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from %ecx to 4(%eax)
mov %ecx, 4(%eax)
# requesting ownership for -4(%ebp) (property)
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL33__
# note, read STACK VAR newNode -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 4(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%eax)
jmp __LABEL34__
__LABEL33__:
__LABEL34__:
# note, read STACK VAR newNode -> -4(%ebp)
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 0(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push -4(%ebp)
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# newNode: 4
__method_DynamicLL_pop_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_pop___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL35__
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING0__"
movl $__STRING0__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
jmp __LABEL36__
__LABEL35__:
__LABEL36__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL37__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "rval" of type "dyna:dynamic" stack?=true
# Loading local variable "rval" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for rval (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0 to 0(%eax)
movl $0, 0(%eax)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# note, read STACK VAR rval -> -8(%ebp)
# optimized move from -8(%ebp) to __gc_dontClear__
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, __gc_dontClear__
# setting register "a" to "-8(%ebp)"
mov -8(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR rval -> -8(%ebp)
jmp __LABEL38__
__LABEL37__:
__LABEL40__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from 4(%ecx) to %esi
# setting register "d" to "4(%ecx)"
mov 4(%ecx), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $0, %esi
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL41__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL40__
__LABEL41__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "value" in "%ecx"
# optimized move from 0(%ecx) to %esi
# setting register "d" to "0(%ecx)"
mov 0(%ecx), %edx
mov %edx, %esi
# creating variable "rval" of type "dyna:dynamic" stack?=true
# Loading local variable "rval" @-12(%ebp) with "%esi"
# optimized move from %esi to -12(%ebp)
mov %esi, -12(%ebp)
# requesting ownership for rval (create)
lea -12(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# note, read STACK VAR rval -> -12(%ebp)
# optimized move from -12(%ebp) to __gc_dontClear__
# setting register "d" to "-12(%ebp)"
mov -12(%ebp), %edx
mov %edx, __gc_dontClear__
# setting register "a" to "-12(%ebp)"
mov -12(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR rval -> -12(%ebp)
jmp __LABEL38__
__LABEL39__:
__LABEL38__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
__method_DynamicLL_popFront_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_popFront___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "rval" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "rval" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for rval (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR rval -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL42__
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING0__"
movl $__STRING0__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
jmp __LABEL43__
__LABEL42__:
__LABEL43__:
# note, read STACK VAR rval -> -4(%ebp)
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov -4(%ebp), %eax
movb $0, __TEMP8_0__
cmp %ecx, %eax
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL44__
# Reading property "end" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
jmp __LABEL45__
__LABEL44__:
__LABEL45__:
# note, read STACK VAR rval -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR rval -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# optimized move from %ecx to __gc_dontClear__
mov %ecx, __gc_dontClear__
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# rval: 4
__method_DynamicLL_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_get___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL46__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL47__
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM index -> 8(%ebp)
mov -8(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL48__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# optimized move from %ecx to __gc_dontClear__
mov %ecx, __gc_dontClear__
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL49__
__LABEL48__:
__LABEL49__:
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL46__
__LABEL47__:
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING1__"
movl $__STRING1__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
# i: 8
__method_DynamicLL_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_set___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL50__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL51__
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM index -> 8(%ebp)
mov -8(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL52__
# note, read PARAM value -> 12(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 12(%ebp) to 0(%eax)
# setting register "d" to "12(%ebp)"
mov 12(%ebp), %edx
mov %edx, 0(%eax)
# requesting ownership for -4(%ebp) (property)
lea 0(%eax), %eax
push %eax
push 12(%ebp)
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL53__
__LABEL52__:
__LABEL53__:
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL50__
__LABEL51__:
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING1__"
movl $__STRING1__, %edx
push %edx
pushl $1
call strjoinmany
add $8, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
# i: 8
__operator_DynamicLL_index_get_2__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_DynamicLL_index_get_2____, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_get_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_DynamicLL_get_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# optimized move from %ecx to __gc_dontClear__
mov %ecx, __gc_dontClear__
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_DynamicLL_index_set_3__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_DynamicLL_index_set_3____, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
# note, read PARAM value -> 12(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_set_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_DynamicLL_set_
mov %eax, %ecx
add $8, %esp
# popping clobbers
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_DynamicLL_forEach_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_DynamicLL_forEach___, %esp # total stack allocation

# Reading property "start" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "DynamicLLNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL54__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL55__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM func -> 8(%ebp)
# pushing clobbers
push %ecx
# Calling function __not_a_function__
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
push %ecx
call *8(%ebp)
mov %eax, %esi
add $8, %esp
# popping clobbers
pop %ecx
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL54__
__LABEL55__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
# i: 8
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_StaticLL_0_
call __constructor_StaticLL_0_
mov %eax, %ecx
# popping clobbers
# creating variable "linkedList" of type "StaticLL:dynamic" stack?=true
# Loading local variable "linkedList" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for linkedList (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_push_
pushl $1
call __method_StaticLL_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_push_
pushl $2
call __method_StaticLL_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_push_
pushl $3
call __method_StaticLL_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_pushFront_
pushl $0
call __method_StaticLL_pushFront_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_popFront_
call __method_StaticLL_popFront_
mov %eax, %ecx
# popping clobbers
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_pop_
call __method_StaticLL_pop_
mov %eax, %ecx
# popping clobbers
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
pushw __disable_gc__; movw $1, __disable_gc__
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_empty_
call __method_StaticLL_empty_
mov %eax, %ecx
# popping clobbers
# setting register "d" to "__STRING3__"
movl $__STRING3__, %edx
push %edx
push %ecx
call itos
add $4, %esp
push %eax
# setting register "d" to "__STRING2__"
movl $__STRING2__, %edx
push %edx
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# pushing multi-line clobbers
pushl $__STRING4__
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_pop_
call __method_StaticLL_pop_
mov %eax, %ecx
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_pop_
call __method_StaticLL_pop_
mov %eax, %ecx
# popping clobbers
pushw __disable_gc__; movw $1, __disable_gc__
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_StaticLL_empty_
call __method_StaticLL_empty_
mov %eax, %ecx
# popping clobbers
# setting register "d" to "__STRING5__"
movl $__STRING5__, %edx
push %edx
push %ecx
call itos
add $4, %esp
push %eax
# setting register "d" to "__STRING2__"
movl $__STRING2__, %edx
push %edx
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# Calling function __constructor_DynamicLL_0_
call __constructor_DynamicLL_0_
mov %eax, %ecx
# popping clobbers
# SETTING linkedList <- %ecx
# requesting ownership for linkedList (set). 
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_push_
# converting conststr to string (function call)
pushl $__STRING6__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __method_DynamicLL_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_push_
# converting conststr to string (function call)
pushl $__STRING7__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __method_DynamicLL_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_push_
# converting conststr to string (function call)
pushl $__STRING8__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __method_DynamicLL_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_DynamicLL_index_set_3__
# converting conststr to string (function call)
pushl $__STRING9__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
pushl $1
call __operator_DynamicLL_index_set_3__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_DynamicLL_index_get_2__
pushl $0
call __operator_DynamicLL_index_get_2__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_DynamicLL_index_get_2__
pushl $1
call __operator_DynamicLL_index_get_2__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_DynamicLL_index_get_2__
pushl $2
call __operator_DynamicLL_index_get_2__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# pushing multi-line clobbers
pushl $__STRING10__
call puts
add $4, %esp
# popping multi-line clobbers
pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
# reading address of __anonymous_a__
lea __anonymous_a__, %ecx
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_DynamicLL_forEach_
push %ecx
call __method_DynamicLL_forEach_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __anonymous_a__ebpCapture__
# pushing multi-line clobbers
pushl $__STRING10__
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_popFront_
call __method_DynamicLL_popFront_
mov %eax, %ecx
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_pop_
call __method_DynamicLL_pop_
mov %eax, %ecx
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR linkedList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_DynamicLL_pop_
call __method_DynamicLL_pop_
mov %eax, %ecx
# popping clobbers
# setting register "s" to "%ecx"
mov %ecx, %esi
# pushing multi-line clobbers
push %esi
call puts
add $4, %esp
# popping multi-line clobbers
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# linkedList: 4
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

# note, read PARAM item -> 8(%ebp)
# pushing multi-line clobbers
push %ecx
push 8(%ebp)
call puts
add $4, %esp
# popping multi-line clobbers
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

