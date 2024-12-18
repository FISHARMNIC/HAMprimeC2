
/*
********HAM PRIME**********
Compiled with love on Tue Dec 17 2024 17:41:28 GMT-0700 (Mountain Standard Time)
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
.extern stdout
.type	testOutput, @function
.global testOutput
.4byte 16
__STRING0__: .asciz "[ RUN      ] : "
.4byte 2
__STRING1__: .asciz " "
.4byte 3
__STRING2__: .asciz "%c"
.4byte 1
__STRING3__: .asciz ""
.4byte 16
__STRING4__: .asciz "[     PASS ] : "
.4byte 16
__STRING5__: .asciz "[  FAILED  ] : "
.4byte 33
__STRING6__: .asciz "------------\n*** Expected:\n\t "
.4byte 21
__STRING7__: .asciz " \n*** But got:\n\t "
.4byte 17
__STRING8__: .asciz "\n------------\n"
__ALLOCFOR_testOutput__ = 13
.type	entry, @function
.global entry
.4byte 6
__STRING9__: .asciz "first"
.4byte 8
__STRING10__: .asciz "hello\n"
.4byte 7
__STRING11__: .asciz "second"
.4byte 10
__STRING12__: .asciz "bananas\n"
__ALLOCFOR_entry__ = 0
__anonymous_a__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_a__, @function
.global __anonymous_a__
.4byte 6
__STRING13__: .asciz "hello"
__ALLOCFOR___anonymous_a____ = 0
__anonymous_b__ebpCapture__: .4byte 0 # Capture ebp for anonymous function
.type	__anonymous_b__, @function
.global __anonymous_b__
.4byte 7
__STRING14__: .asciz "apples"
__ALLOCFOR___anonymous_b____ = 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

# auto-return OK for entry function
ret
.global __init_for_out__
###################################

.global main
main:
call __init_for_out__
call entry
ret

###################################
testOutput:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_testOutput__, %esp # total stack allocation

pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM testName -> 8(%ebp)
pushl $__STRING1__
push 8(%ebp)
pushl $__STRING0__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# pushing clobbers
# Calling function fflush
# TODO optimize if variable just do movl
mov stdout, %edx
push %edx
call fflush
mov %eax, %ecx
add $4, %esp
# popping clobbers
# pushing clobbers
# Calling function fileno
# TODO optimize if variable just do movl
mov stdout, %edx
push %edx
call fileno
mov %eax, %ecx
add $4, %esp
# popping clobbers
# pushing clobbers
push %ecx
# Calling function dup
push %ecx
call dup
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# creating variable "tmpout" of type "u32:borrowed" stack?=true
# Loading local variable "tmpout" @-4(%ebp) with "%esi"
# optimized move from %esi to -4(%ebp)
mov %esi, -4(%ebp)
# pushing clobbers
push %ecx
# Asked for 2 allocations of "u32"
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
# popping clobbers
pop %ecx
mov %eax, %ecx
# creating variable "pipes" of type "array:dynamic" stack?=true
# Loading local variable "pipes" @-8(%ebp) with "%ecx"
# optimized move from %ecx to -8(%ebp)
mov %ecx, -8(%ebp)
# requesting ownership for pipes (create)
lea -8(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# note, read STACK VAR pipes -> -8(%ebp)
# pushing clobbers
# Calling function pipe
# TODO optimize if variable just do movl
mov -8(%ebp), %edx
push %edx
call pipe
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR pipes -> -8(%ebp)
# indexing array
mov -8(%ebp), %eax
mov 4(%eax), %ecx
# pushing clobbers
push %ecx
# Calling function fileno
# TODO optimize if variable just do movl
mov stdout, %edx
push %edx
call fileno
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# pushing clobbers
push %esi
push %ecx
# Calling function dup2
push %esi
push %ecx
call dup2
mov %eax, %edi
add $8, %esp
# popping clobbers
pop %ecx
pop %esi
# note, read PARAM fn -> 12(%ebp)
# pushing clobbers
# Calling function __not_a_function__
call *12(%ebp)
mov %eax, %ecx
# popping clobbers
# pushing clobbers
# Calling function printf
pushl $0
pushl $__STRING2__
call printf
mov %eax, %ecx
add $8, %esp
# popping clobbers
# pushing clobbers
# Calling function fflush
# TODO optimize if variable just do movl
mov stdout, %edx
push %edx
call fflush
mov %eax, %ecx
add $4, %esp
# popping clobbers
# note, read STACK VAR pipes -> -8(%ebp)
# indexing array
mov -8(%ebp), %eax
mov 4(%eax), %ecx
# pushing clobbers
push %ecx
# Calling function close
push %ecx
call close
mov %eax, %esi
add $4, %esp
# popping clobbers
pop %ecx
# note, read STACK VAR tmpout -> -4(%ebp)
# pushing clobbers
# Calling function fileno
# TODO optimize if variable just do movl
mov stdout, %edx
push %edx
call fileno
mov %eax, %ecx
add $4, %esp
# popping clobbers
# pushing clobbers
push %ecx
# Calling function dup2
push %ecx
# TODO optimize if variable just do movl
mov -4(%ebp), %edx
push %edx
call dup2
mov %eax, %esi
add $8, %esp
# popping clobbers
pop %ecx
# creating variable "c" of type "u8:borrowed" stack?=true
# Loading local variable "c" @-9(%ebp) with "1"
# optimized move from 1 to -9(%ebp)
movb $1, -9(%ebp)
# creating variable "ostr" of type "conststr:borrowed" stack?=true
pushl $__STRING3__
call cptos
add $4, %esp
mov %eax, %ecx
# Loading local variable "ostr" @-13(%ebp) with "%ecx"
# optimized move from %ecx to -13(%ebp)
mov %ecx, -13(%ebp)
# requesting ownership for ostr (create)
lea -13(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
__LABEL1__:
# note, read STACK VAR c -> -9(%ebp)
mov -9(%ebp), %al
mov $0, %cl
cmp $0, %al
setne %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL2__
# note, read STACK VAR c -> -9(%ebp)
# note, read STACK VAR pipes -> -8(%ebp)
# indexing array
mov -8(%ebp), %eax
mov 0(%eax), %ecx
# reading address of -9(%ebp)
lea -9(%ebp), %esi
# pushing clobbers
push %esi
push %ecx
# Calling function read
pushl $1
push %esi
push %ecx
call read
mov %eax, %edi
add $12, %esp
# popping clobbers
pop %ecx
pop %esi
# note, read STACK VAR ostr -> -13(%ebp)
# note, read STACK VAR c -> -9(%ebp)
pushw __disable_gc__; movw $1, __disable_gc__
push -9(%ebp)
call ctos
add $4, %esp
push %eax
push -13(%ebp)
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
popw __disable_gc__
# SETTING ostr <- %ecx
# requesting ownership for ostr (set). 
lea -13(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL1__
__LABEL2__:
# note, read STACK VAR ostr -> -13(%ebp)
# note, read PARAM expected -> 16(%ebp)
# pushing clobbers
push %ecx
push -13(%ebp)
push 16(%ebp)
# comparing strings
call strcmp
add $8, %esp
# popping clobbers
pop %ecx
xor %ecx, %ecx
cmp $0, %eax
setz %cl
cmpb $1, %cl # comparison for "if" statement
jne __LABEL3__
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM testName -> 8(%ebp)
pushl $__STRING3__
push 8(%ebp)
pushl $__STRING4__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# setting register "a" to "0"
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL4__
__LABEL3__:
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM testName -> 8(%ebp)
pushl $__STRING3__
push 8(%ebp)
pushl $__STRING5__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
pushw __disable_gc__; movw $1, __disable_gc__
# note, read PARAM expected -> 16(%ebp)
# note, read STACK VAR ostr -> -13(%ebp)
pushl $__STRING8__
push -13(%ebp)
pushl $__STRING7__
push 16(%ebp)
pushl $__STRING6__
pushl $5
call strjoinmany
add $24, %esp
mov %eax, %ecx
popw __disable_gc__
# pushing multi-line clobbers
push %ecx
call puts
add $4, %esp
# popping multi-line clobbers
# setting register "a" to "1"
mov $1, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL4__
__LABEL5__:
__LABEL4__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# tmpout: 4
# pipes: 8
# c: 9
# ostr: 13
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
# reading address of __anonymous_a__
lea __anonymous_a__, %ecx
# pushing clobbers
push %ecx
# Calling function testOutput
# converting conststr to string (function call)
pushl $__STRING10__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
push %ecx
# converting conststr to string (function call)
pushl $__STRING9__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call testOutput
mov %eax, %esi
add $12, %esp
# popping clobbers
pop %ecx
popl __anonymous_a__ebpCapture__
pushl __anonymous_b__ebpCapture__;mov %ebp, __anonymous_b__ebpCapture__
# reading address of __anonymous_b__
lea __anonymous_b__, %ecx
# pushing clobbers
push %ecx
# Calling function testOutput
# converting conststr to string (function call)
pushl $__STRING12__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
push %ecx
# converting conststr to string (function call)
pushl $__STRING11__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call testOutput
mov %eax, %esi
add $12, %esp
# popping clobbers
pop %ecx
popl __anonymous_b__ebpCapture__
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
__anonymous_a__:
mov __anonymous_a__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_a____, %esp # total stack allocation

# pushing multi-line clobbers
push %ecx
pushl $__STRING13__
call puts
add $4, %esp
# popping multi-line clobbers
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__anonymous_b__:
mov __anonymous_b__ebpCapture__, %ecx
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___anonymous_b____, %esp # total stack allocation

# pushing multi-line clobbers
push %ecx
pushl $__STRING14__
call puts
add $4, %esp
# popping multi-line clobbers
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret

