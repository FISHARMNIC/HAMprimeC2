
.1byte = .byte
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
######## user data section ########
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
mov $0, %ebx
# Loading local variable "arr" @-4(%ebp)
mov %ebx, -4(%ebp)
#Array set begin
mov -4(%ebp), %eax
movl $4, 40(%eax)
#Set end
mov $0, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# arr: 4
