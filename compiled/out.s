
/*
********HAM PRIME**********
Compiled with love on Thu Nov 21 2024 01:20:03 GMT-0700 (Mountain Standard Time)
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
.type	__method_Person_toString_, @function
.global __method_Person_toString_
.4byte 6
__STRING0__: .asciz "Age: "
.4byte 9
__STRING1__: .asciz ", name: "
__ALLOCFOR___method_Person_toString___ = 0
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (u32) age
#   - PROPERTY (p8) name
.type	entry, @function
.global entry
.4byte 3
__STRING2__: .asciz "hi"
.4byte 5
__STRING3__: .asciz "Nico"
.4byte 4
__STRING4__: .asciz "Joe"
.4byte 4
__STRING5__: .asciz "Jim"
__ALLOCFOR_entry__ = 8
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
__method_Person_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_toString___, %esp

# Reading property "age" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "name" in "__this__"
movl __this__, %eax
# optimized move from 4(%eax) to %esi
mov 4(%eax), %edx
mov %edx, %esi
pushw __disable_gc__; movw $1, __disable_gc__
push %esi
pushl $__STRING1__
push %ecx
call itos
add $4, %esp
push %eax
pushl $__STRING0__
pushl $4
call strjoinmany
add $20, %esp
mov %eax, %edi
popw __disable_gc__
# optimized move from %edi to __gc_dontClear__
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

# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
# optimized move from 1 to 0(%eax)
movl $1, 0(%eax)
# optimized move from 2 to 4(%eax)
movl $2, 4(%eax)
# optimized move from 3 to 8(%eax)
movl $3, 8(%eax)
mov %eax, %ecx
# Loading local variable "arr" @-4(%ebp)
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR arr -> -4(%ebp)
# printing array
mov -4(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
# optimized move from 4 to 0(%eax)
movl $4, 0(%eax)
# optimized move from 5 to 4(%eax)
movl $5, 4(%eax)
# optimized move from 6 to 8(%eax)
movl $6, 8(%eax)
mov %eax, %ecx
# printing array
mov %ecx, %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
pushl $__STRING2__
call puts
add $4, %esp
pushl $123
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
mov $1139041534, %ecx
push %ecx
call print_float_noPromo
add $4, %esp
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
# optimized move from 17 to 0(%eax)
movl $17, 0(%eax)
# optimized move from __STRING3__ to 4(%eax)
mov $__STRING3__, %edx
mov %edx, 4(%eax)
# optimized move from %ecx to __this__
mov %ecx, __this__
push %ecx
# Calling function __method_Person_toString_
call __method_Person_toString_
mov %eax, %esi
pop %ecx
push %esi
call puts
add $4, %esp
push %ecx
# Asked for 2 allocations of "Person"
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %ecx
# Loading local variable "fmtArr" @-8(%ebp)
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for fmtArr (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
# optimized move from 123 to 0(%eax)
movl $123, 0(%eax)
# optimized move from __STRING4__ to 4(%eax)
mov $__STRING4__, %edx
mov %edx, 4(%eax)
# note, read STACK VAR fmtArr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 0(%eax)
# requesting ownership for array index
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
# optimized move from 456 to 0(%eax)
movl $456, 0(%eax)
# optimized move from __STRING5__ to 4(%eax)
mov $__STRING5__, %edx
mov %edx, 4(%eax)
# note, read STACK VAR fmtArr -> -8(%ebp)
#Array set begin
mov -8(%ebp), %eax
mov %ecx, 4(%eax)
# requesting ownership for array index
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
# note, read STACK VAR fmtArr -> -8(%ebp)
# printing format array
mov -8(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
pushl $__method_Person_toString_ # load toString method
call print_formatArr
add $8, %esp
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
# arr: 4
# fmtArr: 8

