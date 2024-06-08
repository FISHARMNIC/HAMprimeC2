
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__ALLOCFOR_factorial__ = 0
__STRING0__: .asciz "%i\n"
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
factorial:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_factorial__, %esp
mov 8(%ebp), %eax
movb $0, %bl
cmp $1, %eax
setge %bl
cmpb $1, %bl
jne __LABEL0__
xor %eax, %eax
mov 8(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
push %ebx
# Calling function factorial
mov %ebx, %edx
push %edx
call factorial
mov %eax, %ecx
add $4, %esp
pop %ebx
push %ebx
push %ecx
xor %eax, %eax
mov 8(%ebp), %eax
mov %ecx, %ebx
mul %ebx
mov %eax, %esi
pop %ebx
pop %ecx
mov %esi, %eax
mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
mov $1, %eax
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
# Calling function factorial
pushl $5
call factorial
mov %eax, %ebx
add $4, %esp
push %ebx
# Calling function printf
mov %ebx, %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ecx
add $8, %esp
pop %ebx
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
