
.1byte = .byte

.data

######## user data section ########
__ALLOCFOR_entry__ = 1
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
xor %eax, %eax
mov $12, %eax
add $34, %eax
mov %eax, %ebx
mov %bl, -1(%ebp)
mov %ebp, %esp
pop %ebp
ret
