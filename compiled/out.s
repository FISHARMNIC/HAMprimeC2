
.1byte = .byte
######## Auto included libs #######
.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"
###################################
.data
.align 4

######## user data section ########
__ALLOCFOR_genArrs__ = 4
__STRING0__: .asciz "%i\n"
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
pushl $12
call __allocate_wsize__ #Allocation for array
add $4, %esp
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $3, 8(%eax)
mov %eax, %ebx
# Loading local variable "rarr" @-4(%ebp)
mov %ebx, -4(%ebp)
mov -4(%ebp), %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# rarr: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Calling function genArrs
call genArrs
mov %eax, %ebx
# Loading local variable "result" @-4(%ebp)
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
# Calling function dispose
mov -4(%ebp), %edx
push %edx
call dispose
mov %eax, %ebx
add $4, %esp
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# result: 4
