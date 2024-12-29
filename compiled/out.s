
/*
********HAM PRIME**********
Compiled with love on Sun Dec 29 2024 13:39:09 GMT-0800 (Pacific Standard Time)
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
.type	__constructor_List_0_, @function
.global __constructor_List_0_
__ALLOCFOR___constructor_List_0___ = 0
.type	__constructor_List_1_, @function
.global __constructor_List_1_
__ALLOCFOR___constructor_List_1___ = 4
.type	__method_List_push_, @function
.global __method_List_push_
__ALLOCFOR___method_List_push___ = 0
.type	__method_List_pop_, @function
.global __method_List_pop_
__ALLOCFOR___method_List_pop___ = 4
.type	__method_List_every_, @function
.global __method_List_every_
__ALLOCFOR___method_List_every___ = 4
.type	__method_List_toString_, @function
.global __method_List_toString_
.4byte 2
__STRING0__: .asciz "["
.4byte 2
__STRING1__: .asciz ","
.4byte 2
__STRING2__: .asciz "]"
__ALLOCFOR___method_List_toString___ = 8
.type	__operator_List_add_0__, @function
.global __operator_List_add_0__
__ALLOCFOR___operator_List_add_0____ = 4
__SIZEOF_List__ = 8
# format "List" includes:
#   - PROPERTY (p32) buffer
#   - PROPERTY (u32) length
#   - CNSTRCTR __constructor_List_0_ (0 parameters)
#   - CNSTRCTR __constructor_List_1_ (1 parameters, variadic)
.type	putint, @function
.global putint
.4byte 15
__STRING3__: .asciz "Printing: %i\n"
__ALLOCFOR_putint__ = 0
.type	entry, @function
.global entry
.4byte 10
__STRING4__: .asciz "[%i,%i]\n"
__ALLOCFOR_entry__ = 12
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 16
__STRING5__: .asciz "At [%i] is %i\n"
__ALLOCFOR___anonymous_a____ = 0
__TEMP8_0__: .1byte 0
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
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
__constructor_List_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_List_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_List__"
mov $__SIZEOF_List__, %edx
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
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0 to 0(%eax)
movl $0, 0(%eax)
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_List_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_List_1___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_List__"
mov $__SIZEOF_List__, %edx
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
# note, read PARAM size -> 8(%ebp)
# pushing clobbers
push %ecx
# Asked for 8(%ebp) allocations of "u32"
mov $4, %edx
mov 8(%ebp), %eax
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
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM size -> 8(%ebp)
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 8(%ebp) to 4(%eax)
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, 4(%eax)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-4(%ebp) with "0"
# optimized move from 0 to -4(%ebp)
movl $0, -4(%ebp)
__LABEL0__:
# note, read STACK VAR i -> -4(%ebp)
# note, read PARAM size -> 8(%ebp)
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
# note, read STACK VAR i -> -4(%ebp)
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# reading argument of index %ecx
# optimized move from %ecx to %eax
mov %ecx, %eax
add $2, %eax
mov (%ebp, %eax, 4), %esi
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %edi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %edi
# Array set begin
# array load trash awful. Fix this bad optimize
push %edi
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
jmp __LABEL0__
__LABEL1__:
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
__method_List_push_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_List_push___, %esp # total stack allocation

# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
add $1, %eax
mov %eax, %esi
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from %esi to 4(%eax)
mov %esi, 4(%eax)
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $1, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL2__
# pushing clobbers
push %ecx
# Asked for 1 allocations of "u32"
pushl $0
pushl $4
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
mov %eax, %ecx
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL3__
__LABEL2__:
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# pushing clobbers
push %esi
push %ecx
# Asked for %ecx allocations of "u32"
mov $4, %edx
mov %ecx, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
mov %eax, %esi
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %edi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %edi
# realloc buffer
push %edi
push %esi
call __copydata__
add $8, %esp
mov %eax, __TEMP32_0__
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from __TEMP32_0__ to 0(%eax)
# setting register "d" to "__TEMP32_0__"
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL3__
__LABEL4__:
__LABEL3__:
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# note, read PARAM element -> 8(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %edi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %edi
# Array set begin
mov 8(%ebp), %edx
mov %edx, (%edi, %esi, 4) # mhm
#Set end
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
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
__method_List_pop_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_List_pop___, %esp # total stack allocation

# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from %esi to 4(%eax)
mov %esi, 4(%eax)
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %esi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %esi
# indexing array
mov %esi, %eax
mov (%eax, %ecx, 4), %edi
# creating variable "retValue" of type "u32:borrowed" stack?=true
# Loading local variable "retValue" @-4(%ebp) with "%edi"
# optimized move from %edi to -4(%ebp)
mov %edi, -4(%ebp)
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# pushing clobbers
push %esi
push %ecx
# Asked for %ecx allocations of "u32"
mov $4, %edx
mov %ecx, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
mov %eax, %esi
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %edi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %edi
# realloc buffer
push %edi
push %esi
call __copydata__
add $8, %esp
mov %eax, __TEMP32_0__
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from __TEMP32_0__ to 0(%eax)
# setting register "d" to "__TEMP32_0__"
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR retValue -> -4(%ebp)
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR retValue -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# retValue: 4
__method_List_every_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_List_every___, %esp # total stack allocation

# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-4(%ebp) with "0"
# optimized move from 0 to -4(%ebp)
movl $0, -4(%ebp)
__LABEL5__:
# note, read STACK VAR i -> -4(%ebp)
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov -4(%ebp), %eax
movb $0, __TEMP8_0__
cmp %ecx, %eax
setl __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL6__
# note, read STACK VAR i -> -4(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
# optimized move from -4(%ebp) to %edx
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
# note, read STACK VAR i -> -4(%ebp)
# note, read PARAM iterator -> 8(%ebp)
# pushing clobbers
push %esi
push %ecx
# Calling function __not_a_function__
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
push %esi
call *8(%ebp)
mov %eax, %edi
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
# note, read STACK VAR i -> -4(%ebp)
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL5__
__LABEL6__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
__method_List_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_List_toString___, %esp # total stack allocation

# creating variable "build" of type "conststr:borrowed" stack?=true
pushl $__STRING0__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "build" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for build (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL7__:
# Reading property "length" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
movb $0, __TEMP8_0__
cmp %esi, %eax
setl __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL8__
# note, read STACK VAR i -> -8(%ebp)
# note, read STACK VAR build -> -4(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
# optimized move from -8(%ebp) to %edx
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING1__
push %esi
call itos
add $4, %esp
push %eax
push -4(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %edi
popw __disable_gc__
# SETTING build <- %edi
# requesting ownership for build (set). 
lea -4(%ebp), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
jmp __LABEL7__
__LABEL8__:
# note, read STACK VAR i -> -8(%ebp)
# note, read STACK VAR build -> -4(%ebp)
# Reading property "buffer" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
# optimized move from -8(%ebp) to %edx
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING2__
push %esi
call itos
add $4, %esp
push %eax
push -4(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %edi
popw __disable_gc__
# SETTING build <- %edi
# requesting ownership for build (set). 
lea -4(%ebp), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR build -> -4(%ebp)
# optimized move from -4(%ebp) to __gc_dontClear__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __gc_dontClear__
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR build -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# build: 4
# i: 8
__operator_List_add_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_List_add_0____, %esp # total stack allocation

# copying buffer
pushl __this__
call __duplicate__
add $4, %esp

mov %eax, %ecx
# creating variable "dupe" of type "List:dynamic" stack?=true
# Loading local variable "dupe" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for dupe (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM rhs -> 8(%ebp)
# note, read STACK VAR dupe -> -4(%ebp)
pushl __this__
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_List_push_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_List_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# note, read STACK VAR dupe -> -4(%ebp)
# optimized move from -4(%ebp) to __gc_dontClear__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __gc_dontClear__
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR dupe -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# dupe: 4
putint:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_putint__, %esp # total stack allocation

# note, read PARAM i -> 8(%ebp)
# pushing clobbers
# Calling function printf
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
pushl $__STRING3__
call printf
mov %eax, %ecx
add $8, %esp
# popping clobbers
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_List_0_
call __constructor_List_0_
mov %eax, %ecx
# popping clobbers
# creating variable "myList" of type "List:dynamic" stack?=true
# Loading local variable "myList" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for myList (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_List_push_
pushl $123
call __method_List_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_List_push_
pushl $456
call __method_List_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# Reading property "buffer" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# indexing array
mov %ecx, %eax
mov 0(%eax), %esi
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
push %esi
push %ecx
# Calling function __method_List_pop_
call __method_List_pop_
mov %eax, %edi
# popping clobbers
pop %ecx
pop %esi
# pushing clobbers
push %esi
push %ecx
push %edi
# Calling function printf
push %edi
push %esi
pushl $__STRING4__
call printf
mov %eax, __TEMP32_0__
add $12, %esp
# popping clobbers
pop %edi
pop %ecx
pop %esi
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_List_push_
pushl $321
call __method_List_push_
mov %eax, %ecx
add $4, %esp
# popping clobbers
pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
# reading address of __anonymous_a__
lea __anonymous_a__, %ecx
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_List_every_
push %ecx
call __method_List_every_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __anonymous_a__ebpCapture__
# pushing clobbers
# Calling function __constructor_List_1_
pushl $3
pushl $2
pushl $1
pushl $3
call __constructor_List_1_
mov %eax, %ecx
add $16, %esp
# popping clobbers
# creating variable "secondList" of type "List:dynamic" stack?=true
# Loading local variable "secondList" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for secondList (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR secondList -> -8(%ebp)
# optimized move from -8(%ebp) to __this__
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_List_add_0__
pushl $4
call __operator_List_add_0__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# optimized move from %ecx to __this__
mov %ecx, __this__
# pushing clobbers
push %ecx
# Calling function __operator_List_add_0__
pushl $5
call __operator_List_add_0__
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# creating variable "thirdList" of type "List:dynamic" stack?=true
# Loading local variable "thirdList" @-12(%ebp) with "%esi"
# optimized move from %esi to -12(%ebp)
mov %esi, -12(%ebp)
# requesting ownership for thirdList (create)
lea -12(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR thirdList -> -12(%ebp)
# pushing multi-line clobbers
# optimized move from -12(%ebp) to __this__
# setting register "d" to "-12(%ebp)"
mov -12(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_List_toString_
call __method_List_toString_
mov %eax, %ecx
# popping clobbers
push %ecx
call puts
add $4, %esp
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
# myList: 4
# secondList: 8
# thirdList: 12
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

# note, read PARAM n -> 12(%ebp)
# note, read PARAM i -> 8(%ebp)
# pushing clobbers
push %ecx
# Calling function printf
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
pushl $__STRING5__
call printf
mov %eax, %esi
add $12, %esp
# popping clobbers
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

