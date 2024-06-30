
.1byte = .byte
######## Auto included libs #######
.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"
###################################
.data

######## user data section ########
__STRING0__: .asciz "hello from thread\n"
__ALLOCFOR_thread__ = 4
__STRING1__: .asciz "hello from main\n"
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
thread:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_thread__, %esp
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
movb $0, %bl
cmp $10, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
# Calling function write
pushl $18
pushl $__STRING0__
pushl $1
call write
mov %eax, %ebx
add $12, %esp
# Calling function sleep
pushl $1
call sleep
mov %eax, %ebx
add $4, %esp
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
# i: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
pushl $4
call __allocate__
add $4, %esp
movl $0, 0(%eax)
mov %eax, %ebx
mov %ebx, -4(%ebp)
# Calling function pthread_create
pushl $0
pushl $thread
pushl $0
mov -4(%ebp), %edx
push %edx
call pthread_create
mov %eax, %ebx
add $16, %esp
mov $0, %edx
mov %edx, -8(%ebp)
__LABEL2__:
mov -8(%ebp), %eax
movb $0, %bl
cmp $10, %eax
setl %bl
cmpb $1, %bl
jne __LABEL3__
# Calling function write
pushl $16
pushl $__STRING1__
pushl $1
call write
mov %eax, %ebx
add $12, %esp
# Calling function sleep
pushl $1
call sleep
mov %eax, %ebx
add $4, %esp
xor %eax, %eax
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -8(%ebp)
jmp __LABEL2__
__LABEL3__:
# Calling function pthread_exit
pushl $0
call pthread_exit
mov %eax, %ebx
add $4, %esp
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# a: 4
# i: 8
