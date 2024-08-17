
.1byte = .byte
######## Auto included libs #######

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
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
mov $3240099840, %ebx
# Loading local variable "bob" @-4(%ebp)
mov %ebx, -4(%ebp)

mov %ebp, %esp
pop %ebp
ret
# bob: 4
