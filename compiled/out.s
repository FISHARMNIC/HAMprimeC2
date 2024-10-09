
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"

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
final: .4byte 1000
.4byte 13
__STRING0__: .asciz "result: %i\n"
__ALLOCFOR_entry__ = 8
__TEMP8_0__: .1byte 0
__TEMP8_1__: .1byte 0
__TEMP8_2__: .1byte 0
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

# Loading local variable "sum" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
# Loading local variable "i" @-8(%ebp)
mov $0, %edx
mov %edx, -8(%ebp)
__LABEL0__:
mov -8(%ebp), %eax
mov final, %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
cmpb $1, %cl
jne __LABEL1__
mov -8(%ebp), %eax
mov $3, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
mov -8(%ebp), %eax
mov $5, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %esi
movb $0, __TEMP8_1__
cmp $0, %esi
sete __TEMP8_1__
# OR comparison
movb $0, __TEMP8_2__
cmpb $1, __TEMP8_0__
sete __TEMP8_2__
je __LABEL2__
cmpb $1, __TEMP8_1__
sete __TEMP8_2__
__LABEL2__:
cmpb $1, __TEMP8_2__
jne __LABEL3__
mov -4(%ebp), %eax
add -8(%ebp), %eax
mov %eax, %ecx
mov %ecx, -4(%ebp)
jmp __LABEL4__
__LABEL3__:
__LABEL4__:
mov -8(%ebp), %eax
add $1, %eax
mov %eax, %ecx
mov %ecx, -8(%ebp)
jmp __LABEL0__
__LABEL1__:
# Calling function printf
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
pushl $__STRING0__
call printf
mov %eax, %ecx
add $8, %esp
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# sum: 4
# i: 8
