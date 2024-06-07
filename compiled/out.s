
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__ALLOCFOR_getNum__ = 0
__STRING0__: .asciz "%i\n"
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
getNum:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_getNum__, %esp
mov 8(%ebp), %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
mov $0, %edx
mov %edx, -4(%ebp)
mov $9, %edx
mov %edx, -8(%ebp)
__LABEL0__:
# Calling function getNum
pushl $3
call getNum
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %eax
mov %ebx, %edx
movb $0, %cl
cmp %edx, %eax
setl %cl
cmpb $1, %cl
jne __LABEL1__
xor %eax, %eax
mov -4(%ebp), %eax
mov -4(%ebp), %ebx
mul %ebx
mov %eax, %ebx
push %ebx
# Calling function printf
mov %ebx, %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ecx
add $8, %esp
pop %ebx
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
mov %ebp, %esp
pop %ebp
ret
# x: 4
# y: 8
