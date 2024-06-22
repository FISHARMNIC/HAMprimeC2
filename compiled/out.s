
.1byte = .byte
######## Auto included libs #######
.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"
###################################
.data

######## user data section ########
__ALLOCFOR_genArrs__ = 8
__STRING0__: .asciz "%i"
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
genArrs:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_genArrs__, %esp
mov $0, %edx
mov %edx, -4(%ebp)
pushl $12
call __allocate__
add $4, %esp
movl $0, 0(%eax)
movl $0, 4(%eax)
movl $0, 8(%eax)
mov %eax, %ebx
mov %ebx, -8(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
movb $0, %bl
cmp $3, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
mov -8(%ebp), %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ebx
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
mov -8(%ebp), %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# i: 4
# rarr: 8
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Calling function genArrs
call genArrs
mov %eax, %ebx
mov %ebx, -4(%ebp)
mov -4(%ebp), %eax
mov 4(%eax), %ebx
push %ebx
# Calling function printf
push %ebx
pushl $__STRING0__
call printf
mov %eax, %ecx
add $8, %esp
pop %ebx
mov %ebp, %esp
pop %ebp
ret
# result: 4
