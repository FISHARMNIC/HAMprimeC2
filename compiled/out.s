
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "chicken"
.comm __LABEL0__, 16, 4
arrGlobal: .4byte 0
__STRING1__: .asciz "blah"
someString: .4byte 0
__STRING2__: .asciz "%c %c\n"
__STRING3__: .asciz "abcdefgh"
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
mov $__STRING1__, %edx
mov %edx, someString
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
mov $__STRING3__, %eax
mov 7(%eax), %bl
mov arrGlobal, %eax
mov 12(%eax), %ecx
mov %ecx, %eax
mov 16(%eax), %esi
push %ebx
push %ecx
push %esi
# Calling function printf
push %esi
push %ebx
pushl $__STRING2__
call printf
mov %eax, %edi
add $12, %esp
pop %ebx
pop %ecx
pop %esi
mov %ebp, %esp
pop %ebp
ret
