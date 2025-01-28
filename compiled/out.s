
/*
********HAM PRIME**********
Compiled with love on Mon Jan 27 2025 21:10:42 GMT-0700 (Mountain Standard Time)
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

#//------- line:  ------- #
#//------- line:  ------- #
#//------- line:  ------- #
#//------- line:  ------- #
#//------- line: import p32 stdout ------- #
#//------- line: p32 f ------- #
#//------- line: forward fflush function < f > -> none ------- #
#//------- line: p32 f ------- #
#//------- line: forward fileno function < f > -> u32 ------- #
#//------- line: u32 fno ------- #
#//------- line: forward dup function < fno > -> u32 ------- #
#//------- line: u32 a , u32 b ------- #
#//------- line: forward dup2 function < a,,,b > -> u32 ------- #
#//------- line: u32 : array f ------- #
#//------- line: forward pipe function < f > -> u32 ------- #
#//------- line: u32 p , conststr s , u32 i ------- #
#//------- line: forward write function < p,,,s,,,i > -> u32 ------- #
#//------- line: u32 fno , p32 b , u32 nb ------- #
#//------- line: forward read function < fno,,,b,,,nb > -> u32 ------- #
#//------- line: u32 fno ------- #
#//------- line: forward close function < fno > -> u32 ------- #
#//------- line: string testName , fn func , string expected ------- #
#//------- line: testOutput function < testName,,,func,,,expected > -> u32 ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
#//------- line: entry function <  > -> u32 ------- #
#//------- line: { ; ------- #
# {
# auto-return OK for entry function
#//------- line:  ------- #
#//------- line: __lambda__ __anonymous_a__ function <  > ------- #
#//------- line: { ------- #
# {
#//------- line:  ------- #
#//------- line: __lambda__ __anonymous_b__ function <  > ------- #
#//------- line: { ------- #
# {
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

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: `[ RUN      ] : ${testName} ` ------- #
	pushw __disable_gc__; movw $1, __disable_gc__
	#//------- line: testName ------- #
	# note, read PARAM testName -> 8(%ebp)
	#//------- line: "[ RUN      ] : " ------- #
	#//------- line: " " ------- #
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	push 8(%ebp)
	# setting register "d" to "__STRING0__"
	movl $__STRING0__, %edx
	push %edx
	pushl $3
	call strjoinmany
	add $16, %esp
	mov %eax, %ecx
	popw __disable_gc__
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line:  ------- #
	#//------- line: stdout ------- #
	#//------- line: fflush ( stdout ) ------- #
	# pushing clobbers
	# Calling function fflush
	# TODO optimize if variable just do movl
	mov stdout, %edx
	push %edx
	call fflush
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line:  ------- #
	#//------- line: stdout ------- #
	#//------- line: fileno ( stdout ) ------- #
	# pushing clobbers
	# Calling function fileno
	# TODO optimize if variable just do movl
	mov stdout, %edx
	push %edx
	call fileno
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: dup ( %ecx ) ------- #
	# pushing clobbers
	push %ecx
	# Calling function dup
	push %ecx
	call dup
	mov %eax, %esi
	add $4, %esp
	# popping clobbers
	pop %ecx
	# clobbering "s"
	#//------- line: create tmpout <- %esi ------- #
	# creating variable "tmpout" of type "u32:borrowed" stack?=true
	# Loading local variable "tmpout" @-4(%ebp) with "%esi"
	# optimized move from %esi to -4(%ebp)
	mov %esi, -4(%ebp)
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: 2 ------- #
	#//------- line: u32 [ 2 ] ------- #
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
	#//------- line: create pipes <- %ecx ------- #
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
	#//------- line: pipes ------- #
	# note, read STACK VAR pipes -> -8(%ebp)
	#//------- line: pipe ( -8(%ebp) ) ------- #
	# pushing clobbers
	# Calling function pipe
	# TODO optimize if variable just do movl
	mov -8(%ebp), %edx
	push %edx
	call pipe
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: 1 ------- #
	#//------- line: stdout ------- #
	#//------- line: pipes [ 1 ] , fileno ( stdout ) ------- #
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
	# clobbering "s"
	#//------- line: dup2 ( %ecx,,,%esi ) ------- #
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
	# clobbering "i"
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: func (  ) ------- #
	# note, read PARAM func -> 12(%ebp)
	# pushing clobbers
	# Calling function __not_a_function__
	call *12(%ebp)
	mov %eax, %ecx
	# popping clobbers
	# clobbering "c"
	#//------- line: "%c" , 0 ------- #
	#//------- line: printf ( __STRING2__,,,0 ) ------- #
	# pushing clobbers
	# Calling function printf
	pushl $0
	pushl $__STRING2__
	call printf
	mov %eax, %ecx
	add $8, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: stdout ------- #
	#//------- line: fflush ( stdout ) ------- #
	# pushing clobbers
	# Calling function fflush
	# TODO optimize if variable just do movl
	mov stdout, %edx
	push %edx
	call fflush
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: 1 ------- #
	#//------- line: pipes [ 1 ] ------- #
	# note, read STACK VAR pipes -> -8(%ebp)
	# indexing array
	mov -8(%ebp), %eax
	mov 4(%eax), %ecx
	#//------- line: close ( %ecx ) ------- #
	# pushing clobbers
	push %ecx
	# Calling function close
	push %ecx
	call close
	mov %eax, %esi
	add $4, %esp
	# popping clobbers
	pop %ecx
	# clobbering "s"
	#//------- line: stdout ------- #
	#//------- line: tmpout , fileno ( stdout ) ------- #
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
	# clobbering "c"
	#//------- line: dup2 ( -4(%ebp),,,%ecx ) ------- #
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
	# clobbering "s"
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: 1 ------- #
	#//------- line: create char c <- 1 ------- #
	# creating variable "c" of type "u8:borrowed" stack?=true
	# Loading local variable "c" @-9(%ebp) with "1"
	# optimized move from 1 to -9(%ebp)
	movb $1, -9(%ebp)
	#//------- line:  ------- #
	#//------- line: "" ------- #
	#//------- line: create ostr <- __STRING3__ ------- #
	# creating variable "ostr" of type "conststr:borrowed" stack?=true
	# converting conststr "__STRING3__" to dynamic string
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
	#//------- line: c != 0 ------- #
	# note, read STACK VAR c -> -9(%ebp)
	mov -9(%ebp), %al
	mov $0, %cl
	cmp $0, %al
	setne %cl
	#//------- line: while ( %cl ) ------- #
	# comparison for WHILE loop
	cmpb $1, %cl
	jne __LABEL2__
	#//------- line: { ; ------- #
	# {
		#//------- line: 0 ------- #
		#//------- line: c ------- #
		# note, read STACK VAR c -> -9(%ebp)
		#//------- line: pipes [ 0 ] , $ ( -9(%ebp) ) , 1 ------- #
		# note, read STACK VAR pipes -> -8(%ebp)
		# indexing array
		mov -8(%ebp), %eax
		mov 0(%eax), %ecx
		# reading address of -9(%ebp)
		lea -9(%ebp), %esi
		#//------- line: read ( %ecx,,,%esi,,,1 ) ------- #
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
		# clobbering "i"
		#//------- line: ostr + c ------- #
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
		#//------- line: ostr <- %ecx ------- #
		# SETTING ostr <- %ecx
		# requesting ownership for ostr (set). 
		lea -13(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: } ------- #
	# }
	jmp __LABEL1__
	__LABEL2__:
	#//------- line: ostr == expected ------- #
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
	#//------- line: if ( %cl ) ------- #
	cmpb $1, %cl # comparison for "if" statement
	jne __LABEL3__
	#//------- line: { ; ------- #
	# {
		#//------- line: `[     PASS ] : ${testName}` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: testName ------- #
		# note, read PARAM testName -> 8(%ebp)
		#//------- line: "[     PASS ] : " ------- #
		#//------- line: "" ------- #
		# setting register "d" to "__STRING3__"
		movl $__STRING3__, %edx
		push %edx
		push 8(%ebp)
		# setting register "d" to "__STRING4__"
		movl $__STRING4__, %edx
		push %edx
		pushl $3
		call strjoinmany
		add $16, %esp
		mov %eax, %ecx
		popw __disable_gc__
		#//------- line: print_ ( %ecx ) ------- #
		# pushing multi-line clobbers
		push %ecx
		call puts
		add $4, %esp
		# popping multi-line clobbers
		#//------- line: return 0 ------- #
		#//------- line: 0 ------- #
		# setting register "a" to "0"
		mov $0, %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
		#//------- line: } ------- #
	# }
jmp __LABEL4__
__LABEL3__:
	#//------- line: else ------- #
	#//------- line: { ; ------- #
	# {
		#//------- line: `[  FAILED  ] : ${testName}` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: testName ------- #
		# note, read PARAM testName -> 8(%ebp)
		#//------- line: "[  FAILED  ] : " ------- #
		#//------- line: "" ------- #
		# setting register "d" to "__STRING3__"
		movl $__STRING3__, %edx
		push %edx
		push 8(%ebp)
		# setting register "d" to "__STRING5__"
		movl $__STRING5__, %edx
		push %edx
		pushl $3
		call strjoinmany
		add $16, %esp
		mov %eax, %ecx
		popw __disable_gc__
		#//------- line: print_ ( %ecx ) ------- #
		# pushing multi-line clobbers
		push %ecx
		call puts
		add $4, %esp
		# popping multi-line clobbers
		#//------- line: `------------\n*** Expected:\n\t ${expected} \n*** But got:\n\t ${ostr}\n------------\n` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: expected ------- #
		# note, read PARAM expected -> 16(%ebp)
		#//------- line: ostr ------- #
		# note, read STACK VAR ostr -> -13(%ebp)
		#//------- line: "------------\n*** Expected:\n\t " ------- #
		#//------- line: " \n*** But got:\n\t " ------- #
		#//------- line: "\n------------\n" ------- #
		# setting register "d" to "__STRING8__"
		movl $__STRING8__, %edx
		push %edx
		push -13(%ebp)
		# setting register "d" to "__STRING7__"
		movl $__STRING7__, %edx
		push %edx
		push 16(%ebp)
		# setting register "d" to "__STRING6__"
		movl $__STRING6__, %edx
		push %edx
		pushl $5
		call strjoinmany
		add $24, %esp
		mov %eax, %ecx
		popw __disable_gc__
		#//------- line: print_ ( %ecx ) ------- #
		# pushing multi-line clobbers
		push %ecx
		call puts
		add $4, %esp
		# popping multi-line clobbers
		#//------- line: return 1 ------- #
		#//------- line: 1 ------- #
		# setting register "a" to "1"
		mov $1, %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
		#//------- line: } ------- #
	# }
jmp __LABEL4__
__LABEL5__:
	__LABEL4__:
	#//------- line: } ------- #
# }
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

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

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: __asm__ "pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__" ------- #
	pushl __anonymous_a__ebpCapture__;mov %ebp, __anonymous_a__ebpCapture__
	#//------- line: "first" , $ __anonymous_a__ , "hello\n" ------- #
	# reading address of __anonymous_a__
	lea __anonymous_a__, %ecx
	#//------- line: testOutput ( __STRING9__,,,%ecx,,,__STRING10__ ) ------- #
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
	# clobbering "s"
	#//------- line: __asm__ "popl __anonymous_a__ebpCapture__" ------- #
	popl __anonymous_a__ebpCapture__
	#//------- line: __asm__ "pushl __anonymous_b__ebpCapture__;mov %ebp, __anonymous_b__ebpCapture__" ------- #
	pushl __anonymous_b__ebpCapture__;mov %ebp, __anonymous_b__ebpCapture__
	#//------- line: "second" , $ __anonymous_b__ , "bananas\n" ------- #
	# reading address of __anonymous_b__
	lea __anonymous_b__, %ecx
	#//------- line: testOutput ( __STRING11__,,,%ecx,,,__STRING12__ ) ------- #
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
	# clobbering "s"
	#//------- line: __asm__ "popl __anonymous_b__ebpCapture__" ------- #
	popl __anonymous_b__ebpCapture__
	#//------- line:  ------- #
	#//------- line: } ------- #
# }
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
call __rc_enterChunk__
# popping multi-line clobbers
pop %ecx
	#//------- line: "hello" ------- #
	#//------- line: print_ ( __STRING13__ ) ------- #
	# pushing multi-line clobbers
	push %ecx
	pushl $__STRING13__
	call puts
	add $4, %esp
	# popping multi-line clobbers
	pop %ecx
	#//------- line: } ------- #
# }
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

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
call __rc_enterChunk__
# popping multi-line clobbers
pop %ecx
	#//------- line: "apples" ------- #
	#//------- line: print_ ( __STRING14__ ) ------- #
	# pushing multi-line clobbers
	push %ecx
	pushl $__STRING14__
	call puts
	add $4, %esp
	# popping multi-line clobbers
	pop %ecx
	#//------- line: } ------- #
# }
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret

