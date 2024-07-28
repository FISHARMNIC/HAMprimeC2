
.1byte = .byte
######## Auto included libs #######

###################################
.data
.align 4

######## user data section ########
__ALLOCFOR_render__ = 0
__ALLOCFOR_entry__ = 0
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
render:
push %ebp
mov %esp, %ebp
pusha
sub $__ALLOCFOR_render__, %esp
# Calling function gfx_rect
pushl $30
pushl $30
pushl $20
pushl $20
call gfx_rect
mov %eax, %ebx
add $16, %esp
popa
mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
mov $render, %ebx
push %ebx
# Calling function gfx_begin
push %ebx
pushl $100
pushl $100
call gfx_begin
mov %eax, %ecx
add $12, %esp
pop %ebx

mov %ebp, %esp
pop %ebp
ret
