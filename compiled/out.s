
/*
********HAM PRIME**********
Compiled with love on Sat Feb 01 2025 11:39:44 GMT-0700 (Mountain Standard Time)
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
.4byte 10
__STRING0__: .asciz "\x1B[42m "
CGREEN: .4byte 0
.4byte 10
__STRING1__: .asciz "\x1B[43m "
CYELLOW: .4byte 0
.4byte 10
__STRING2__: .asciz "\x1B[40m "
CGRAY: .4byte 0
.4byte 9
__STRING3__: .asciz " \x1B[0m"
CRESET: .4byte 0
.type	printColor, @function
.global printColor
.4byte 3
__STRING4__: .asciz "%s"
__ALLOCFOR_printColor__ = 0
.4byte 6
__STRING5__: .asciz "canoe"
answer: .4byte 0
.type	tryWord, @function
.global tryWord
.4byte 2
__STRING6__: .asciz "║"
__ALLOCFOR_tryWord__ = 5
.type	entry, @function
.global entry
.4byte 42
__STRING7__: .asciz "\nWelcome to Wordle!\n\n╔═══════════════╗"
.4byte 6
__STRING8__: .asciz "hello"
.4byte 6
__STRING9__: .asciz "adore"
.4byte 6
__STRING10__: .asciz "canes"
.4byte 6
__STRING11__: .asciz "-----"
.4byte 18
__STRING12__: .asciz "╚═══════════════╝"
__ALLOCFOR_entry__ = 0
__TEMP8_0__: .1byte 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: string : reference src , char letter ------- #
#//------- line: forward strpush function < src,,,letter > -> string ------- #
#//------- line: string : reference src ------- #
#//------- line: forward strpop function < src > -> char ------- #
#//------- line: string str , char delim ------- #
#//------- line: forward strsplitchr function < str,,,delim > -> string : array ------- #
#//------- line: string str , string ins , u32 index ------- #
#//------- line: forward strinsert function < str,,,ins,,,index > -> string ------- #
#//------- line: string first , string second ------- #
#//------- line: forward strjoin function < first,,,second > -> string ------- #
#//------- line: string str ------- #
#//------- line: forward strsplit function < str > -> string : array ------- #
#//------- line: string str , u8 ch ------- #
#//------- line: forward strincludes function < str,,,ch > -> u8 ------- #
#//------- line: "\x1B[42m " ------- #
#//------- line: create CGREEN <- __STRING0__ ------- #
# creating variable "CGREEN" of type "conststr:borrowed" stack?=false
# converting conststr "__STRING0__" to dynamic string
pushl $__STRING0__
call cptos
add $4, %esp
mov %eax, %ecx
mov %ecx, CGREEN
#//------- line: "\x1B[43m " ------- #
#//------- line: create CYELLOW <- __STRING1__ ------- #
# creating variable "CYELLOW" of type "conststr:borrowed" stack?=false
# converting conststr "__STRING1__" to dynamic string
pushl $__STRING1__
call cptos
add $4, %esp
mov %eax, %ecx
mov %ecx, CYELLOW
#//------- line: "\x1B[40m " ------- #
#//------- line: create CGRAY <- __STRING2__ ------- #
# creating variable "CGRAY" of type "conststr:borrowed" stack?=false
# converting conststr "__STRING2__" to dynamic string
pushl $__STRING2__
call cptos
add $4, %esp
mov %eax, %ecx
mov %ecx, CGRAY
#//------- line: " \x1B[0m" ------- #
#//------- line: create CRESET <- __STRING3__ ------- #
# creating variable "CRESET" of type "conststr:borrowed" stack?=false
# converting conststr "__STRING3__" to dynamic string
pushl $__STRING3__
call cptos
add $4, %esp
mov %eax, %ecx
mov %ecx, CRESET
#//------- line: string color , char c ------- #
#//------- line: printColor function < color,,,c > ------- #
#//------- line: { ; ------- #
# {
#//------- line: "canoe" ------- #
#//------- line: create answer <- __STRING5__ ------- #
# creating variable "answer" of type "conststr:borrowed" stack?=false
# converting conststr "__STRING5__" to dynamic string
pushl $__STRING5__
call cptos
add $4, %esp
mov %eax, %ecx
mov %ecx, answer
#//------- line: string word ------- #
#//------- line: tryWord function < word > ------- #
#//------- line: { ; ------- #
# {
#//------- line: entry function <  > ------- #
#//------- line: { ; ------- #
# {
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
printColor:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_printColor__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: "%s" , color + c + CRESET ------- #
	# note, read PARAM color -> 8(%ebp)
	# note, read PARAM c -> 12(%ebp)
	pushw __disable_gc__; movw $1, __disable_gc__
	# setting register "d" to "CRESET"
	movl CRESET, %edx
	push %edx
	push 12(%ebp)
	call ctos
	add $4, %esp
	push %eax
	push 8(%ebp)
	pushl $3
	call strjoinmany
	add $16, %esp
	mov %eax, %ecx
	popw __disable_gc__
	#//------- line: printf ( __STRING4__,,,%ecx ) ------- #
	# pushing clobbers
	push %ecx
	# Calling function printf
	push %ecx
	pushl $__STRING4__
	call printf
	mov %eax, %esi
	add $8, %esp
	# popping clobbers
	pop %ecx
	# clobbering "s"
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
tryWord:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_tryWord__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: "║" ------- #
	#//------- line: printf ( __STRING6__ ) ------- #
	# pushing clobbers
	# Calling function printf
	pushl $__STRING6__
	call printf
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: 0 ------- #
	#//------- line: create i <- 0 ------- #
	# creating variable "i" of type "u32:borrowed" stack?=true
	# Loading local variable "i" @-4(%ebp) with "0"
	# optimized move from 0 to -4(%ebp)
	movl $0, -4(%ebp)
	__LABEL2__:
	#//------- line: i <: 5 ------- #
	# note, read STACK VAR i -> -4(%ebp)
	mov -4(%ebp), %eax
	mov $0, %cl
	cmp $5, %eax
	setl %cl
	#//------- line: while ( %cl ) ------- #
	# comparison for WHILE loop
	cmpb $1, %cl
	jne __LABEL3__
	#//------- line: { ; ------- #
	# {
		#//------- line: i ------- #
		# note, read STACK VAR i -> -4(%ebp)
		#//------- line: word [ -4(%ebp) ] ------- #
		# note, read PARAM word -> 8(%ebp)
		# indexing array
		mov 8(%ebp), %eax
		xor %ecx, %ecx
		# optimized move from -4(%ebp) to %edx
		# setting register "d" to "-4(%ebp)"
		mov -4(%ebp), %edx
		mov %edx, %edx
		mov (%eax, %edx, 1), %cl
		#//------- line: create letter <- %cl ------- #
		# creating variable "letter" of type "u8:borrowed" stack?=true
		# Loading local variable "letter" @-5(%ebp) with "%cl"
		# optimized move from %cl to -5(%ebp)
		mov %cl, -5(%ebp)
		#//------- line: answer , letter ------- #
		# note, read STACK VAR letter -> -5(%ebp)
		#//------- line: strincludes ( answer,,,-5(%ebp) ) ------- #
		# pushing clobbers
		# Calling function strincludes
		xor %edx, %edx
		# TODO optimize if variable just do movl
		mov -5(%ebp), %dl
		push %edx
		# TODO optimize if variable just do movl
		mov answer, %edx
		push %edx
		call strincludes
		mov %al, %cl
		add $8, %esp
		# popping clobbers
		# clobbering "c"
		#//------- line: if ( %cl ) ------- #
		cmpb $1, %cl # comparison for "if" statement
		jne __LABEL4__
		#//------- line: { ; ------- #
		# {
			#//------- line: i ------- #
			# note, read STACK VAR i -> -4(%ebp)
			#//------- line: letter == answer [ -4(%ebp) ] ------- #
			# note, read STACK VAR letter -> -5(%ebp)
			# indexing array
			mov answer, %eax
			xor %ecx, %ecx
			# optimized move from -4(%ebp) to %edx
			# setting register "d" to "-4(%ebp)"
			mov -4(%ebp), %edx
			mov %edx, %edx
			mov (%eax, %edx, 1), %cl
			mov -5(%ebp), %al
			movb $0, __TEMP8_0__
			cmp %cl, %al
			sete __TEMP8_0__
			#//------- line: if ( __TEMP8_0__ ) ------- #
			cmpb $1, __TEMP8_0__ # comparison for "if" statement
			jne __LABEL6__
			#//------- line: { ; ------- #
			# {
				#//------- line: CGREEN , letter ------- #
				# note, read STACK VAR letter -> -5(%ebp)
				#//------- line: printColor ( CGREEN,,,-5(%ebp) ) ------- #
				# pushing clobbers
				# Calling function printColor
				xor %edx, %edx
				# TODO optimize if variable just do movl
				mov -5(%ebp), %dl
				push %edx
				# TODO optimize if variable just do movl
				mov CGREEN, %edx
				push %edx
				call printColor
				mov %eax, %ecx
				add $8, %esp
				# popping clobbers
				# clobbering "c"
				#//------- line: } ------- #
			# }
jmp __LABEL7__
__LABEL6__:
			#//------- line: else ------- #
			#//------- line: { ; ------- #
			# {
				#//------- line: CYELLOW , letter ------- #
				# note, read STACK VAR letter -> -5(%ebp)
				#//------- line: printColor ( CYELLOW,,,-5(%ebp) ) ------- #
				# pushing clobbers
				# Calling function printColor
				xor %edx, %edx
				# TODO optimize if variable just do movl
				mov -5(%ebp), %dl
				push %edx
				# TODO optimize if variable just do movl
				mov CYELLOW, %edx
				push %edx
				call printColor
				mov %eax, %ecx
				add $8, %esp
				# popping clobbers
				# clobbering "c"
				#//------- line: } ------- #
			# }
jmp __LABEL7__
__LABEL8__:
			__LABEL7__:
			#//------- line: } ------- #
		# }
jmp __LABEL5__
__LABEL4__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			#//------- line: CGRAY , letter ------- #
			# note, read STACK VAR letter -> -5(%ebp)
			#//------- line: printColor ( CGRAY,,,-5(%ebp) ) ------- #
			# pushing clobbers
			# Calling function printColor
			xor %edx, %edx
			# TODO optimize if variable just do movl
			mov -5(%ebp), %dl
			push %edx
			# TODO optimize if variable just do movl
			mov CGRAY, %edx
			push %edx
			call printColor
			mov %eax, %ecx
			add $8, %esp
			# popping clobbers
			# clobbering "c"
			#//------- line: } ------- #
		# }
jmp __LABEL5__
__LABEL9__:
		__LABEL5__:
		#//------- line: i + 1 ------- #
		# note, read STACK VAR i -> -4(%ebp)
		mov -4(%ebp), %eax
		add $1, %eax
		mov %eax, %ecx
		#//------- line: i <- %ecx ------- #
		# SETTING i <- %ecx
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: } ------- #
	# }
	jmp __LABEL2__
	__LABEL3__:
	#//------- line: "║" ------- #
	#//------- line: print_ ( __STRING6__ ) ------- #
	# pushing multi-line clobbers
	pushl $__STRING6__
	call puts
	add $4, %esp
	# popping multi-line clobbers
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
# i: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: "\nWelcome to Wordle!\n\n╔═══════════════╗" ------- #
	#//------- line: print_ ( __STRING7__ ) ------- #
	# pushing multi-line clobbers
	pushl $__STRING7__
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: "hello" ------- #
	#//------- line: tryWord ( __STRING8__ ) ------- #
	# pushing clobbers
	# Calling function tryWord
	# converting conststr to string (function call)
	pushl $__STRING8__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call tryWord
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: "adore" ------- #
	#//------- line: tryWord ( __STRING9__ ) ------- #
	# pushing clobbers
	# Calling function tryWord
	# converting conststr to string (function call)
	pushl $__STRING9__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call tryWord
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: "canes" ------- #
	#//------- line: tryWord ( __STRING10__ ) ------- #
	# pushing clobbers
	# Calling function tryWord
	# converting conststr to string (function call)
	pushl $__STRING10__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call tryWord
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: "canoe" ------- #
	#//------- line: tryWord ( __STRING5__ ) ------- #
	# pushing clobbers
	# Calling function tryWord
	# converting conststr to string (function call)
	pushl $__STRING5__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call tryWord
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: "-----" ------- #
	#//------- line: tryWord ( __STRING11__ ) ------- #
	# pushing clobbers
	# Calling function tryWord
	# converting conststr to string (function call)
	pushl $__STRING11__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call tryWord
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: "╚═══════════════╝" ------- #
	#//------- line: print_ ( __STRING12__ ) ------- #
	# pushing multi-line clobbers
	pushl $__STRING12__
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret

