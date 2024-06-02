
.1byte = .byte

.data

######## user data section ########
__STRING0__: .asciz "bob"
__STRING1__: .asciz "%i%i"
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
add $0, %esp
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
xor %eax, %eax
mov $5, %eax
add $10, %eax
mov %eax, %ebx
sub $5, %esp
mov %esp, %ecx
mov %bl, 0(%esp)
mov $__STRING0__, %edx
mov %edx, 1(%esp)
push %ecx
xor %eax, %eax
mov $12, %eax
add $34, %eax
mov %eax, %ebx
push %ebx
xor %eax, %eax
mov 0(%esp), %al
add $4, %eax
mov %eax, %ebx
push %ebx
# Calling function printf
xor %edx, %edx
mov 4(%esp), %dl
push %edx
xor %edx, %edx
mov 0(%esp), %dl
push %edx
pushl $__STRING1__
call printf
mov %eax, %ebx
add $12, %esp
mov %ebp, %esp
pop %ebp
ret
