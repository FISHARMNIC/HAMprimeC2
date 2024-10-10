
.section .note.GNU-stack,"",@progbits
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
.global __this__
.extern __disable_gc__
######## user data section ########
gi: .4byte 1
.comm __LABEL0__, 12 #Allocation for array
garr: .4byte 0
__ALLOCFOR_test__ = 0
__ALLOCFOR_getgi__ = 0
.4byte 11
__STRING0__: .asciz "%i %i %i\n"
__ALLOCFOR_entry__ = 8
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
mov $__LABEL0__, %eax
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $3, 8(%eax)
mov %eax, %ecx
mov %ecx, garr
ret
###################################

main:
    call __init__
    call entry
    ret

###################################
test:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_test__, %esp

mov $123, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
getgi:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_getgi__, %esp

mov gi, %eax
add 8(%ebp), %eax
sub 12(%ebp), %eax
mov %eax, %ecx
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Loading local variable "li" @-4(%ebp)
mov $2, %edx
mov %edx, -4(%ebp)
# Allocation for array
pushl $0
pushl $12
call __rc_allocate__
add $8, %esp
movl $1, 0(%eax)
movl $2, 4(%eax)
movl $3, 8(%eax)
mov %eax, %ecx
# Loading local variable "larr" @-8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for larr (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function test
call test
mov %eax, %ecx
#Array set begin
mov -8(%ebp), %eax
# array load trash awful. Fix this bad optimize
push %eax
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %ecx, (%eax)
#Set end
mov gi, %eax
add $1, %eax
mov %eax, %ecx
mov %ecx, gi
# Calling function getgi
pushl $4
pushl $3
call getgi
mov %eax, %ecx
add $8, %esp
#Array set begin
mov garr, %eax
movl $456, (%eax, %ecx, 4) # mhm
#Set end
# Calling function getgi
pushl $1
pushl $0
call getgi
mov %eax, %ecx
add $8, %esp
#indexing array
mov garr, %eax
mov (%eax, %ecx, 4), %esi
mov %esi, %eax
add $333, %eax
mov %eax, %edi
#Array set begin
mov garr, %eax
mov %edi, 8(%eax)
#Set end
mov gi, %eax
sub $1, %eax
mov %eax, %ecx
mov %ecx, gi
mov garr, %eax
add $8, %eax
mov %eax, %ecx
#indexing array
mov -8(%ebp), %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
#indexing array
mov garr, %eax
movl gi, %edx
mov (%eax, %edx, 4), %edi
#indexing array
mov %ecx, %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_0__
push %esi
push %ecx
push %edi
# Calling function printf
# TODO optimize if variable just do movl
mov __TEMP32_0__, %edx
push %edx
push %edi
push %esi
pushl $__STRING0__
call printf
mov %eax, __TEMP32_1__
add $16, %esp
pop %edi
pop %ecx
pop %esi
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# li: 4
# larr: 8
