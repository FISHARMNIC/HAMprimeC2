
/*
********HAM PRIME**********
Compiled with love on Wed Oct 23 2024 16:52:03 GMT-0600 (Mountain Daylight Time)
**************************
*/

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
.type	modify, @function
__ALLOCFOR_modify__ = 0
.type	entry, @function
__ALLOCFOR_entry__ = 16
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
modify:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_modify__, %esp

#indexing array
mov 8(%ebp), %eax
mov 12(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
#Array set begin
mov 20(%ebp), %edx
# array load trash awful. Fix this bad optimize
push %ecx
mov 16(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edx, (%eax)
#Set end
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
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
push %ecx
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
pop %ecx
movl $4, 0(%eax)
movl $5, 4(%eax)
movl $6, 8(%eax)
mov %eax, %esi
push %esi
push %ecx
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
pop %ecx
pop %esi
movl $7, 0(%eax)
movl $8, 4(%eax)
movl $9, 8(%eax)
mov %eax, %edi
push %esi
push %ecx
push %edi
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
pop %edi
pop %ecx
pop %esi
# requesting ownership (setting array index on init)
lea 0(%eax), %edx
push %edx
pushl %ecx
call __rc_requestOwnership__
add $8, %esp
# requesting ownership (setting array index on init)
lea 4(%eax), %edx
push %edx
pushl %esi
call __rc_requestOwnership__
add $8, %esp
# requesting ownership (setting array index on init)
lea 8(%eax), %edx
push %edx
pushl %edi
call __rc_requestOwnership__
add $8, %esp
mov %eax, __TEMP32_0__
# Loading local variable "arr" @-4(%ebp)
movl __TEMP32_0__, %edx
mov %edx, -4(%ebp)
# requesting ownership for arr (create)
lea -4(%ebp), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
movl $3, 0(%eax)
movl $2, 4(%eax)
movl $1, 8(%eax)
mov %eax, %ecx
#Array set begin
mov -4(%ebp), %eax
mov %ecx, 8(%eax)
# requesting ownership for array index
lea 8(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
#indexing array
mov -4(%ebp), %eax
mov 0(%eax), %ecx
#Array set begin
movl $7, 8(%ecx)
#Set end
#indexing array
mov -4(%ebp), %eax
mov 4(%eax), %ecx
#Array set begin
movl $7, 4(%ecx)
#Set end
# Calling function modify
pushl $7
pushl $1
pushl $2
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call modify
mov %eax, %ecx
add $16, %esp
# Loading local variable "__LABEL2__" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
# Loading local variable "__LABEL3__" @-12(%ebp)
mov $0, %edx
mov %edx, -12(%ebp)
# forEach loop
mov -4(%ebp), %eax # load arr
mov -4(%eax), %edx # get entry reference
mov 8(%edx),  %edx # get size
shr $2, %edx # divide by 4 (bytes to u32 or u16)
mov %edx, -12(%ebp) # size to arr len holder
mov (%eax), %eax # load first element into A
mov %eax, %ecx
# Loading local variable "sub" @-16(%ebp)
mov %ecx, -16(%ebp)
# requesting ownership for sub (create)
lea -16(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
__LABEL0__:
# comparison for forEach loop
mov -8(%ebp), %eax 
cmp -12(%ebp), %eax
jge __LABEL1__ # exit if finished
#indexing array
mov -4(%ebp), %eax
mov -8(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
mov %esi, -16(%ebp)
# printing array
mov -16(%ebp), %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_arr32
add $8, %esp
incw -8(%ebp)
jmp __LABEL0__
__LABEL1__:
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# arr: 4
# __LABEL2__: 8
# __LABEL3__: 12
# sub: 16
