
/*
********HAM PRIME**********
Compiled with love on Sun Dec 01 2024 18:19:07 GMT-0800 (Pacific Standard Time)
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
.type	entry, @function
.global entry
.4byte 8
__STRING0__: .asciz "abcdefg"
.4byte 13
__STRING1__: .asciz "nico,jon,bob"
.4byte 13
__STRING2__: .asciz "Hello World!"
.4byte 17
__STRING3__: .asciz "to this amazing "
.4byte 4
__STRING4__: .asciz "abc"
.4byte 4
__STRING5__: .asciz "123"
__ALLOCFOR_entry__ = 4
###################################
.text

#### compiler initation section ###
__init_for_out__:


ret
.global __init_for_out__
###################################

.global main
main:
call __init_for_out__
call entry
ret

###################################
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

pushl $__STRING0__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "word" @-4(%ebp)
# optimized move from %ecx to -4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for word (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR word -> -4(%ebp)
# Calling function substr
pushl $5
pushl $2
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call substr
mov %eax, %ecx
add $12, %esp
push %ecx
call puts
add $4, %esp
# note, read STACK VAR word -> -4(%ebp)
# Calling function strpush
pushl $104
# TODO optimize if variable just do movl
lea -4(%ebp), %edx # PASS AS REFERENCE
push %edx
call strpush
mov %eax, %ecx
add $8, %esp
push %ecx
call puts
add $4, %esp
# note, read STACK VAR word -> -4(%ebp)
# Calling function strpop
# TODO optimize if variable just do movl
lea -4(%ebp), %edx # PASS AS REFERENCE
push %edx
call strpop
mov %al, %cl
add $4, %esp
push %ecx
call putchar
movb $'\n', (%esp)
call putchar
add $4, %esp
# Calling function strsplitchr
pushl $44
# converting conststr to string (function call)
pushl $__STRING1__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call strsplitchr
mov %eax, %ecx
add $8, %esp
# printing array (either string or format array)
mov %ecx, %eax
push %eax     # load buffer
mov -4(%eax), %edx
pushl 8(%edx) # load size
call print_stringArr
add $8, %esp
# Calling function strinsert
pushl $6
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
# converting conststr to string (function call)
pushl $__STRING2__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call strinsert
mov %eax, %ecx
add $12, %esp
push %ecx
call puts
add $4, %esp
# Calling function strjoin
# converting conststr to string (function call)
pushl $__STRING5__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
# converting conststr to string (function call)
pushl $__STRING4__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call strjoin
mov %eax, %ecx
add $8, %esp
push %ecx
call puts
add $4, %esp
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# word: 4

