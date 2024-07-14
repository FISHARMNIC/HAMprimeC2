
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__ALLOCFOR_test__ = 0
gi: .4byte 1
.comm __LABEL0__, 12, 4
garr: .4byte 0
__STRING0__: .asciz "%i %i\n"
__ALLOCFOR_entry__ = 20
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
movl $3, 8(%eax)
mov %eax, %ebx
mov %ebx, garr
ret
###################################

main:
    call __init__
    call entry
    ret

###################################
test:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_test__, %esp
mov $123, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
mov $2, %edx
mov %edx, -4(%ebp)
movl $1, -16(%ebp)
movl $2, -12(%ebp)
movl $3, -8(%ebp)
mov %ebp, %eax
sub $16, %eax
mov %eax, %ebx
mov %ebx, -20(%ebp)
# Calling function test
call test
mov %eax, %ebx
#Set begin
mov -20(%ebp), %eax
push %eax
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $1, %esp
mov %ebx, (%eax)
#Set end
#Set begin
mov garr, %eax
push %eax
mov gi, %eax
shl $2, %eax
add (%esp), %eax
add $1, %esp
movl $456, (%eax)
#Set end
mov -20(%ebp), %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ebx
mov garr, %eax
movl gi, %edx
mov (%eax, %edx, 4), %ecx
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
# li: 4
# larr: 20
