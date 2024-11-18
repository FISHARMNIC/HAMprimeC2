
/*
********HAM PRIME**********
Compiled with love on Fri Nov 15 2024 21:51:12 GMT-0700 (Mountain Standard Time)
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
__SIZEOF_Person__ = 8
# format "Person" includes:
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
.type	entry, @function
.global entry
.4byte 5
__STRING0__: .asciz "Nico"
__ALLOCFOR_entry__ = 4
###################################
.text

#### compiler initation section ###
__init_for_out1__:
call __init_for_out0__

ret
.global __init_for_out1__
###################################

.global main
main:
call __init_for_out1__
call entry
ret

###################################
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Person
mov $__STRING0__, %edx
mov %edx, 0(%eax)
movl $18, 4(%eax)
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
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# me: 4

