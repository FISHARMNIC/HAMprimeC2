
/*
********HAM PRIME**********
Compiled with love on Sat Jan 04 2025 11:39:01 GMT-0800 (Pacific Standard Time)
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
.type	__constructor_MapEntry_0_, @function
.global __constructor_MapEntry_0_
__ALLOCFOR___constructor_MapEntry_0___ = 0
__SIZEOF_MapEntry__ = 12
# format "MapEntry" includes:
#   - PROPERTY (p8) key
#   - PROPERTY (u32) value
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_MapEntry_0_ (2 parameters)
.type	__method_Map_kneErr_, @function
.global __method_Map_kneErr_
.4byte 13
__STRING0__: .asciz "Error:: key<"
.4byte 35
__STRING1__: .asciz "> does not exist. Exiting program."
__ALLOCFOR___method_Map_kneErr___ = 0
.type	__constructor_Map_0_, @function
.global __constructor_Map_0_
__ALLOCFOR___constructor_Map_0___ = 0
.type	__method_Map_find_, @function
.global __method_Map_find_
.4byte 10
__STRING2__: .asciz "Map empty"
__ALLOCFOR___method_Map_find___ = 4
.type	__method_Map_remove_, @function
.global __method_Map_remove_
__ALLOCFOR___method_Map_remove___ = 4
.type	__method_Map_set_, @function
.global __method_Map_set_
__ALLOCFOR___method_Map_set___ = 4
.type	__method_Map_get_, @function
.global __method_Map_get_
__ALLOCFOR___method_Map_get___ = 4
.type	__operator_Map_index_set_0__, @function
.global __operator_Map_index_set_0__
__ALLOCFOR___operator_Map_index_set_0____ = 0
.type	__operator_Map_index_get_1__, @function
.global __operator_Map_index_get_1__
__ALLOCFOR___operator_Map_index_get_1____ = 0
__SIZEOF_Map__ = 8
# format "Map" includes:
#   - PROPERTY (p0) head
#   - PROPERTY (p0) rlast
#   - CNSTRCTR __constructor_Map_0_ (0 parameters)
.type	entry, @function
.global entry
.4byte 4
__STRING3__: .asciz "bob"
.4byte 4
__STRING4__: .asciz "jon"
.4byte 5
__STRING5__: .asciz "mike"
.4byte 4
__STRING6__: .asciz "joe"
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
__constructor_MapEntry_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_MapEntry_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_MapEntry__"
mov $__SIZEOF_MapEntry__, %edx
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
# note, read PARAM k -> 8(%ebp)
# Reading property "key" in "__this__"
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
# note, read PARAM v -> 12(%ebp)
# Reading property "value" in "__this__"
movl __this__, %eax
# optimized move from 12(%ebp) to 4(%eax)
# setting register "d" to "12(%ebp)"
mov 12(%ebp), %edx
mov %edx, 4(%eax)
# Reading property "next" in "__this__"
movl __this__, %eax
# optimized move from 0 to 8(%eax)
movl $0, 8(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Map_kneErr_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_kneErr___, %esp # total stack allocation

# note, read PARAM k -> 8(%ebp)
pushw __disable_gc__; movw $1, __disable_gc__
# setting register "d" to "__STRING1__"
movl $__STRING1__, %edx
push %edx
push 8(%ebp)
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
pushl $0
call quit
mov %eax, %ecx
add $4, %esp
# popping clobbers
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_Map_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Map_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_Map__"
mov $__SIZEOF_Map__, %edx
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
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0 to 0(%eax)
movl $0, 0(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Map_find_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_find___, %esp # total stack allocation

# Reading property "head" in "__this__"
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
# pushing multi-line clobbers
pushl $__STRING2__
call puts
add $4, %esp
# popping multi-line clobbers
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "node" of type "MapEntry:dynamic" stack?=true
# Loading local variable "node" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
__LABEL2__:
# note, read STACK VAR node -> -4(%ebp)
# Reading property "key" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM k -> 8(%ebp)
# pushing clobbers
push %ecx
push %ecx
push 8(%ebp)
# comparing strings
call strcmp
add $8, %esp
# popping clobbers
pop %ecx
movb $0, __TEMP8_0__
cmp $0, %eax
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL3__
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL4__
# note, read STACK VAR node -> -4(%ebp)
# Reading property "rlast" in "__this__"
movl __this__, %eax
# optimized move from -4(%ebp) to 4(%eax)
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, 4(%eax)
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
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# SETTING node <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
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
__method_Map_remove_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_remove___, %esp # total stack allocation

# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "key" in "%ecx"
# optimized move from 0(%ecx) to %esi
# setting register "d" to "0(%ecx)"
mov 0(%ecx), %edx
mov %edx, %esi
# note, read PARAM k -> 8(%ebp)
# pushing clobbers
push %esi
push %ecx
push %esi
push 8(%ebp)
# comparing strings
call strcmp
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
movb $0, __TEMP8_0__
cmp $0, %eax
setz __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL6__
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from 8(%ecx) to %esi
# setting register "d" to "8(%ecx)"
mov 8(%ecx), %edx
mov %edx, %esi
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from %esi to 0(%eax)
mov %esi, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL7__
__LABEL6__:
__LABEL7__:
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from 8(%ecx) to %esi
# setting register "d" to "8(%ecx)"
mov 8(%ecx), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $0, %esi
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL8__
# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_kneErr_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_kneErr_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
jmp __LABEL9__
__LABEL8__:
__LABEL9__:
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# creating variable "node" of type "MapEntry:dynamic" stack?=true
# Loading local variable "node" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
__LABEL10__:
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# Reading property "key" in "%ecx"
# optimized move from 0(%ecx) to %esi
# setting register "d" to "0(%ecx)"
mov 0(%ecx), %edx
mov %edx, %esi
# note, read PARAM k -> 8(%ebp)
# pushing clobbers
push %esi
push %ecx
push %esi
push 8(%ebp)
# comparing strings
call strcmp
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
movb $0, __TEMP8_0__
cmp $0, %eax
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL11__
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# SETTING node <- %ecx
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL12__
# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_kneErr_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_kneErr_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
jmp __LABEL13__
__LABEL12__:
__LABEL13__:
jmp __LABEL10__
__LABEL11__:
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 8(%eax) to %ecx
# setting register "d" to "8(%eax)"
mov 8(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
# optimized move from 8(%ecx) to %esi
# setting register "d" to "8(%ecx)"
mov 8(%ecx), %edx
mov %edx, %esi
# note, read STACK VAR node -> -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from %esi to 8(%eax)
mov %esi, 8(%eax)
# requesting ownership for -4(%ebp) (property)
lea 8(%eax), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# node: 4
__method_Map_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_set___, %esp # total stack allocation

# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__ # comparison for "if" statement
jne __LABEL14__
# note, read PARAM k -> 8(%ebp)
# note, read PARAM val -> 12(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_MapEntry_0_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_MapEntry_0_
mov %eax, %ecx
add $8, %esp
# popping clobbers
popl __this__
# Reading property "head" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL15__
__LABEL14__:
# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_find_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "node" of type "__MapEntry__staticdef__:borrowed" stack?=true
# Loading local variable "node" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR node -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL17__
# note, read PARAM k -> 8(%ebp)
# note, read PARAM val -> 12(%ebp)
pushl __this__
# pushing clobbers
# Calling function __constructor_MapEntry_0_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_MapEntry_0_
mov %eax, %ecx
add $8, %esp
# popping clobbers
popl __this__
# Reading property "rlast" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %esi
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %esi
# Reading property "next" in "%esi"
# optimized move from %ecx to 8(%esi)
mov %ecx, 8(%esi)
# requesting ownership for %esi (property)
lea 8(%esi), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL18__
__LABEL17__:
# note, read PARAM val -> 12(%ebp)
# note, read STACK VAR node -> -4(%ebp)
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
# optimized move from 12(%ebp) to 4(%eax)
# setting register "d" to "12(%ebp)"
mov 12(%ebp), %edx
mov %edx, 4(%eax)
jmp __LABEL18__
__LABEL19__:
__LABEL18__:
jmp __LABEL15__
__LABEL16__:
__LABEL15__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Map_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_get___, %esp # total stack allocation

# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_find_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# creating variable "found" of type "__MapEntry__staticdef__:borrowed" stack?=true
# Loading local variable "found" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# note, read STACK VAR found -> -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL20__
# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_kneErr_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_kneErr_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL21__
__LABEL20__:
__LABEL21__:
# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_find_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# Reading property "value" in "%ecx"
# optimized move from 4(%ecx) to %esi
# setting register "d" to "4(%ecx)"
mov 4(%ecx), %edx
mov %edx, %esi
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
# found: 4
__operator_Map_index_set_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Map_index_set_0____, %esp # total stack allocation

# note, read PARAM k -> 8(%ebp)
# note, read PARAM v -> 12(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_set_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_set_
mov %eax, %ecx
add $8, %esp
# popping clobbers
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Map_index_get_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Map_index_get_1____, %esp # total stack allocation

# note, read PARAM k -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_get_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_get_
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_Map_0_
call __constructor_Map_0_
mov %eax, %ecx
# popping clobbers
# creating variable "map" of type "Map:dynamic" stack?=true
# Loading local variable "map" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for map (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_set_0__
pushl $123
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_0__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_set_0__
pushl $456
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_0__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_set_0__
pushl $789
# converting conststr to string (function call)
pushl $__STRING4__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_0__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_set_0__
pushl $321
# converting conststr to string (function call)
pushl $__STRING5__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_0__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_set_0__
pushl $654
# converting conststr to string (function call)
pushl $__STRING6__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_0__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_Map_remove_
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __method_Map_remove_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_get_1__
# converting conststr to string (function call)
pushl $__STRING4__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_1__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_get_1__
# converting conststr to string (function call)
pushl $__STRING5__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_1__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
# note, read STACK VAR map -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Map_index_get_1__
# converting conststr to string (function call)
pushl $__STRING6__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_1__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# map: 4

