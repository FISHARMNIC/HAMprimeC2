
/*
********HAM PRIME**********
Compiled with love on Wed Jan 01 2025 19:34:08 GMT-0800 (Pacific Standard Time)
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
.type	__constructor_Linked_0_, @function
.global __constructor_Linked_0_
__ALLOCFOR___constructor_Linked_0___ = 0
.type	__method_Linked_findLast_, @function
.global __method_Linked_findLast_
__ALLOCFOR___method_Linked_findLast___ = 4
.type	__method_Linked_find_, @function
.global __method_Linked_find_
__ALLOCFOR___method_Linked_find___ = 8
.type	__method_Linked_index_, @function
.global __method_Linked_index_
__ALLOCFOR___method_Linked_index___ = 4
.type	__method_Linked_add_, @function
.global __method_Linked_add_
__ALLOCFOR___method_Linked_add___ = 8
.type	__method_Linked_remove_, @function
.global __method_Linked_remove_
.4byte 7
__STRING0__: .asciz "Index "
.4byte 17
__STRING1__: .asciz " does not exist!"
.4byte 18
__STRING2__: .asciz " is out of range!"
__ALLOCFOR___method_Linked_remove___ = 4
.type	__method_Linked_replace_, @function
.global __method_Linked_replace_
__ALLOCFOR___method_Linked_replace___ = 4
.type	__method_Linked_toString_, @function
.global __method_Linked_toString_
.4byte 2
__STRING3__: .asciz "["
.4byte 3
__STRING4__: .asciz "->"
.4byte 2
__STRING5__: .asciz "]"
__ALLOCFOR___method_Linked_toString___ = 8
__SIZEOF_Linked__ = 8
# format "Linked" includes:
#   - PROPERTY (u32) current
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_Linked_0_ (1 parameters)
.type	entry, @function
.global entry
.4byte 46
__STRING6__: .asciz "There should be an error below this...\n---> "
__ALLOCFOR_entry__ = 4
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
__constructor_Linked_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Linked_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_Linked__"
mov $__SIZEOF_Linked__, %edx
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
# Reading property "current" in "__this__"
movl __this__, %eax
# optimized move from 8(%ebp) to 0(%eax)
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# Reading property "next" in "__this__"
movl __this__, %eax
# optimized move from 0 to 4(%eax)
movl $0, 4(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Linked_findLast_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_findLast___, %esp # total stack allocation

# creating variable "node" of type "Linked:dynamic" stack?=true
# Loading local variable "node" @-4(%ebp) with "__this__"
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
__LABEL0__:
# note, read STACK VAR node -> -4(%ebp)
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
jne __LABEL1__
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING node <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
# note, read STACK VAR node -> -4(%ebp)
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR node -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# node: 4
__method_Linked_find_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_find___, %esp # total stack allocation

# creating variable "node" of type "Linked:dynamic" stack?=true
# Loading local variable "node" @-4(%ebp) with "__this__"
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# creating variable "i" of type "u32:borrowed" stack?=true
# Loading local variable "i" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
__LABEL2__:
# note, read STACK VAR i -> -8(%ebp)
# note, read PARAM index -> 8(%ebp)
mov -8(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL3__
# note, read STACK VAR node -> -4(%ebp)
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
jne __LABEL4__
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL5__
__LABEL4__:
__LABEL5__:
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING node <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR i -> -8(%ebp)
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# SETTING i <- %ecx
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
jmp __LABEL2__
__LABEL3__:
# note, read STACK VAR node -> -4(%ebp)
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR node -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# node: 4
# i: 8
__method_Linked_index_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_index___, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Linked_find_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "ref" of type "__Linked__staticdef__:borrowed" stack?=true
# Loading local variable "ref" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR ref -> -4(%ebp)
# Reading property "current" in "-4(%ebp)"
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
# ref: 4
__method_Linked_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_add___, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_findLast_
call __method_Linked_findLast_
mov %eax, %ecx
# popping clobbers
popl __this__
# creating variable "end" of type "__Linked__staticdef__:borrowed" stack?=true
# Loading local variable "end" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read PARAM value -> 8(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_Linked_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_Linked_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "newAddr" of type "Linked:dynamic" stack?=true
# Loading local variable "newAddr" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for newAddr (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR newAddr -> -8(%ebp)
# note, read STACK VAR end -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from -8(%ebp) to 4(%eax)
# setting register "d" to "-8(%ebp)"
mov -8(%ebp), %edx
mov %edx, 4(%eax)
# requesting ownership for -4(%ebp) (property)
lea 4(%eax), %eax
push %eax
push -8(%ebp)
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# end: 4
# newAddr: 8
__method_Linked_remove_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_remove___, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
mov 8(%ebp), %eax
mov $0, %cl
cmp $1, %eax
setl %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL6__
# Reading property "next" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING __this__ <- %ecx
# requesting ownership for __this__ (set). 
lea __this__, %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL7__
__LABEL6__:
# note, read PARAM index -> 8(%ebp)
mov 8(%ebp), %eax
sub $1, %eax
mov %eax, %ecx
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_Linked_find_
push %ecx
call __method_Linked_find_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __this__
# creating variable "previous" of type "__Linked__staticdef__:borrowed" stack?=true
# Loading local variable "previous" @-4(%ebp) with "%esi"
# optimized move from %esi to -4(%ebp)
mov %esi, -4(%ebp)
# note, read STACK VAR previous -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL9__
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
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL10__
__LABEL9__:
# note, read STACK VAR previous -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "elif" statement
jne __LABEL11__
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM index -> 8(%ebp)
# setting register "d" to "__STRING2__"
movl $__STRING2__, %edx
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
jmp __LABEL10__
__LABEL11__:
# note, read STACK VAR previous -> -4(%ebp)
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
# note, read STACK VAR previous -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from %esi to 4(%eax)
mov %esi, 4(%eax)
# requesting ownership for -4(%ebp) (property)
lea 4(%eax), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL10__
__LABEL12__:
__LABEL10__:
jmp __LABEL7__
__LABEL8__:
__LABEL7__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Linked_replace_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_replace___, %esp # total stack allocation

# note, read PARAM index -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Linked_find_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "node" of type "__Linked__staticdef__:borrowed" stack?=true
# Loading local variable "node" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read PARAM value -> 12(%ebp)
# note, read STACK VAR node -> -4(%ebp)
# Reading property "current" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 12(%ebp) to 0(%eax)
# setting register "d" to "12(%ebp)"
mov 12(%ebp), %edx
mov %edx, 0(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# node: 4
__method_Linked_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_toString___, %esp # total stack allocation

# creating variable "node" of type "Linked:dynamic" stack?=true
# Loading local variable "node" @-4(%ebp) with "__this__"
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# creating variable "build" of type "conststr:borrowed" stack?=true
# converting conststr "__STRING3__" to dynamic string
pushl $__STRING3__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "build" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for build (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
__LABEL13__:
# note, read STACK VAR node -> -4(%ebp)
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
jne __LABEL14__
# note, read STACK VAR build -> -8(%ebp)
# note, read STACK VAR node -> -4(%ebp)
# Reading property "current" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING4__"
movl $__STRING4__, %edx
push %edx
push %ecx
call itos
add $4, %esp
push %eax
push -8(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
# SETTING build <- %esi
# requesting ownership for build (set). 
lea -8(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# SETTING node <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
jmp __LABEL13__
__LABEL14__:
# note, read STACK VAR build -> -8(%ebp)
# note, read STACK VAR node -> -4(%ebp)
# Reading property "current" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING5__"
movl $__STRING5__, %edx
push %edx
push %ecx
call itos
add $4, %esp
push %eax
push -8(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
popw __disable_gc__
# SETTING build <- %esi
# requesting ownership for build (set). 
lea -8(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR build -> -8(%ebp)
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
# note, read STACK VAR build -> -8(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# node: 4
# build: 8
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_Linked_0_
pushl $1
call __constructor_Linked_0_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "myList" of type "Linked:dynamic" stack?=true
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
# Calling function __method_Linked_add_
pushl $2
call __method_Linked_add_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_add_
pushl $3
call __method_Linked_add_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# pushing multi-line clobbers
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_toString_
call __method_Linked_toString_
mov %eax, %ecx
# popping clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_remove_
pushl $0
call __method_Linked_remove_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# Loading into __this__ because function modified it 
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_add_
pushl $5
call __method_Linked_add_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_replace_
pushl $4
pushl $2
call __method_Linked_replace_
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# pushing multi-line clobbers
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_toString_
call __method_Linked_toString_
mov %eax, %ecx
# popping clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_remove_
pushl $1
call __method_Linked_remove_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# Loading into __this__ because function modified it 
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_add_
pushl $8
call __method_Linked_add_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_add_
pushl $16
call __method_Linked_add_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_add_
pushl $32
call __method_Linked_add_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_remove_
pushl $4
call __method_Linked_remove_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# Loading into __this__ because function modified it 
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
# note, read STACK VAR myList -> -4(%ebp)
# pushing multi-line clobbers
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_toString_
call __method_Linked_toString_
mov %eax, %ecx
# popping clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# Calling function printf
pushl $__STRING6__
call printf
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR myList -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Linked_remove_
pushl $10
call __method_Linked_remove_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# Loading into __this__ because function modified it 
# optimized move from __this__ to -4(%ebp)
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, -4(%ebp)
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

