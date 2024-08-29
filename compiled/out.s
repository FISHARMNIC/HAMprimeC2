
.1byte = .byte
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"


.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
######## user data section ########
__ALLOCFOR___constructor_List_0___ = 0
__ALLOCFOR___method_List_push___ = 0
__ALLOCFOR___method_List_pop___ = 4
__ALLOCFOR___method_List_every___ = 4
__SIZEOF_List__ = 8
# format "List" includes:
#   - PROPERTY (p32) buffer
#   - PROPERTY (u32) length
#   - CNSTRCTR __constructor_List_0_ (0 parameters, variadic)
__STRING0__: .asciz "Printing: %i\n"
__ALLOCFOR_putint__ = 0
__STRING1__: .asciz "[%i,%i]\n"
__STRING2__: .asciz "%p\n"
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
pushl $0
mov $__SIZEOF_List__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
movl __this__, %edx
mov %edx, ___TEMPORARY_OWNER___
# requesting ownership for ___TEMPORARY_OWNER___ (set)
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
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
# Calling function malloc
pushl $4
call malloc
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
push %esi
push %ecx
# Calling function realloc
push %ecx
push %esi
call realloc
mov %eax, %edi
add $8, %esp
pop %ecx
pop %esi
pop %ebx
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
#Array set begin
mov 8(%ebp), %edx
mov %edx, (%esi, %ecx, 4)
#Set end
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
__method_List_pop_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_List_pop___, %esp
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
mov %ecx, 4(%eax)
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
mov (%eax, %ebx, 4), %esi
# Loading local variable "returnValue" @-4(%ebp)
mov %esi, -4(%ebp)
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
push %esi
push %ecx
# Calling function realloc
push %ecx
push %esi
call realloc
mov %eax, %edi
add $8, %esp
pop %ecx
pop %esi
pop %ebx
movl __this__, %eax
mov %edi, 0(%eax)
mov -4(%ebp), %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# returnValue: 4
__method_List_every_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_List_every___, %esp
# Loading local variable "i" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL3__:
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov -4(%ebp), %eax
movb $0, %cl
cmp %ebx, %eax
setl %cl
cmpb $1, %cl
jne __LABEL4__
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
push %ebx
push %ecx
# Calling function __not_a_function__
push %ecx
call *8(%ebp)
mov %eax, %esi
add $4, %esp
pop %ecx
pop %ebx
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL3__
__LABEL4__:
mov %ebp, %esp
pop %ebp
ret
# i: 4
putint:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_putint__, %esp
# Calling function printf
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ebx
add $8, %esp
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
# requesting ownership for myList (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_List_push_
pushl $123
call __method_List_push_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_List_push_
pushl $456
call __method_List_push_
mov %eax, %ebx
add $4, %esp
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
mov 0(%eax), %ecx
mov -4(%ebp), %edx
mov %edx, __this__
push %ebx
push %ecx
# Calling function __method_List_pop_
call __method_List_pop_
mov %eax, %esi
pop %ecx
pop %ebx
push %ebx
push %esi
push %ecx
# Calling function printf
push %esi
push %ecx
pushl $__STRING1__
call printf
mov %eax, %edi
add $12, %esp
pop %ecx
pop %esi
pop %ebx
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_List_push_
pushl $321
call __method_List_push_
mov %eax, %ebx
add $4, %esp
mov $putint, %ebx
mov -4(%ebp), %edx
mov %edx, __this__
push %ebx
# Calling function __method_List_every_
push %ebx
call __method_List_every_
mov %eax, %ecx
add $4, %esp
pop %ebx
movl $12, -4(%ebp)
# Calling function printf
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
pushl $__STRING2__
call printf
mov %eax, %ebx
add $8, %esp
mov $0, %eax
mov %ebp, %esp
pop %ebp
ret
mov %ebp, %esp
pop %ebp
ret
# myList: 4
