
.1byte = .byte
######## Auto included libs #######

###################################
.data

######## user data section ########
__STRING0__: .asciz "%i"
__ALLOCFOR_put_integer__ = 0
__STRING1__: .asciz "%s"
__ALLOCFOR_put_string__ = 0
__STRING2__: .asciz "%c"
__ALLOCFOR_put_char__ = 0
__ALLOCFOR_hamPrintf__ = 9
__STRING3__: .asciz "Hello %s: %d"
__STRING4__: .asciz "World"
__ALLOCFOR_entry__ = 0
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
put_integer:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_put_integer__, %esp
# Calling function printf
mov 8(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ebx
add $8, %esp
mov %ebp, %esp
pop %ebp
ret
put_string:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_put_string__, %esp
# Calling function printf
mov 8(%ebp), %edx
push %edx
pushl $__STRING1__
call printf
mov %eax, %ebx
add $8, %esp
mov %ebp, %esp
pop %ebp
ret
put_char:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_put_char__, %esp
# Calling function printf
xor %edx, %edx
mov 8(%ebp), %dl
push %edx
pushl $__STRING2__
call printf
mov %eax, %ebx
add $8, %esp
mov %ebp, %esp
pop %ebp
ret
hamPrintf:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_hamPrintf__, %esp
mov $0, %edx
mov %edx, -4(%ebp)
mov $1, %edx
mov %edx, -8(%ebp)
__LABEL0__:
mov 8(%ebp), %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 1), %ebx
movb $0, %cl
cmp $0, %bl
setne %cl
cmpb $1, %cl
jne __LABEL1__
mov 8(%ebp), %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 1), %ebx
movb $0, %cl
cmp $37, %bl
sete %cl
cmpb $1, %cl
jne __LABEL2__
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov 8(%ebp), %eax
mov (%eax, %ebx, 1), %ecx
mov %cl, -9(%ebp)
mov -9(%ebp), %al
movb $0, %bl
cmp $115, %al
sete %bl
cmpb $1, %bl
jne __LABEL4__
mov -8(%ebp), %edx
mov %edx, %eax
add $2, %eax
mov (%ebp, %eax, 4), %ebx
push %ebx
# Calling function put_string
push %ebx
call put_string
mov %eax, %ecx
add $4, %esp
pop %ebx
jmp __LABEL5__
__LABEL4__:
mov -9(%ebp), %al
movb $0, %bl
cmp $100, %al
sete %bl
cmpb $1, %bl
jne __LABEL6__
mov -8(%ebp), %edx
mov %edx, %eax
add $2, %eax
mov (%ebp, %eax, 4), %ebx
push %ebx
# Calling function put_integer
push %ebx
call put_integer
mov %eax, %ecx
add $4, %esp
pop %ebx
jmp __LABEL5__
__LABEL6__:
jmp __LABEL5__
__LABEL7__:
__LABEL5__:
xor %eax, %eax
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ebx
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL3__
__LABEL2__:
mov 8(%ebp), %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 1), %ebx
push %ebx
# Calling function put_char
push %ebx
call put_char
mov %eax, %ecx
add $4, %esp
pop %ebx
jmp __LABEL3__
__LABEL8__:
__LABEL3__:
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
mov %ebp, %esp
pop %ebp
ret
# i: 4
# argnum: 8
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp
# Calling function hamPrintf
pushl $123
pushl $__STRING4__
pushl $__STRING3__
call hamPrintf
mov %eax, %ebx
add $12, %esp
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
