
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"


.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
.global ___TEMPORARY_OWNER___
.global __this__
.extern __disable_gc__
######## user data section ########
__ALLOCFOR___method_Person_add___ = 0
__ALLOCFOR___method_Person_print___ = 0
__SIZEOF_Person__ = 4
# format "Person" includes:
#   - PROPERTY (p8) name
.4byte 5
__STRING0__: .asciz "Nico"
__ALLOCFOR_entry__ = 4
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:

ret
###################################

main:
    call __init__
    call entry
    ret

###################################
__method_Person_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_add___, %esp

movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
push 8(%ebp)
call itos
add $4, %esp
push %eax
push %ebx
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
movl __this__, %eax
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Person_print_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Person_print___, %esp

movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
push %ebx
call puts
add $4, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# 
pushl $0
pushl $4
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Person
mov $__STRING0__, %edx
mov %edx, 0(%eax)
# Loading local variable "me" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for me (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Person_add_
pushl $123
call __method_Person_add_
mov %eax, %ebx
add $4, %esp
mov %ebx, __this__
push %ebx
# Calling function __method_Person_print_
call __method_Person_print_
mov %eax, %ecx
pop %ebx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# me: 4
