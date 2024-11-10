
/*
********HAM PRIME**********
Compiled with love on Sun Nov 10 2024 16:54:26 GMT-0700 (Mountain Standard Time)
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
.type	__constructor_Person_0_, @function
.global __constructor_Person_0_
__ALLOCFOR___constructor_Person_0___ = 0
.type	__method_Person_toString_, @function
.global __method_Person_toString_
.4byte 1
__STRING0__: .asciz ""
.4byte 5
__STRING1__: .asciz " is "
.4byte 11
__STRING2__: .asciz " years old"
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
#   - CNSTRCTR __constructor_Person_0_ (2 parameters)
.type	entry, @function
.global entry
.4byte 5
__STRING3__: .asciz "Nico"
__ALLOCFOR_entry__ = 4
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
__constructor_Person_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Person_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Person__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set). 
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM n -> 8(%ebp)
# Reading property "name" in "__this__"
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push 8(%ebp)
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM age -> 12(%ebp)
# Reading property "age" in "__this__"
movl __this__, %eax
mov 12(%ebp), %edx
mov %edx, 4(%eax)
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp

pushw __disable_gc__; movw $1, __disable_gc__
# Reading property "name" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "__this__"
movl __this__, %eax
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
mov %edi, __gc_dontClear__
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
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Person_0_
pushl $18
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __constructor_Person_0_
mov %eax, %ecx
add $8, %esp
# Loading local variable "me" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for me (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR me -> -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
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
# me: 4

