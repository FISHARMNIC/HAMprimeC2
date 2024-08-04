
.1byte = .byte
######## Auto included libs #######

###################################
.data
.align 4

######## user data section ########
__STRING0__: .asciz "chicken"
.comm __LABEL0__, 16 #Allocation for array
arrGlobal: .4byte 0
__STRING1__: .asciz "%c\n"
__ALLOCFOR_entry__ = 0
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
mov $__LABEL0__, %eax
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $9, 8(%eax)
mov $__STRING0__, %edx
mov %edx, 12(%eax)
mov %eax, %ebx
mov %ebx, arrGlobal
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
mov arrGlobal, %eax
mov 12(%eax), %ebx
mov %ebx, %eax
mov 3(%eax), %ecx
push %ebx
push %ecx
# Calling function printf
push %ecx
pushl $__STRING1__
call printf
mov %eax, %esi
add $8, %esp
pop %ebx
pop %ecx

mov %ebp, %esp
pop %ebp
ret
