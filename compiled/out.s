
.1byte = .byte
######## Auto included libs #######

###################################
.data
.align 4

######## user data section ########
__STRING0__: .asciz "bob"
__STRING1__: .asciz "The student %s (id #%i) is %i years old\n"
__ALLOCFOR_entry__ = 28
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
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
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
movl $8, -12(%ebp) # Allocated in __ALLOC_FOR__, setting extra byte for size
lea -8(%ebp), %ebx # Local allocation address for Person
movl $15, -8(%ebp)
mov $__STRING0__, %edx
mov %edx, -4(%ebp)
movl $8, -24(%ebp) # Allocated in __ALLOC_FOR__, setting extra byte for size
lea -20(%ebp), %ecx # Local allocation address for Student
mov %ebx, -20(%ebp)
movl $123, -16(%ebp)
# Loading local variable "bob" @-28(%ebp)
mov %ecx, -28(%ebp)
movl -28(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov 4(%ebx), %edx
mov %edx, %ecx
movl -28(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %esi
movl -28(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %edi
mov 0(%edi), %edx
mov %edx, __TEMP32_0__
push %ebx
push %ecx
push %esi
push %edi
# Calling function printf
mov __TEMP32_0__, %edx
push %edx
push %esi
push %ecx
pushl $__STRING1__
call printf
mov %eax, __TEMP32_1__
add $16, %esp
pop %ebx
pop %ecx
pop %esi
pop %edi
mov $0, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# bob: 28
