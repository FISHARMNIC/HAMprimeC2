
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "%i %i\n"
__ALLOCFOR_recurse__ = 0
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
recurse:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_recurse__, %esp
# Calling function printf
xor %edx, %edx
mov 12(%ebp), %dl
push %edx
mov 8(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ebx
add $12, %esp
mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Calling function recurse
pushl $111
pushl $123
call recurse
mov %eax, %ebx
add $8, %esp
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
movb $0, %bl
cmp $10, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# x: 4
