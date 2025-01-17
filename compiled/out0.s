
/*
********HAM PRIME**********
Compiled with love on Mon Dec 09 2024 13:55:11 GMT-0700 (Mountain Standard Time)
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
.type	__constructor_iofile_0_, @function
.global __constructor_iofile_0_
__ALLOCFOR___constructor_iofile_0___ = 0
.type	__constructor_iofile_1_, @function
.global __constructor_iofile_1_
.4byte 4
__STRING0__: .asciz "wb+"
__ALLOCFOR___constructor_iofile_1___ = 0
.type	__method_iofile_open_, @function
.global __method_iofile_open_
__ALLOCFOR___method_iofile_open___ = 0
.type	__method_iofile_openMode_, @function
.global __method_iofile_openMode_
__ALLOCFOR___method_iofile_openMode___ = 0
.type	__method_iofile_isOpen_, @function
.global __method_iofile_isOpen_
__ALLOCFOR___method_iofile_isOpen___ = 0
.type	__method_iofile_close_, @function
.global __method_iofile_close_
__ALLOCFOR___method_iofile_close___ = 0
.type	__method_iofile_rewind_, @function
.global __method_iofile_rewind_
__ALLOCFOR___method_iofile_rewind___ = 0
.type	__method_iofile_seekg_, @function
.global __method_iofile_seekg_
__ALLOCFOR___method_iofile_seekg___ = 0
.type	__method_iofile_write_, @function
.global __method_iofile_write_
__ALLOCFOR___method_iofile_write___ = 0
.type	__method_iofile_getTo_, @function
.global __method_iofile_getTo_
.4byte 1
__STRING1__: .asciz ""
__ALLOCFOR___method_iofile_getTo___ = 5
.type	__method_iofile_getLine_, @function
.global __method_iofile_getLine_
__ALLOCFOR___method_iofile_getLine___ = 0
.type	__operator_iofile_shl_0__, @function
.global __operator_iofile_shl_0__
__ALLOCFOR___operator_iofile_shl_0____ = 0
.type	__operator_iofile_shl_1__, @function
.global __operator_iofile_shl_1__
__ALLOCFOR___operator_iofile_shl_1____ = 0
.type	__operator_iofile_shr_2__, @function
.global __operator_iofile_shr_2__
__ALLOCFOR___operator_iofile_shr_2____ = 0
.type	__operator_iofile_shr_3__, @function
.global __operator_iofile_shr_3__
__ALLOCFOR___operator_iofile_shr_3____ = 0
.type	__operator_iofile_shr_4__, @function
.global __operator_iofile_shr_4__
__ALLOCFOR___operator_iofile_shr_4____ = 0
__SIZEOF_iofile__ = 4
# format "iofile" includes:
#   - PROPERTY (p32) fptr
#   - CNSTRCTR __constructor_iofile_0_ (0 parameters)
#   - CNSTRCTR __constructor_iofile_1_ (1 parameters)
__TEMP8_0__: .1byte 0
__TEMP8_1__: .1byte 0
###################################
.text

#### compiler initation section ###
__init_for_out0__:


ret
.global __init_for_out0__
###################################

# No main function

###################################
__constructor_iofile_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_iofile_0___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_iofile__"
mov $__SIZEOF_iofile__, %edx
push %edx
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set). 
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0 to 0(%eax)
movl $0, 0(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_iofile_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_iofile_1___, %esp # total stack allocation

# pushing clobbers
# Allocate for THIS
pushl $0
# setting register "d" to "$__SIZEOF_iofile__"
mov $__SIZEOF_iofile__, %edx
push %edx
call __rc_allocate__
add $8, %esp
# popping clobbers
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set). 
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# note, read PARAM name -> 8(%ebp)
# pushing clobbers
# Calling function fopen
pushl $__STRING0__
# converting conststr to string (function call)
pushl 8(%ebp)
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call fopen
mov %eax, %ecx
add $8, %esp
# popping clobbers
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_open_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_open___, %esp # total stack allocation

# note, read PARAM name -> 8(%ebp)
# pushing clobbers
# Calling function fopen
pushl $__STRING0__
# converting conststr to string (function call)
pushl 8(%ebp)
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call fopen
mov %eax, %ecx
add $8, %esp
# popping clobbers
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_openMode_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_openMode___, %esp # total stack allocation

# note, read PARAM name -> 8(%ebp)
# note, read PARAM mode -> 12(%ebp)
# pushing clobbers
# Calling function fopen
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# converting conststr to string (function call)
pushl 8(%ebp)
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call fopen
mov %eax, %ecx
add $8, %esp
# popping clobbers
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from %ecx to 0(%eax)
mov %ecx, 0(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_isOpen_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_isOpen___, %esp # total stack allocation

# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
setne __TEMP8_0__
# setting register "a" to "__TEMP8_0__"
movl __TEMP8_0__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_close_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_close___, %esp # total stack allocation

# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# pushing clobbers
push %ecx
# Calling function fclose
push %ecx
call fclose
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_rewind_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_rewind___, %esp # total stack allocation

# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# pushing clobbers
push %ecx
# Calling function rewind
push %ecx
call rewind
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_seekg_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_seekg___, %esp # total stack allocation

# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# note, read PARAM address -> 8(%ebp)
# pushing clobbers
push %ecx
# Calling function fseek
pushl $0
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
push %ecx
call fseek
mov %eax, %esi
add $12, %esp
# popping clobbers
pop %ecx
# setting register "a" to "%esi"
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_write_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_write___, %esp # total stack allocation

# note, read PARAM buffer -> 8(%ebp)
# note, read PARAM buffer -> 8(%ebp)
# pushing clobbers
# Calling function strlen
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call strlen
mov %eax, %ecx
add $4, %esp
# popping clobbers
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %esi
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %esi
# pushing clobbers
push %esi
push %ecx
# Calling function fwrite
push %esi
push %ecx
pushl $1
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call fwrite
mov %eax, %edi
add $16, %esp
# popping clobbers
pop %ecx
pop %esi
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_iofile_getTo_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_getTo___, %esp # total stack allocation

# creating variable "outString" of type "conststr:borrowed" stack?=true
pushl $__STRING1__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "outString" @-4(%ebp) with "%ecx"
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for outString (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# pushing clobbers
push %ecx
# Calling function fgetc
push %ecx
call fgetc
mov %al, __TEMP8_0__
add $4, %esp
# popping clobbers
pop %ecx
# creating variable "curChar" of type "u8:borrowed" stack?=true
# Loading local variable "curChar" @-5(%ebp) with "__TEMP8_0__"
# optimized move from __TEMP8_0__ to -5(%ebp)
xor %edx, %edx
# setting register "d" to "__TEMP8_0__"
xor %edx, %edx
movb __TEMP8_0__, %dl
mov %dl, -5(%ebp)
__LABEL0__:
# note, read STACK VAR curChar -> -5(%ebp)
# note, read PARAM ch -> 8(%ebp)
mov -5(%ebp), %al
mov 8(%ebp), %dl
mov $0, %cl
cmp %dl, %al
setne %cl
# note, read STACK VAR curChar -> -5(%ebp)
mov -5(%ebp), %al
movb $0, __TEMP8_0__
cmp $-1, %al
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %cl
jne __LABEL2__
cmpb $1, __TEMP8_0__
sete __TEMP8_1__
__LABEL2__:
# comparison for WHILE loop
cmpb $1, __TEMP8_1__
jne __LABEL1__
# note, read STACK VAR outString -> -4(%ebp)
# note, read STACK VAR curChar -> -5(%ebp)
pushw __disable_gc__; movw $1, __disable_gc__
push -5(%ebp)
call ctos
add $4, %esp
push %eax
push -4(%ebp)
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
popw __disable_gc__
# SETTING outString <- %ecx
# requesting ownership for outString (set). 
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "fptr" in "__this__"
movl __this__, %eax
# optimized move from 0(%eax) to %ecx
# setting register "d" to "0(%eax)"
mov 0(%eax), %edx
mov %edx, %ecx
# pushing clobbers
push %ecx
# Calling function fgetc
push %ecx
call fgetc
mov %al, __TEMP8_0__
add $4, %esp
# popping clobbers
pop %ecx
# SETTING curChar <- __TEMP8_0__
# optimized move from __TEMP8_0__ to -5(%ebp)
xor %edx, %edx
# setting register "d" to "__TEMP8_0__"
xor %edx, %edx
movb __TEMP8_0__, %dl
mov %dl, -5(%ebp)
jmp __LABEL0__
__LABEL1__:
# note, read STACK VAR outString -> -4(%ebp)
# optimized move from -4(%ebp) to __gc_dontClear__
# setting register "d" to "-4(%ebp)"
mov -4(%ebp), %edx
mov %edx, __gc_dontClear__
# setting register "a" to "-4(%ebp)"
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# note, read STACK VAR outString -> -4(%ebp)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# outString: 4
# curChar: 5
__method_iofile_getLine_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_getLine___, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_getTo_
pushl $10
call __method_iofile_getTo_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# optimized move from %ecx to __gc_dontClear__
mov %ecx, __gc_dontClear__
# setting register "a" to "%ecx"
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_iofile_shl_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shl_0____, %esp # total stack allocation

# note, read PARAM buffer -> 8(%ebp)
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_write_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_iofile_write_
mov %eax, %ecx
add $4, %esp
# popping clobbers
popl __this__
# optimized move from __this__ to __gc_dontClear__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __gc_dontClear__
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_iofile_shl_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shl_1____, %esp # total stack allocation

# note, read PARAM number -> 8(%ebp)
# pushing clobbers
# Calling function itos
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call itos
mov %eax, %ecx
add $4, %esp
# popping clobbers
pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
push %ecx
# Calling function __method_iofile_write_
push %ecx
call __method_iofile_write_
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
popl __this__
# optimized move from __this__ to __gc_dontClear__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __gc_dontClear__
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_iofile_shr_2__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shr_2____, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_getLine_
call __method_iofile_getLine_
mov %eax, %ecx
# popping clobbers
popl __this__
# SETTING buffer <- %ecx
# requesting ownership for buffer (set). Note, using MOV since reference
mov 8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# optimized move from __this__ to __gc_dontClear__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __gc_dontClear__
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_iofile_shr_3__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shr_3____, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_getLine_
call __method_iofile_getLine_
mov %eax, %ecx
# popping clobbers
popl __this__
# pushing clobbers
push %ecx
# Calling function atoi
push %ecx
call atoi
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# SETTING outnum <- %esi
# Setting pointer %esi -> 8(%ebp)
mov 8(%ebp), %eax
movl %esi, (%eax)


# optimized move from __this__ to __gc_dontClear__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __gc_dontClear__
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_iofile_shr_4__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shr_4____, %esp # total stack allocation

pushl __this__
# optimized move from __this__ to __this__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __this__
# pushing clobbers
# Calling function __method_iofile_getLine_
call __method_iofile_getLine_
mov %eax, %ecx
# popping clobbers
popl __this__
# indexing array
mov %ecx, %eax
movw $0, __TEMP8_0__
mov 0(%eax), %dl
mov %edx, __TEMP8_0__
# optimized move from __TEMP8_0__ to __TEMP8_1__
xor %edx, %edx
# setting register "d" to "__TEMP8_0__"
xor %edx, %edx
movb __TEMP8_0__, %dl
mov %dl, __TEMP8_1__
# SETTING outch <- __TEMP8_1__
# Setting pointer __TEMP8_1__ -> 8(%ebp)
mov 8(%ebp), %eax
mov __TEMP8_1__, %dl
movb %dl, (%eax)


# optimized move from __this__ to __gc_dontClear__
# setting register "d" to "__this__"
movl __this__, %edx
mov %edx, __gc_dontClear__
# setting register "a" to "__this__"
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

