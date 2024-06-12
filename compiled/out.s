
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "Argument %i: %s\n"
__ALLOCFOR_myVariadic__ = 4
__STRING1__: .asciz "hi"
__STRING2__: .asciz "bye"
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
myVariadic:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_myVariadic__, %esp
mov $1, %edx
mov %edx, -4(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
mov 8(%ebp), %edx
movb $0, %bl
cmp %edx, %eax
setle %bl
cmpb $1, %bl
jne __LABEL1__
mov -4(%ebp), %edx
mov %edx, %eax
add $2, %eax
mov (%ebp, %eax, 4), %ebx
push %ebx
# Calling function printf
mov %ebx, %edx
push %edx
mov -4(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ecx
add $12, %esp
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
# i: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Calling function myVariadic
pushl $__STRING2__
pushl $__STRING1__
pushl $2
call myVariadic
mov %eax, %ebx
add $12, %esp
mov %ebp, %esp
pop %ebp
ret
