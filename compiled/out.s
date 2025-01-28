
/*
********HAM PRIME**********
Compiled with love on Mon Jan 27 2025 21:08:03 GMT-0700 (Mountain Standard Time)
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
.4byte 4
__STRING6__: .asciz "rio"
__ALLOCFOR_entry__ = 4
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
#//------- line:  ------- #
#//------- line: entry function <  > -> u32 ------- #
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: "abcdefg" ------- #
	#//------- line: create word <- __STRING0__ ------- #
	# creating variable "word" of type "conststr:borrowed" stack?=true
	# converting conststr "__STRING0__" to dynamic string
	pushl $__STRING0__
	call cptos
	add $4, %esp
	mov %eax, %ecx
	# Loading local variable "word" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for word (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line: word , 2 , 5 ------- #
	# note, read STACK VAR word -> -4(%ebp)
	#//------- line: substr ( -4(%ebp),,,2,,,5 ) ------- #
	# pushing clobbers
	# Calling function substr
	pushl $5
	pushl $2
	# TODO optimize if variable just do movl
	mov -4(%ebp), %edx
	push %edx
	call substr
	mov %eax, %ecx
	add $12, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: word , 'h' ------- #
	# note, read STACK VAR word -> -4(%ebp)
	#//------- line: strpush ( -4(%ebp),,,104 ) ------- #
	# pushing clobbers
	# Calling function strpush
	pushl $104
	# TODO optimize if variable just do movl
	lea -4(%ebp), %edx # PASS AS REFERENCE
	push %edx
	call strpush
	mov %eax, %ecx
	add $8, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: word ------- #
	# note, read STACK VAR word -> -4(%ebp)
	#//------- line: strpop ( -4(%ebp) ) ------- #
	# pushing clobbers
	# Calling function strpop
	# TODO optimize if variable just do movl
	lea -4(%ebp), %edx # PASS AS REFERENCE
	push %edx
	call strpop
	mov %al, %cl
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %cl ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call putchar
	movb $'\n', (%esp)
	call putchar
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: "nico,jon,bob" , ',' ------- #
	#//------- line: strsplitchr ( __STRING1__,,,44 ) ------- #
	# pushing clobbers
	# Calling function strsplitchr
	pushl $44
	# converting conststr to string (function call)
	pushl $__STRING1__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call strsplitchr
	mov %eax, %ecx
	add $8, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	# printing array (either string or format array)
	mov %ecx, %eax
	push %eax     # load buffer
	mov -4(%eax), %edx
	pushl 8(%edx) # load size
	call print_stringArr
	add $8, %esp
	# popping multi-line clobbers
	#//------- line: "Hello World!" , "to this amazing " , 6 ------- #
	#//------- line: strinsert ( __STRING2__,,,__STRING3__,,,6 ) ------- #
	# pushing clobbers
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
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: "abc" , "123" ------- #
	#//------- line: strjoin ( __STRING4__,,,__STRING5__ ) ------- #
	# pushing clobbers
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
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: "rio" ------- #
	#//------- line: strsplit ( __STRING6__ ) ------- #
	# pushing clobbers
	# Calling function strsplit
	# converting conststr to string (function call)
	pushl $__STRING6__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call strsplit
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	# printing array (either string or format array)
	mov %ecx, %eax
	push %eax     # load buffer
	mov -4(%eax), %edx
	pushl 8(%edx) # load size
	call print_stringArr
	add $8, %esp
	# popping multi-line clobbers
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# word: 4

