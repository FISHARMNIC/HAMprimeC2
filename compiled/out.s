
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "%i %i\n"
__ALLOCFOR_entry__ = 8
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
add 34, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
xor %eax, %eax
mov -4(%ebp), %eax
add $4, %eax
mov %eax, %ebx
mov %ebx, -8(%ebp)
# Calling function printf
mov -4(%ebp), %edx
push %edx
mov -8(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ebx
add $12, %esp
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# jon: 4
# dad: 8
