
.macro .1byte v
.byte \v
.endm
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
.global ___TEMPORARY_OWNER___
.extern __disable_gc__
######## user data section ########
.4byte 4
__STRING0__: .asciz "bob"
.4byte 5
__STRING1__: .asciz "%i\n"
.4byte 4
__STRING2__: .asciz "abc"
.4byte 4
__STRING3__: .asciz "bac"
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
mov %eax, %ebx
# Loading local variable "jon" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for jon (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
push %ebx
pushl $__STRING0__
push -4(%ebp)
call strcmp
add $8, %esp
pop %ebx
xor %ebx, %ebx
cmp $0, %eax
setz %bl
push %ebx
# Calling function printf
push %ebx
pushl $__STRING1__
call printf
mov %eax, %ecx
add $8, %esp
pop %ebx
push %ebx
pushl $__STRING2__
pushl $__STRING3__
call strcmp
add $8, %esp
pop %ebx
xor %ebx, %ebx
cmp $0, %eax
setg %bl
push %ebx
# Calling function printf
push %ebx
pushl $__STRING1__
call printf
mov %eax, %ecx
add $8, %esp
pop %ebx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# jon: 4
