
.macro .1byte v
.byte \v
.endm
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"


.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
.global ___TEMPORARY_OWNER___
.extern __disable_gc__
######## user data section ########
__ALLOCFOR___constructor_Linked_0___ = 0
__ALLOCFOR___method_Linked_findLast___ = 4
__ALLOCFOR___method_Linked_find___ = 8
__ALLOCFOR___method_Linked_index___ = 4
__ALLOCFOR___method_Linked_add___ = 8
.4byte 7
__STRING0__: .asciz "Index "
.4byte 19
__STRING1__: .asciz " does not exist!\n"
__ALLOCFOR___method_Linked_remove___ = 4
__ALLOCFOR___method_Linked_replace___ = 4
.4byte 2
__STRING2__: .asciz "["
.4byte 3
__STRING3__: .asciz "->"
.4byte 2
__STRING4__: .asciz "]"
__ALLOCFOR___method_Linked_toString___ = 8
__SIZEOF_Linked__ = 8
# format "Linked" includes:
#   - PROPERTY (u32) current
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_Linked_0_ (1 parameters)
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
# requesting ownership for ___TEMPORARY_OWNER___ (set)
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
movl __this__, %eax
movl $0, 4(%eax)
movl __this__, %eax
call __rc_quick_check__

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
mov $0, %cl
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

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
mov $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL3__
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov $0, %cl
cmp $0, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL4__
mov $0, %eax
call __rc_quick_check__

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
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# reference: 4
# i: 8
__method_Linked_index_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_index___, %esp
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Linked_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Linked_find_
mov %eax, %ebx
add $4, %esp
# Loading local variable "ref" @-4(%ebp)
mov %ebx, -4(%ebp)
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# ref: 4
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
# requesting ownership for newAddr (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
movl -4(%ebp), %eax
mov -8(%ebp), %edx
mov %edx, 4(%eax)
# requesting ownership for -4(%ebp) (property)
lea 4(%eax), %eax
push %eax
push -8(%ebp)
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# end: 4
# newAddr: 8
__method_Linked_remove_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_remove___, %esp
mov 8(%ebp), %eax
mov $0, %bl
cmp $1, %eax
setl %bl
cmpb $1, %bl
jne __LABEL6__
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
# requesting ownership for __this__ (set)
lea __this__, %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL7__
__LABEL6__:
xor %eax, %eax
mov 8(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
movl __this__, %edx
mov %edx, __this__
push %ebx
# Calling function __method_Linked_find_
push %ebx
call __method_Linked_find_
mov %eax, %ecx
add $4, %esp
pop %ebx
# Loading local variable "previous" @-4(%ebp)
mov %ecx, -4(%ebp)
mov -4(%ebp), %eax
mov $0, %bl
cmp $0, %eax
sete %bl
cmpb $1, %bl
jne __LABEL9__
pushl $__STRING1__
push 8(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING0__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL10__
__LABEL9__:
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov $0, %cl
cmp $0, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL11__
movl -4(%ebp), %eax
movl $0, 4(%eax)
jmp __LABEL10__
__LABEL11__:
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov 4(%ebx), %edx
mov %edx, %ecx
movl -4(%ebp), %eax
mov %ecx, 4(%eax)
# requesting ownership for -4(%ebp) (property)
lea 4(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL10__
__LABEL12__:
__LABEL10__:
jmp __LABEL7__
__LABEL8__:
__LABEL7__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Linked_replace_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_replace___, %esp
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Linked_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Linked_find_
mov %eax, %ebx
add $4, %esp
# Loading local variable "reference" @-4(%ebp)
mov %ebx, -4(%ebp)
movl -4(%ebp), %eax
mov 12(%ebp), %edx
mov %edx, 0(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# reference: 4
__method_Linked_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_toString___, %esp
# Loading local variable "reference" @-4(%ebp)
movl __this__, %edx
mov %edx, -4(%ebp)
pushl $__STRING2__
call cptos
add $4, %esp
mov %eax, %ebx
# Loading local variable "build" @-8(%ebp)
mov %ebx, -8(%ebp)
# requesting ownership for build (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
__LABEL13__:
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov $0, %cl
cmp $0, %ebx
setne %cl
cmpb $1, %cl
jne __LABEL14__
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
pushl $__STRING3__
push %ebx
call itos
add $4, %esp
push %eax
push -8(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
# requesting ownership for build (set)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL13__
__LABEL14__:
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ebx
pushl $__STRING4__
push %ebx
call itos
add $4, %esp
push %eax
push -8(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
# requesting ownership for build (set)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov -8(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# reference: 4
# build: 8
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
# requesting ownership for myList (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
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
# Calling function __method_Linked_toString_
call __method_Linked_toString_
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_remove_
pushl $0
call __method_Linked_remove_
mov %eax, %ebx
add $4, %esp
# Loading into __this__ because function modified it 
movl __this__, %edx
mov %edx, -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_add_
pushl $5
call __method_Linked_add_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_replace_
pushl $4
pushl $2
call __method_Linked_replace_
mov %eax, %ebx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_toString_
call __method_Linked_toString_
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_remove_
pushl $1
call __method_Linked_remove_
mov %eax, %ebx
add $4, %esp
# Loading into __this__ because function modified it 
movl __this__, %edx
mov %edx, -4(%ebp)
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_add_
pushl $8
call __method_Linked_add_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_add_
pushl $16
call __method_Linked_add_
mov %eax, %ebx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_toString_
call __method_Linked_toString_
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __method_Linked_remove_
pushl $10
call __method_Linked_remove_
mov %eax, %ebx
add $4, %esp
# Loading into __this__ because function modified it 
movl __this__, %edx
mov %edx, -4(%ebp)
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# myList: 4
