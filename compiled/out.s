
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
__ALLOCFOR___constructor_Linked_0___ = 0
__ALLOCFOR___method_Linked_findLast___ = 4
__ALLOCFOR___method_Linked_find___ = 8
__ALLOCFOR___method_Linked_add___ = 8
__SIZEOF_Linked__ = 8
# format "Linked" includes:
#   - PROPERTY (u32) current
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_Linked_0_ (1 parameters)
.4byte 11
__STRING0__: .asciz "%i %i %i\n"
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
__constructor_Linked_0_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___constructor_Linked_0___, %esp
pushl $0
mov $__SIZEOF_Linked__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
movl __this__, %edx
mov %edx, ___TEMPORARY_OWNER___
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
movl __this__, %eax
movl $0, 4(%eax)
movl __this__, %eax

mov %ebp, %esp
pop %ebp
ret
__method_Linked_findLast_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_Linked_findLast___, %esp
# Loading local variable "reference" @-4(%ebp)
movl __this__, %edx
mov %edx, -4(%ebp)
__LABEL0__:
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
movb $0, %cl
cmp $0, %ebx
setne %cl
cmpb $1, %cl
jne __LABEL1__
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
mov -4(%ebp), %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# reference: 4
__method_Linked_find_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_Linked_find___, %esp
# Loading local variable "reference" @-4(%ebp)
movl __this__, %edx
mov %edx, -4(%ebp)
# Loading local variable "i" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
__LABEL2__:
mov -8(%ebp), %eax
mov 8(%ebp), %edx
movb $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL3__
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
movb $0, %cl
cmp $0, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL4__
mov $0, %eax

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL5__
__LABEL4__:
__LABEL5__:
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov %ebx, -4(%ebp)
xor %eax, %eax
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -8(%ebp)
jmp __LABEL2__
__LABEL3__:
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# reference: 4
# i: 8
__method_Linked_add_:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR___method_Linked_add___, %esp
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Linked_findLast_
call __method_Linked_findLast_
mov %eax, %ebx
# Loading local variable "end" @-4(%ebp)
mov %ebx, -4(%ebp)
# Calling function __constructor_Linked_0_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_Linked_0_
mov %eax, %ebx
add $4, %esp
# Loading local variable "newAddr" @-8(%ebp)
mov %ebx, -8(%ebp)
movl -4(%ebp), %eax
mov -8(%ebp), %edx
mov %edx, 4(%eax)

mov %ebp, %esp
pop %ebp
ret
# end: 4
# newAddr: 8
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
# Calling function __constructor_Linked_0_
pushl $1
call __constructor_Linked_0_
mov %eax, %ebx
add $4, %esp
# Loading local variable "myList" @-4(%ebp)
mov %ebx, -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_add_
pushl $2
call __method_Linked_add_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_add_
pushl $3
call __method_Linked_add_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_find_
pushl $0
call __method_Linked_find_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
push %ebx
# Calling function __method_Linked_find_
pushl $1
call __method_Linked_find_
mov %eax, %ecx
add $4, %esp
pop %ebx
mov -4(%ebp), %edx
mov %edx, __this__
push %ebx
push %ecx
# Calling function __method_Linked_find_
pushl $2
call __method_Linked_find_
mov %eax, %esi
add $4, %esp
pop %ecx
pop %ebx
push %ebx
push %esi
push %ecx
# Calling function printf
push %esi
push %ecx
push %ebx
pushl $__STRING0__
call printf
mov %eax, %edi
add $16, %esp
pop %ecx
pop %esi
pop %ebx
mov $0, %eax

mov %ebp, %esp
pop %ebp
ret

mov %ebp, %esp
pop %ebp
ret
# myList: 4
