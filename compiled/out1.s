
/*
********HAM PRIME**********
Compiled with love on Mon Dec 09 2024 14:16:59 GMT-0700 (Mountain Standard Time)
**************************
*/

.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
.align 4

.extern __disable_gc__
.extern __rc_triggerSegfaultOnNullOwnership__
.extern __PRINT_TYPE_INT__
.extern __this__
.extern __xmm_sse_temp__
.extern ___TEMPORARY_OWNER___

######## user data section ########
__SIZEOF_iofile__ = 4
# format "iofile" includes:
#   - PROPERTY (p32) fptr
#   - CNSTRCTR __constructor_iofile_0_ (0 parameters)
#   - CNSTRCTR __constructor_iofile_1_ (1 parameters)
.type	entry, @function
.global entry
.4byte 9
__STRING0__: .asciz "test.txt"
.4byte 23
__STRING1__: .asciz "Rio is the best dog!\n"
.4byte 12
__STRING2__: .asciz "\nC\nHello "
.4byte 6
__STRING3__: .asciz " Bye!"
__ALLOCFOR_entry__ = 13
###################################
.text

#### compiler initation section ###
__init_for_out1__:
call __init_for_out0__
# auto-return OK for entry function
ret
.global __init_for_out1__
###################################

.global main
main:
call __init_for_out1__
call entry
ret

###################################
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing clobbers
# Calling function __constructor_iofile_1_
pushl $__STRING0__
call __constructor_iofile_1_
mov %eax, %ecx
add $4, %esp
# popping clobbers
# creating variable "myFile" of type "iofile:dynamic" stack?=true
# Loading local variable "myFile" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for myFile (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR myFile -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_iofile_shl_0__
# converting conststr to string (function call)
pushl $__STRING1__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_iofile_shl_0__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# optimized move from %ecx to __this__
mov %ecx, __this__
# pushing clobbers
push %ecx
# Calling function __operator_iofile_shl_1__
pushl $123
call __operator_iofile_shl_1__
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# optimized move from %esi to __this__
mov %esi, __this__
# pushing clobbers
push %esi
push %ecx
# Calling function __operator_iofile_shl_0__
# converting conststr to string (function call)
pushl $__STRING2__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_iofile_shl_0__
mov %eax, %edi
add $4, %esp
# popping clobbers
pop %ecx
pop %esi
# note, read STACK VAR myFile -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_iofile_shl_1__
pushl $456789
call __operator_iofile_shl_1__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# optimized move from %ecx to __this__
mov %ecx, __this__
# pushing clobbers
push %ecx
# Calling function __operator_iofile_shl_0__
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_iofile_shl_0__
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# note, read STACK VAR myFile -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_rewind_
call __method_iofile_rewind_
mov %eax, %ecx
# popping clobbers
# creating variable "output" of type "string:dynamic" stack?=true
# Loading local variable "output" @-8(%ebp) with "0"
# optimized move from 0 to -8(%ebp)
movl $0, -8(%ebp)
# creating variable "onum" of type "u32:borrowed" stack?=true
# Loading local variable "onum" @-12(%ebp) with "0"
# optimized move from 0 to -12(%ebp)
movl $0, -12(%ebp)
# creating variable "och" of type "u8:borrowed" stack?=true
# Loading local variable "och" @-13(%ebp) with "0"
# optimized move from 0 to -13(%ebp)
movb $0, -13(%ebp)
# note, read STACK VAR myFile -> -4(%ebp)
# note, read STACK VAR output -> -8(%ebp)
# note, read STACK VAR onum -> -12(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_iofile_shr_2__
# TODO optimize if variable just do movl
lea -8(%ebp), %edx # PASS AS REFERENCE
push %edx
call __operator_iofile_shr_2__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# optimized move from %ecx to __this__
mov %ecx, __this__
# pushing clobbers
push %ecx
# Calling function __operator_iofile_shr_3__
# TODO optimize if variable just do movl
lea -12(%ebp), %edx # PASS AS REFERENCE
push %edx
call __operator_iofile_shr_3__
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# note, read STACK VAR myFile -> -4(%ebp)
# note, read STACK VAR och -> -13(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __operator_iofile_shr_4__
xor %edx, %edx
# TODO optimize if variable just do movl
lea -13(%ebp), %edx # PASS AS REFERENCE
push %edx
call __operator_iofile_shr_4__
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR output -> -8(%ebp)
# pushing multi-line clobbers
push -8(%ebp)
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR onum -> -12(%ebp)
# pushing multi-line clobbers
push -12(%ebp)
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
# popping multi-line clobbers
# note, read STACK VAR och -> -13(%ebp)
# pushing multi-line clobbers
push -13(%ebp)
call putchar
movb $'\n', (%esp)
call putchar
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR myFile -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_getLine_
call __method_iofile_getLine_
mov %eax, %ecx
# popping clobbers
# pushing multi-line clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# note, read STACK VAR myFile -> -4(%ebp)
# optimized move from -4(%ebp) to __this__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_close_
call __method_iofile_close_
mov %eax, %ecx
# popping clobbers
# setting register "a" to "0"
mov $0, %eax
# auto-return OK for entry function
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
# myFile: 4
# output: 8
# onum: 12
# och: 13

