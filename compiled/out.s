
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
__ALLOCFOR___method_Linked_add___ = 8
__SIZEOF_Linked__ = 8
# format "Linked" includes:
#   - PROPERTY (u32) current
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_Linked_0_ (0 parameters)
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
call __constructor_Linked_0_
mov %eax, %ebx
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

mov %ebp, %esp
pop %ebp
ret
