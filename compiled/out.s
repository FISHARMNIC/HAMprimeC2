
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "chicken"
.comm __LABEL0__, 16, 4
arrGlobal: .4byte 0
__STRING1__: .asciz "%i %i %i\n"
__ALLOCFOR_entry__ = 16
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
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
movl $4, -12(%ebp)
movl $3, -8(%ebp)
movl $1, -4(%ebp)
mov %ebp, %eax
sub $12, %eax
mov %eax, %ebx
mov %ebx, -16(%ebp)
xor %eax, %eax
mov -16(%ebp), %eax
add $8, %eax
mov %eax, %ebx
mov arrGlobal, %eax
mov 0(%eax), %ecx
mov %ebx, %eax
mov 0(%eax), %esi
mov arrGlobal, %eax
mov 4(%eax), %edi
mov -16(%ebp), %eax
mov (%eax, %ecx, 4), %edx
mov %edx, __TEMP32_0__
push %ebx
push %ecx
push %esi
push %edi
# Calling function printf
mov __TEMP32_0__, %edx
push %edx
push %edi
push %esi
pushl $__STRING1__
call printf
mov %eax, __TEMP32_1__
add $16, %esp
pop %ebx
pop %ecx
pop %esi
pop %edi
mov %ebp, %esp
pop %ebp
ret
# arr: 16
