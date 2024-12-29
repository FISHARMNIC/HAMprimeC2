
/*
********HAM PRIME**********
Compiled with love on Sun Dec 29 2024 14:13:12 GMT-0800 (Pacific Standard Time)
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
.type	__operator_Item_add_0__, @function
.global __operator_Item_add_0__
__ALLOCFOR___operator_Item_add_0____ = 0
__SIZEOF_Item__ = 8
# format "Item" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) price
.type	add, @function
.global add
__ALLOCFOR_add__ = 0
.type	add__overload__a__, @function
.global add__overload__a__
__ALLOCFOR_add__overload__a____ = 0
.type	add__overload__b__, @function
.global add__overload__b__
__ALLOCFOR_add__overload__b____ = 0
.type	add__overload__c__, @function
.global add__overload__c__
__ALLOCFOR_add__overload__c____ = 0
.type	entry, @function
.global entry
.4byte 4
__STRING0__: .asciz "123"
.4byte 4
__STRING1__: .asciz "456"
.4byte 7
__STRING2__: .asciz "Burger"
.4byte 8
__STRING3__: .asciz "Samsung"
__ALLOCFOR_entry__ = 8
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
__operator_Item_add_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Item_add_0____, %esp # total stack allocation

# Reading property "price" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %ecx
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %ecx
# note, read PARAM b -> 8(%ebp)
# Reading property "price" in "8(%ebp)"
movl 8(%ebp), %eax
# optimized move from 4(%eax) to %esi
# setting register "d" to "4(%eax)"
mov 4(%eax), %edx
mov %edx, %esi
mov %ecx, %eax
add %esi, %eax
mov %eax, %edi
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
add:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_add__, %esp # total stack allocation

# note, read PARAM a -> 8(%ebp)
# note, read PARAM b -> 12(%ebp)
# optimized move from 8(%ebp) to __this__
# setting register "d" to "8(%ebp)"
mov 8(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_Item_add_0__
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
call __operator_Item_add_0__
mov %eax, %ecx
add $4, %esp
# popping clobbers
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
add__overload__a__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_add__overload__a____, %esp # total stack allocation

# note, read PARAM a -> 8(%ebp)
# note, read PARAM b -> 12(%ebp)
pushw __disable_gc__; movw $1, __disable_gc__
push 12(%ebp)
push 8(%ebp)
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
popw __disable_gc__
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
add__overload__b__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_add__overload__b____, %esp # total stack allocation

# note, read PARAM a -> 8(%ebp)
# note, read PARAM b -> 12(%ebp)
movss 8(%ebp), %xmm0
movss 12(%ebp), %xmm1
addss %xmm1, %xmm0
movss %xmm0, __TEMP32_0__
# setting register "a" to "__TEMP32_0__"
movl __TEMP32_0__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
add__overload__c__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_add__overload__c____, %esp # total stack allocation

# note, read PARAM a -> 8(%ebp)
# note, read PARAM b -> 12(%ebp)
mov 8(%ebp), %eax
add 12(%ebp), %eax
mov %eax, %ecx
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
# Calling function add
pushl $456
pushl $123
call add__overload__c__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# pushing multi-line clobbers
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
# setting register "c" to "1067282596"
mov $1067282596, %ecx
# setting register "s" to "1083304837"
mov $1083304837, %esi
# pushing clobbers
push %esi
push %ecx
# Calling function add
push %esi
push %ecx
call add__overload__b__
mov %eax, %edi
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
# pushing multi-line clobbers
push %edi
call print_float_noPromo
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# Calling function add
# converting conststr to string (function call)
pushl $__STRING1__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
# converting conststr to string (function call)
pushl $__STRING0__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call add__overload__a__
mov %eax, %ecx
add $8, %esp
# popping clobbers
# pushing multi-line clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, %ecx # Local allocation address for Item
# optimized move from __STRING2__ to 0(%eax)
mov $__STRING2__, %edx
mov %edx, 0(%eax)
# optimized move from 15 to 4(%eax)
movl $15, 4(%eax)
# creating variable "food" of type "Item:dynamic" stack?=true
# Loading local variable "food" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for food (create)
lea -4(%ebp), %eax
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
mov %eax, %ecx # Local allocation address for Item
# optimized move from __STRING3__ to 0(%eax)
mov $__STRING3__, %edx
mov %edx, 0(%eax)
# optimized move from 100 to 4(%eax)
movl $100, 4(%eax)
# creating variable "tv" of type "Item:dynamic" stack?=true
# Loading local variable "tv" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for tv (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR food -> -4(%ebp)
# note, read STACK VAR tv -> -8(%ebp)
# pushing clobbers
# Calling function add
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call add
mov %eax, %ecx
add $8, %esp
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
# food: 4
# tv: 8

