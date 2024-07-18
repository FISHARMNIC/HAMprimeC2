
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
.comm __LABEL0__, 3, 4
d: .4byte 0
__STRING0__: .asciz "%i %i"
__ALLOCFOR_entry__ = 10
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
mov $__LABEL0__, %eax
movb $4, 0(%eax)
movb $5, 1(%eax)
movb $6, 2(%eax)
mov %eax, %ebx
mov %ebx, d
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
xor %edx, %edx
xor %edx, %edx
mov $123, %dl
mov %dl, -1(%ebp)
xor %edx, %edx
xor %edx, %edx
mov $0, %dx
mov %dx, -3(%ebp)
movb $1, -6(%ebp)
movb $2, -5(%ebp)
movb $3, -4(%ebp)
mov %ebp, %eax
sub $6, %eax
mov %eax, %ebx
mov %ebx, -10(%ebp)
mov -10(%ebp), %eax
xor %ebx, %ebx
mov 1(%eax), %bl
mov d, %eax
xor %ecx, %ecx
mov 1(%eax), %cl
push %ebx
push %ecx
# Calling function printf
push %ecx
push %ebx
pushl $__STRING0__
call printf
mov %eax, %esi
add $12, %esp
pop %ebx
pop %ecx
mov %ebp, %esp
pop %ebp
ret
# a: 1
# b: 3
# c: 10
