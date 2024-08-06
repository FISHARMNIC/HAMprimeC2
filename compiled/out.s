
.1byte = .byte
######## Auto included libs #######
.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"
###################################
.data
.align 4
__this__: .4byte 0

######## user data section ########
__ALLOCFOR___constructor_List_0___ = 0
__ALLOCFOR___method_List_push___ = 0
__SIZEOF_List__ = 8
# format "List" includes:
#   - PROPERTY (p32) buffer
#   - PROPERTY (p32) length
#   - CNSTRCTR __constructor_List_0_ (0 parameters, variadic)
__STRING0__: .asciz "%i\n"
__ALLOCFOR_entry__ = 4
__TEMP32_0__: .4byte 0
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
__constructor_List_0_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___constructor_List_0___, %esp
mov $__SIZEOF_List__, %edx
push %edx
call __allocate__ #Allocate for THIS
add $4, %esp
mov %eax, __this__
movl __this__, %eax
movl $0, 0(%eax)
movl __this__, %eax
movl $0, 4(%eax)
movl __this__, %eax

mov %ebp, %esp
pop %ebp
ret
__method_List_push_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_List_push___, %esp
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
add $1, %eax
mov %eax, %ecx
pop %ebx
movl __this__, %eax
mov %ecx, 4(%eax)
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
movb $0, %cl
cmp $1, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL0__
# Calling function __allocate__
pushl $4
call __allocate__
mov %eax, %ebx
add $4, %esp
movl __this__, %eax
mov %ebx, 0(%eax)
jmp __LABEL1__
__LABEL0__:
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
mov $4, %ebx
mul %ebx
mov %eax, %ecx
pop %ebx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
push %ebx
push %ecx
push %esi
# Calling function realloc
push %ecx
push %esi
call realloc
mov %eax, %edi
add $8, %esp
pop %ebx
pop %ecx
pop %esi
movl __this__, %eax
mov %edi, 0(%eax)
jmp __LABEL1__
__LABEL2__:
__LABEL1__:
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
sub $1, %eax
mov %eax, %ecx
pop %ebx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
#Set begin
mov 8(%ebp), %edx
mov %edx, (%eax, %ecx, 4)
#Set end
movl __this__, %eax

mov %ebp, %esp
pop %ebp
ret
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
# Calling function __constructor_List_0_
call __constructor_List_0_
mov %eax, %ebx
# Loading local variable "myList" @-4(%ebp)
mov %ebx, -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_List_push_
pushl $1
call __method_List_push_
mov %eax, %ebx
add $4, %esp
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
mov 0(%eax), %ecx
push %ebx
push %ecx
# Calling function printf
push %ecx
pushl $__STRING0__
call printf
mov %eax, %esi
add $8, %esp
pop %ebx
pop %ecx

mov %ebp, %esp
pop %ebp
ret
# myList: 4
