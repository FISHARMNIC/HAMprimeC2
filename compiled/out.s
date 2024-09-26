
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
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
__ALLOCFOR___constructor_List_0___ = 0
__ALLOCFOR___constructor_List_1___ = 4
__ALLOCFOR___method_List_push___ = 0
__ALLOCFOR___method_List_pop___ = 4
__ALLOCFOR___method_List_every___ = 4
.4byte 2
__STRING0__: .asciz "["
.4byte 2
__STRING1__: .asciz ","
.4byte 2
__STRING2__: .asciz "]"
__ALLOCFOR___method_List_toString___ = 8
__SIZEOF_List__ = 8
# format "List" includes:
#   - PROPERTY (p32) buffer
#   - PROPERTY (u32) length
#   - CNSTRCTR __constructor_List_0_ (0 parameters)
#   - CNSTRCTR __constructor_List_1_ (1 parameters, variadic)
.4byte 15
__STRING3__: .asciz "Printing: %i\n"
__ALLOCFOR_putint__ = 0
.4byte 10
__STRING4__: .asciz "[%i,%i]\n"
__ALLOCFOR_entry__ = 8
__TEMP8_0__: .1byte 0
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
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_List_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_List_1___, %esp
pushl $0
mov $__SIZEOF_List__, %edx
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
# Asked for 8(%ebp) allocations of "u32"
mov $4, %edx
mov 8(%ebp), %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %ebx
movl __this__, %eax
mov %ebx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 4(%eax)
# Loading local variable "i" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, %eax
add $2, %eax
mov (%ebp, %eax, 4), %ecx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
#Array set begin
# array load trash awful. Fix this bad optimize
push %esi
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %ecx, (%eax)
#Set end
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
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
mov $0, %cl
cmp $1, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL2__
push %ebx
pushl $0
pushl $4
call __rc_allocate__
add $8, %esp
pop %ebx
mov %eax, %ebx
movl __this__, %eax
mov %ebx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL3__
__LABEL2__:
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
# Asked for %ebx allocations of "u32"
mov $4, %edx
mov %ebx, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %ecx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
# copying buffer
pushl $4
push %esi
push %ecx
call __copydata__
add $12, %esp
mov %eax, %edi
movl __this__, %eax
mov %edi, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL3__
__LABEL4__:
__LABEL3__:
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
mov 4(%eax), %edx
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
# Loading local variable "retValue" @-4(%ebp)
mov %esi, -4(%ebp)
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
# Asked for %ebx allocations of "u32"
mov $4, %edx
mov %ebx, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %ecx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
# copying buffer
pushl $4
push %esi
push %ecx
call __copydata__
add $12, %esp
mov %eax, %edi
movl __this__, %eax
mov %edi, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# retValue: 4
__method_List_every_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_List_every___, %esp
# Loading local variable "i" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL5__:
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
mov -4(%ebp), %eax
mov $0, %cl
cmp %ebx, %eax
setl %cl
cmpb $1, %cl
jne __LABEL6__
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
jmp __LABEL5__
__LABEL6__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
__method_List_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_List_toString___, %esp
pushl $__STRING0__
call cptos
add $4, %esp
mov %eax, %ebx
# Loading local variable "build" @-4(%ebp)
mov %ebx, -4(%ebp)
# requesting ownership for build (create)
lea -4(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
__LABEL7__:
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
sub $1, %eax
mov %eax, %ecx
pop %ebx
mov -8(%ebp), %eax
movb $0, __TEMP8_0__
cmp %ecx, %eax
setl __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL8__
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
pushl $__STRING1__
push %ecx
call itos
add $4, %esp
push %eax
push -4(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
# requesting ownership for build (set)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
xor %eax, %eax
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -8(%ebp)
jmp __LABEL7__
__LABEL8__:
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
pushl $__STRING2__
push %ecx
call itos
add $4, %esp
push %eax
push -4(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %esi
# requesting ownership for build (set)
lea -4(%ebp), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# build: 4
# i: 8
putint:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_putint__, %esp
# Calling function printf
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
pushl $__STRING3__
call printf
mov %eax, %ebx
add $8, %esp
call __rc_quick_check__

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
pushl $__STRING4__
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
lea putint, %ebx
mov -4(%ebp), %edx
mov %edx, __this__
push %ebx
# Calling function __method_List_every_
push %ebx
call __method_List_every_
mov %eax, %ecx
add $4, %esp
pop %ebx
# Calling function __constructor_List_1_
pushl $3
pushl $2
pushl $1
pushl $3
call __constructor_List_1_
mov %eax, %ebx
add $16, %esp
# Loading local variable "secondList" @-8(%ebp)
mov %ebx, -8(%ebp)
# requesting ownership for secondList (create)
lea -8(%ebp), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov -8(%ebp), %edx
mov %edx, __this__
# Calling function __method_List_toString_
call __method_List_toString_
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
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
# secondList: 8
