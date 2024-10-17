
.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
__PRINT_TYPE_INT__: .asciz "%i\n"
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
.global __this__
.extern __disable_gc__
######## user data section ########
.type	entry, @function
.4byte 5
__STRING0__: .asciz "%i\n"
__ALLOCFOR_entry__ = 8
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $3, 8(%eax)
mov %eax, %ecx
# Loading local variable "arr" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
# Setting pointer 5 -> -4(%ebp)
mov -4(%ebp), %eax
mov $5, %edx
movl %edx, (%eax)


mov -4(%ebp), %eax
add $4, %eax
mov %eax, %ecx
# Setting pointer 6 -> %ecx
mov $6, %edx
movl %edx, (%ecx)


mov -4(%ebp), %eax
add $8, %eax
mov %eax, %ecx
# Setting pointer 7 -> %ecx
mov $7, %edx
movl %edx, (%ecx)


__LABEL0__:
mov -8(%ebp), %eax
mov $0, %cl
cmp $3, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
mov -8(%ebp), %eax
mov $4, %ebx
mul %ebx
mov %eax, %ecx
mov -4(%ebp), %eax
add %ecx, %eax
mov %eax, %esi
# dereferencing %esi
movl (%esi), %edi
push %esi
push %ecx
push %edi
# Calling function printf
push %edi
pushl $__STRING0__
call printf
mov %eax, __TEMP32_0__
add $8, %esp
pop %edi
pop %ecx
pop %esi
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
mov %ecx, -8(%ebp)
jmp __LABEL0__
__LABEL1__:
mov $0, %eax
push %eax
call __rc_free_all__
pop %eax

mov %ebp, %esp
pop %ebp
ret
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# arr: 4
# i: 8
