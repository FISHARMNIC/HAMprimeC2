
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
__ALLOCFOR_entry__ = 16
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
# Loading local variable "__LABEL2__" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
# Loading local variable "__LABEL3__" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
# forEach loop
mov -4(%ebp), %eax # load arr
mov -4(%eax), %edx # get entry reference
mov 8(%eax),  %edx # get size
mov %edx, -12(%ebp) # size to arr len holder
mov (%eax), %eax # load first element into A
mov %eax, %ecx
# Loading local variable "item" @-16(%ebp)
mov %ecx, -16(%ebp)
__LABEL0__:
# comparison for forEach loop
mov -8(%ebp), %eax 
cmp %eax, -12(%ebp)
jle __LABEL1__
#indexing array
mov -4(%ebp), %eax
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
mov %esi, -16(%ebp)
push -16(%ebp)
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
incw -8(%ebp)
jmp __LABEL0__
__LABEL1__: # LLLLLLL
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# arr: 4
# __LABEL2__: 8
# __LABEL3__: 12
# item: 16
