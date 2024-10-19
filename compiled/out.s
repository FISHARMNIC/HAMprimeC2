
.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
__PRINT_TYPE_INT__: .asciz "%i\n"
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"

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
.type	entry, @function
.4byte 8
__STRING0__: .asciz "abcdefg"
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

pushl $__STRING0__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "word" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for word (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function substr
pushl $5
pushl $2
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call substr
mov %eax, %ecx
add $12, %esp
push %ecx
call puts
add $4, %esp
lea -4(%ebp), %ecx
push %ecx
# Calling function strapp
pushl $104
push %ecx
call strapp
mov %eax, %esi
add $8, %esp
pop %ecx
push %esi
call puts
add $4, %esp
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# word: 4
