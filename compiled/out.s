
/*
********HAM PRIME**********
Compiled with love on Fri Jan 03 2025 14:42:43 GMT-0800 (Pacific Standard Time)
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
__SIZEOF_LLGraphNode__ = 8
# format "LLGraphNode" includes:
#   - PROPERTY (p0) node
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_LLGraphNode_0_ (1 parameters)
#   - CNSTRCTR __constructor_LLGraphNode_1_ (1 parameters)
.type	__constructor_GraphNode_0_, @function
.global __constructor_GraphNode_0_
__ALLOCFOR___constructor_GraphNode_0___ = 0
.type	__method_GraphNode_addConnection_, @function
.global __method_GraphNode_addConnection_
__ALLOCFOR___method_GraphNode_addConnection___ = 0
.type	__method_GraphNode_addTwoWayConnection_, @function
.global __method_GraphNode_addTwoWayConnection_
__ALLOCFOR___method_GraphNode_addTwoWayConnection___ = 0
__SIZEOF_GraphNode__ = 16
# format "GraphNode" includes:
#   - PROPERTY (u32) distance
#   - PROPERTY (u32) visited
#   - PROPERTY (p0) connections
#   - PROPERTY (u32) value
#   - CNSTRCTR __constructor_GraphNode_0_ (1 parameters)
.type	__constructor_LLGraphNode_0_, @function
.global __constructor_LLGraphNode_0_
__ALLOCFOR___constructor_LLGraphNode_0___ = 0
.type	__constructor_LLGraphNode_1_, @function
.global __constructor_LLGraphNode_1_
__ALLOCFOR___constructor_LLGraphNode_1___ = 0
.type	__operator_LLGraphNode_index_get_0__, @function
.global __operator_LLGraphNode_index_get_0__
.4byte 20
__STRING0__: .asciz "Fatal error: Index "
.4byte 17
__STRING1__: .asciz " does not exist!"
__ALLOCFOR___operator_LLGraphNode_index_get_0____ = 8
.type	__method_LLGraphNode_findLast_, @function
.global __method_LLGraphNode_findLast_
.4byte 7
__STRING2__: .asciz "Error!"
__ALLOCFOR___method_LLGraphNode_findLast___ = 4
.type	__method_LLGraphNode_add_, @function
.global __method_LLGraphNode_add_
__ALLOCFOR___method_LLGraphNode_add___ = 4
.type	__method_LLGraphNode_add_brwd_, @function
.global __method_LLGraphNode_add_brwd_
__ALLOCFOR___method_LLGraphNode_add_brwd___ = 4
.type	__method_LLGraphNode_printAll_, @function
.global __method_LLGraphNode_printAll_
.4byte 5
__STRING3__: .asciz "%p\n"
__ALLOCFOR___method_LLGraphNode_printAll___ = 4
__SIZEOF_LLGraphNode__ = 8
# format "LLGraphNode" includes:
#   - PROPERTY (p0) node
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_LLGraphNode_0_ (1 parameters)
#   - CNSTRCTR __constructor_LLGraphNode_1_ (1 parameters)
.type	__constructor_Graph_0_, @function
.global __constructor_Graph_0_
__ALLOCFOR___constructor_Graph_0___ = 0
.type	__method_Graph_addNode_, @function
.global __method_Graph_addNode_
__ALLOCFOR___method_Graph_addNode___ = 0
.type	__method_Graph_dft_, @function
.global __method_Graph_dft_
__ALLOCFOR___method_Graph_dft___ = 4
__SIZEOF_Graph__ = 8
# format "Graph" includes:
#   - PROPERTY (p0) allNodes
#   - PROPERTY (u32) queue
#   - CNSTRCTR __constructor_Graph_0_ (0 parameters)
.type	entry, @function
.global entry
__ALLOCFOR_entry__ = 32
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
__constructor_GraphNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_GraphNode_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_GraphNode__"
mov $__SIZEOF_GraphNode__, %edx
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
# note, read PARAM v -> 8(%ebp)
# Reading property "value" in "__this__"
movl __this__, %eax
# optimized move from 8(%ebp) to 12(%eax)
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, 12(%eax)
# Reading property "visited" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# setting register "c" to "0"
mov $0, %ecx
# Reading property "connections" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 8(%eax)
mov %ecx, 8(%eax)
# requesting ownership for __this__ (property)
lea 8(%eax), %eax
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
__method_GraphNode_addConnection_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_GraphNode_addConnection___, %esp # total stack allocation

# Reading property "connections" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL0__
# note, read PARAM node -> 8(%ebp)
# setting register "c" to "8(%ebp)"
mov 8(%ebp), %ecx
pushl __this__
# pushing clobbers
push %ecx
# Calling function __constructor_LLGraphNode_1_
push %ecx
call __constructor_LLGraphNode_1_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __this__
# Reading property "connections" in "__this__"
movl __this__, %eax
# optimized move from %esi to 8(%eax)
mov %esi, 8(%eax)
# requesting ownership for __this__ (property)
lea 8(%eax), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL1__
__LABEL0__:
# note, read PARAM node -> 8(%ebp)
# setting register "c" to "8(%ebp)"
mov 8(%ebp), %ecx
# Reading property "connections" in "__this__"
movl __this__, %eax
# optimized move from 8(%eax) to %esi
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %esi
pushl __this__
# optimized move from %esi to __this__
mov %esi, __this__
# pushing clobbers
push %esi
push %ecx
# Calling function __method_LLGraphNode_add_brwd_
push %ecx
call __method_LLGraphNode_add_brwd_
mov %eax, %edi
add $4, %esp
# popping clobbers
pop %ecx
pop %esi
popl __this__
jmp __LABEL1__
__LABEL2__:
__LABEL1__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_GraphNode_addTwoWayConnection_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_GraphNode_addTwoWayConnection___, %esp # total stack allocation

# note, read PARAM node -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addConnection_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_GraphNode_addConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# note, read PARAM node -> 8(%ebp)
pushl __this__
# optimized move from 8(%ebp) to __this__
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addConnection_
# TODO optimize if variable just do movl
mov __this__, %edx
push %edx
call __method_GraphNode_addConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_LLGraphNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_LLGraphNode_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_LLGraphNode__"
mov $__SIZEOF_LLGraphNode__, %edx
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
# note, read PARAM node -> 8(%ebp)
# Reading property "node" in "__this__"
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
__constructor_LLGraphNode_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_LLGraphNode_1___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_LLGraphNode__"
mov $__SIZEOF_LLGraphNode__, %edx
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
# note, read PARAM node -> 8(%ebp)
# Reading property "node" in "__this__"
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
__operator_LLGraphNode_index_get_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_LLGraphNode_index_get_0____, %esp # total stack allocation

# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-4(%ebp) with "0"
# optimized move from 0 to -4(%ebp)
movl $0, -4(%ebp)
# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
# Loading local variable "walker" @-8(%ebp) with "__this__"
# optimized move from __this__ to -8(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -8(%ebp)
__LABEL3__:
# note, read STACK VAR walker -> -8(%ebp)
mov -8(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL4__
# note, read STACK VAR i -> -4(%ebp)
# note, read PARAM index -> 8(%ebp)
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL5__
# note, read STACK VAR walker -> -8(%ebp)
# Reading property "node" in "-8(%ebp)"
movl -8(%ebp), %eax
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
jmp __LABEL6__
__LABEL5__:
__LABEL6__:
# note, read STACK VAR walker -> -8(%ebp)
# Reading property "next" in "-8(%ebp)"
movl -8(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING walker <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL3__
__LABEL4__:
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM index -> 8(%ebp)
# setting register "d" to "__STRING1__"
movl $__STRING1__, %edx
push %edx
push 8(%ebp)
call itos
add $4, %esp
push %eax
# setting register "d" to "__STRING0__"
movl $__STRING0__, %edx
push %edx
pushl $3
call strjoinmany
add $16, %esp
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
# i: 4
# walker: 8
__method_LLGraphNode_findLast_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_findLast___, %esp # total stack allocation

# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "__this__"
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL7__
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING2__"
movl $__STRING2__, %edx
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
pushl $0
call quit
mov %eax, %ecx
add $4, %esp
# popping clobbers
jmp __LABEL8__
__LABEL7__:
__LABEL8__:
__LABEL9__:
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL10__
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
jmp __LABEL9__
__LABEL10__:
# note, read STACK VAR walker -> -4(%ebp)
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR walker -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
__method_LLGraphNode_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_add___, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_LLGraphNode_findLast_
call __method_LLGraphNode_findLast_
mov %eax, %ecx
# popping clobbers
popl __this__
# creating variable "last" of type "__LLGraphNode__staticdef__:borrowed" stack?=true
# Loading local variable "last" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read PARAM node -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_LLGraphNode_1_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_LLGraphNode_1_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# note, read STACK VAR last -> -4(%ebp)
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# last: 4
__method_LLGraphNode_add_brwd_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_add_brwd___, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_LLGraphNode_findLast_
call __method_LLGraphNode_findLast_
mov %eax, %ecx
# popping clobbers
popl __this__
# creating variable "last" of type "__LLGraphNode__staticdef__:borrowed" stack?=true
# Loading local variable "last" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read PARAM node -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_LLGraphNode_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_LLGraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# note, read STACK VAR last -> -4(%ebp)
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# last: 4
__method_LLGraphNode_printAll_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_printAll___, %esp # total stack allocation

# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "__this__"
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR walker -> -4(%ebp)
# pushing clobbers
# Calling function printf
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
pushl $__STRING3__
call printf
mov %eax, %ecx
add $8, %esp
# popping clobbers
__LABEL11__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL12__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "node" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "value" in "%ecx"
# optimized move from 12(%ecx) to %esi
# setting register "d" to "12(%ecx)"
mov 12(%ecx), %edx
mov %edx, %esi
# pushing multi-line clobbers
push %esi
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
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
jmp __LABEL11__
__LABEL12__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
__constructor_Graph_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Graph_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_Graph__"
mov $__SIZEOF_Graph__, %edx
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
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Graph_addNode_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Graph_addNode___, %esp # total stack allocation

# Reading property "allNodes" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL13__
# note, read PARAM node -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_LLGraphNode_1_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_LLGraphNode_1_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# Reading property "allNodes" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL14__
__LABEL13__:
# note, read PARAM node -> 8(%ebp)
# Reading property "allNodes" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
pushl __this__
# optimized move from %ecx to __this__
mov %ecx, __this__
# pushing clobbers
push %ecx
# Calling function __method_LLGraphNode_add_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_LLGraphNode_add_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __this__
jmp __LABEL14__
__LABEL15__:
__LABEL14__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Graph_dft_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Graph_dft___, %esp # total stack allocation

# note, read PARAM current -> 8(%ebp)
# Reading property "visited" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from 1 to 4(%eax)
movl $1, 4(%eax)
# note, read PARAM current -> 8(%ebp)
# Reading property "value" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from 12(%eax) to %ecx
# setting register "d" to "12(%eax)"
mov 12(%eax), %edx
mov %edx, %ecx
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
# note, read PARAM current -> 8(%ebp)
# Reading property "connections" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
# Loading local variable "walker" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
__LABEL16__:
# note, read STACK VAR walker -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL17__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "node" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "visited" in "%ecx"
# optimized move from 4(%ecx) to %esi
# setting register "d" to "4(%ecx)"
mov 4(%ecx), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $0, %esi
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL18__
# note, read STACK VAR walker -> -4(%ebp)
# Reading property "node" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_Graph_dft_
push %ecx
call __method_Graph_dft_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __this__
jmp __LABEL19__
__LABEL18__:
__LABEL19__:
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
jmp __LABEL16__
__LABEL17__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# walker: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_Graph_0_
call __constructor_Graph_0_
mov %eax, %ecx
# popping clobbers
# creating variable "graph" of type "Graph:dynamic" stack?=true
# Loading local variable "graph" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for graph (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $1
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node1" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node1" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for node1 (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $2
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node2" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node2" @-12(%ebp) with "%ecx"
# optimized move from %ecx to -12(%ebp)
mov %ecx, -12(%ebp)
# requesting ownership for node2 (create)
lea -12(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $3
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node3" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node3" @-16(%ebp) with "%ecx"
# optimized move from %ecx to -16(%ebp)
mov %ecx, -16(%ebp)
# requesting ownership for node3 (create)
lea -16(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $4
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node4" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node4" @-20(%ebp) with "%ecx"
# optimized move from %ecx to -20(%ebp)
mov %ecx, -20(%ebp)
# requesting ownership for node4 (create)
lea -20(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $5
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node5" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node5" @-24(%ebp) with "%ecx"
# optimized move from %ecx to -24(%ebp)
mov %ecx, -24(%ebp)
# requesting ownership for node5 (create)
lea -24(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $6
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node6" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node6" @-28(%ebp) with "%ecx"
# optimized move from %ecx to -28(%ebp)
mov %ecx, -28(%ebp)
# requesting ownership for node6 (create)
lea -28(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# pushing clobbers
# Calling function __constructor_GraphNode_0_
pushl $7
call __constructor_GraphNode_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "node7" of type "GraphNode:dynamic" stack?=true
# Loading local variable "node7" @-32(%ebp) with "%ecx"
# optimized move from %ecx to -32(%ebp)
mov %ecx, -32(%ebp)
# requesting ownership for node7 (create)
lea -32(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR node2 -> -12(%ebp)
# note, read STACK VAR node1 -> -8(%ebp)
# optimized move from -8(%ebp) to __this__
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -12(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node5 -> -24(%ebp)
# note, read STACK VAR node1 -> -8(%ebp)
# optimized move from -8(%ebp) to __this__
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -24(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node3 -> -16(%ebp)
# note, read STACK VAR node1 -> -8(%ebp)
# optimized move from -8(%ebp) to __this__
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -16(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node6 -> -28(%ebp)
# note, read STACK VAR node2 -> -12(%ebp)
# optimized move from -12(%ebp) to __this__
# setting register "d" to "-12(%ebp)"
mov -12(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -28(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node4 -> -20(%ebp)
# note, read STACK VAR node2 -> -12(%ebp)
# optimized move from -12(%ebp) to __this__
# setting register "d" to "-12(%ebp)"
mov -12(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -20(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node4 -> -20(%ebp)
# note, read STACK VAR node3 -> -16(%ebp)
# optimized move from -16(%ebp) to __this__
# setting register "d" to "-16(%ebp)"
mov -16(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -20(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node7 -> -32(%ebp)
# note, read STACK VAR node3 -> -16(%ebp)
# optimized move from -16(%ebp) to __this__
# setting register "d" to "-16(%ebp)"
mov -16(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -32(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node5 -> -24(%ebp)
# note, read STACK VAR node4 -> -20(%ebp)
# optimized move from -20(%ebp) to __this__
# setting register "d" to "-20(%ebp)"
mov -20(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_GraphNode_addTwoWayConnection_
# TODO optimize if variable just do movl
mov -24(%ebp), %edx
push %edx
call __method_GraphNode_addTwoWayConnection_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR node1 -> -8(%ebp)
# note, read STACK VAR graph -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Graph_dft_
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call __method_Graph_dft_
mov %eax, %ecx
add $4, %esp
# popping clobbers
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# graph: 4
# node1: 8
# node2: 12
# node3: 16
# node4: 20
# node5: 24
# node6: 28
# node7: 32

