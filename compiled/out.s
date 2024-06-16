
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "bob"
.comm __LABEL0__, 5, 4
bob: .4byte 0
__STRING1__: .asciz "%i %i\n"
__ALLOCFOR_entry__ = 8
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
xor %eax, %eax
mov $5, %eax
add $10, %eax
mov %eax, %ebx
mov $__LABEL0__, %eax
mov %eax, %ecx # Local allocation address for Person
mov %bl, 0(%eax)
mov $__STRING0__, %edx
mov %edx, 1(%eax)
mov %ecx, bob
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
pushl $__STRING1__
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
