
/*
********HAM PRIME**********
Compiled with love on Tue Feb 11 2025 11:49:02 GMT-0700 (Mountain Standard Time)
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
__ALLOCFOR___constructor_iofile_0___ = 4
.type	__constructor_iofile_1_, @function
.global __constructor_iofile_1_
.4byte 4
__STRING0__: .asciz "wb+"
__ALLOCFOR___constructor_iofile_1___ = 4
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
__ALLOCFOR___operator_iofile_shr_3____ = 4
.type	__operator_iofile_shr_4__, @function
.global __operator_iofile_shr_4__
__ALLOCFOR___operator_iofile_shr_4____ = 0
__SIZEOF_iofile__ = 4
# format "iofile" includes:
#   - PROPERTY (p32) fptr
#   - CNSTRCTR __constructor_iofile_0_ (0 parameters)
#   - CNSTRCTR __constructor_iofile_1_ (1 parameters)
.type	entry, @function
.global entry
.4byte 9
__STRING2__: .asciz "test.txt"
.4byte 21
__STRING3__: .asciz "Could not open file!"
.4byte 23
__STRING4__: .asciz "Rio is the best dog!\n"
.4byte 12
__STRING5__: .asciz "\nC\nHello "
.4byte 6
__STRING6__: .asciz " Bye!"
.4byte 9
__STRING7__: .asciz "Read 1: "
.4byte 9
__STRING8__: .asciz "Read 2: "
.4byte 9
__STRING9__: .asciz "Read 3: "
__ALLOCFOR_entry__ = 13
__TEMP8_0__: .1byte 0
__TEMP8_1__: .1byte 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line: string name , conststr perms ------- #
#//------- line: forward fopen function < name,,,perms > -> p32 ------- #
#//------- line: p32 fp ------- #
#//------- line: forward fclose function < fp > -> none ------- #
#//------- line: string buffer , u32 size , u32 count , p32 fp ------- #
#//------- line: forward fwrite function < buffer,,,size,,,count,,,fp > -> u32 ------- #
#//------- line: string str , u32 count , p32 fp ------- #
#//------- line: forward fgets function < str,,,count,,,fp > -> string ------- #
#//------- line: p32 fp , conststr fmtstr , ... ------- #
#//------- line: forward fscanf function < fp,,,fmtstr,,,... > -> u32 ------- #
#//------- line: p32 fp ------- #
#//------- line: forward fgetc function < fp > -> u8 ------- #
#//------- line: p32 fp ------- #
#//------- line: forward rewind function < fp > -> none ------- #
#//------- line: p32 fp , u32 offset , u32 whence ------- #
#//------- line: forward fseek function < fp,,,offset,,,whence > -> u32 ------- #
#//------- line: string s ------- #
#//------- line: forward atoi function < s > -> u32 ------- #
#//------- line: iofile format ------- #
#//------- line: { ; ------- #
# {
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
	#//------- line: . fptr p32 ------- #
	#//------- line: . iofile constructor <  > ------- #
__constructor_iofile_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_iofile_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
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
	#//------- line: { ; ------- #
	# {
		# creating variable "___CONSTRUCTOR_SAVE___" of type "iofile:dynamic" stack?=true
		# Loading local variable "___CONSTRUCTOR_SAVE___" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		# requesting ownership for ___CONSTRUCTOR_SAVE___ (create)
		lea -4(%ebp), %eax
		push %eax
		push __this__
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: 0 ------- #
		#//------- line: this . fptr <- 0 ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0 to 0(%eax)
		movl $0, 0(%eax)
		#//------- line: } ------- #
	# }
	# optimized move from -4(%ebp) to __gc_dontClear__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __gc_dontClear__
	# setting register "a" to "__this__"
	movl __this__, %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
# ___CONSTRUCTOR_SAVE___: 4
	#//------- line: conststr name ------- #
	#//------- line: . iofile constructor < name > ------- #
__constructor_iofile_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_iofile_1___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
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
	#//------- line: { ; ------- #
	# {
		# creating variable "___CONSTRUCTOR_SAVE___" of type "iofile:dynamic" stack?=true
		# Loading local variable "___CONSTRUCTOR_SAVE___" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		# requesting ownership for ___CONSTRUCTOR_SAVE___ (create)
		lea -4(%ebp), %eax
		push %eax
		push __this__
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: name , "wb+" ------- #
		# note, read PARAM name -> 8(%ebp)
		#//------- line: fopen ( 8(%ebp),,,__STRING0__ ) ------- #
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
		# clobbering "c"
		#//------- line: this . fptr <- %ecx ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 0(%eax)
		mov %ecx, 0(%eax)
		#//------- line: } ------- #
	# }
	# optimized move from -4(%ebp) to __gc_dontClear__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __gc_dontClear__
	# setting register "a" to "__this__"
	movl __this__, %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
# ___CONSTRUCTOR_SAVE___: 4
	#//------- line: conststr name ------- #
	#//------- line: . open method < name > ------- #
__method_iofile_open_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_open___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: name , "wb+" ------- #
		# note, read PARAM name -> 8(%ebp)
		#//------- line: fopen ( 8(%ebp),,,__STRING0__ ) ------- #
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
		# clobbering "c"
		#//------- line: this . fptr <- %ecx ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 0(%eax)
		mov %ecx, 0(%eax)
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
	#//------- line: conststr name , conststr mode ------- #
	#//------- line: . openMode method < name,,,mode > ------- #
__method_iofile_openMode_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_openMode___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: name , mode ------- #
		# note, read PARAM name -> 8(%ebp)
		# note, read PARAM mode -> 12(%ebp)
		#//------- line: fopen ( 8(%ebp),,,12(%ebp) ) ------- #
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
		# clobbering "c"
		#//------- line: this . fptr <- %ecx ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 0(%eax)
		mov %ecx, 0(%eax)
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
	#//------- line: . isOpen method <  > -> u8 ------- #
__method_iofile_isOpen_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_isOpen___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . fptr != 0 ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		setne __TEMP8_0__
		#//------- line: return ( __TEMP8_0__ ) ------- #
		# setting register "a" to "__TEMP8_0__"
		movl __TEMP8_0__, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: . close method <  > -> none ------- #
__method_iofile_close_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_close___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . fptr ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: fclose ( %ecx ) ------- #
		# pushing clobbers
		push %ecx
		# Calling function fclose
		push %ecx
		call fclose
		mov %eax, %esi
		add $4, %esp
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
	#//------- line: . rewind method <  > -> none ------- #
__method_iofile_rewind_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_rewind___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . fptr ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: rewind ( %ecx ) ------- #
		# pushing clobbers
		push %ecx
		# Calling function rewind
		push %ecx
		call rewind
		mov %eax, %esi
		add $4, %esp
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
	#//------- line: u32 address ------- #
	#//------- line: . seekg method < address > -> u32 ------- #
__method_iofile_seekg_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_seekg___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . fptr , address , 0 ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		# note, read PARAM address -> 8(%ebp)
		#//------- line: fseek ( %ecx,,,8(%ebp),,,0 ) ------- #
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
		# clobbering "s"
		#//------- line: return ( %esi ) ------- #
		# setting register "a" to "%esi"
		mov %esi, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: string buffer ------- #
	#//------- line: . write method < buffer > -> none ------- #
__method_iofile_write_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_write___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: buffer ------- #
		# note, read PARAM buffer -> 8(%ebp)
		#//------- line: buffer , 1 , strlen ( 8(%ebp) ) , this . fptr ------- #
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
		# clobbering "c"
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %esi
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %esi
		#//------- line: fwrite ( 8(%ebp),,,1,,,%ecx,,,%esi ) ------- #
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
		# clobbering "i"
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
	#//------- line: u8 ch ------- #
	#//------- line: . getTo method < ch > -> string ------- #
__method_iofile_getTo_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_getTo___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: "" ------- #
		#//------- line: create outString <- __STRING1__ ------- #
		# creating variable "outString" of type "conststr:borrowed" stack?=true
		# converting conststr "__STRING1__" to dynamic string
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
		#//------- line: this . fptr ------- #
		# Reading property "fptr" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: fgetc ( %ecx ) ------- #
		# pushing clobbers
		push %ecx
		# Calling function fgetc
		push %ecx
		call fgetc
		mov %al, __TEMP8_0__
		add $4, %esp
		# popping clobbers
		pop %ecx
		# clobbering "__TEMP8_0__"
		#//------- line: create curChar <- __TEMP8_0__ ------- #
		# creating variable "curChar" of type "u8:borrowed" stack?=true
		# Loading local variable "curChar" @-5(%ebp) with "__TEMP8_0__"
		# optimized move from __TEMP8_0__ to -5(%ebp)
		xor %edx, %edx
		# setting register "d" to "__TEMP8_0__"
		xor %edx, %edx
		movb __TEMP8_0__, %dl
		mov %dl, -5(%ebp)
		__LABEL0__:
		#//------- line: curChar != ch ------- #
		# note, read STACK VAR curChar -> -5(%ebp)
		# note, read PARAM ch -> 8(%ebp)
		mov -5(%ebp), %al
		mov 8(%ebp), %dl
		mov $0, %cl
		cmp %dl, %al
		setne %cl
		#//------- line: curChar != -1 ------- #
		# note, read STACK VAR curChar -> -5(%ebp)
		mov -5(%ebp), %al
		movb $0, __TEMP8_0__
		cmp $-1, %al
		setne __TEMP8_0__
		#//------- line: ( %cl ) && ( __TEMP8_0__ ) ------- #
		# AND comparison
		movb $0, __TEMP8_1__
		cmpb $1, %cl
		jne __LABEL2__
		cmpb $1, __TEMP8_0__
		sete __TEMP8_1__
		__LABEL2__:
		#//------- line: while ( __TEMP8_1__ ) ------- #
		# comparison for WHILE loop
		cmpb $1, __TEMP8_1__
		jne __LABEL1__
		#//------- line: { ; ------- #
		# {
			#//------- line: outString + curChar ------- #
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
			#//------- line: outString <- %ecx ------- #
			# SETTING outString <- %ecx
			# requesting ownership for outString (set). 
			lea -4(%ebp), %eax
			push %eax
			push %ecx
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: this . fptr ------- #
			# Reading property "fptr" in "__this__"
			movl __this__, %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			#//------- line: fgetc ( %ecx ) ------- #
			# pushing clobbers
			push %ecx
			# Calling function fgetc
			push %ecx
			call fgetc
			mov %al, __TEMP8_0__
			add $4, %esp
			# popping clobbers
			pop %ecx
			# clobbering "__TEMP8_0__"
			#//------- line: curChar <- __TEMP8_0__ ------- #
			# SETTING curChar <- __TEMP8_0__
			# optimized move from __TEMP8_0__ to -5(%ebp)
			xor %edx, %edx
			# setting register "d" to "__TEMP8_0__"
			xor %edx, %edx
			movb __TEMP8_0__, %dl
			mov %dl, -5(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL0__
		__LABEL1__:
		#//------- line: return outString ------- #
		#//------- line: outString ------- #
		# note, read STACK VAR outString -> -4(%ebp)
		# optimized move from -4(%ebp) to __gc_dontClear__
		# setting register "d" to "-4(%ebp)"
		mov -4(%ebp), %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "-4(%ebp)"
		mov -4(%ebp), %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
		# note, read STACK VAR outString -> -4(%ebp)
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
# outString: 4
# curChar: 5
	#//------- line: . getLine method <  > -> string ------- #
__method_iofile_getLine_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_iofile_getLine___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: 10 ------- #
		#//------- line: this . getTo ( 10 ) ------- #
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
		# clobbering "c"
		popl __this__
		#//------- line: return ( %ecx ) ------- #
		# optimized move from %ecx to __gc_dontClear__
		mov %ecx, __gc_dontClear__
		# setting register "a" to "%ecx"
		mov %ecx, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: shl ------- #
	#//------- line: string buffer ------- #
	#//------- line: . iofile operator ( shl ) < buffer > -> iofile ------- #
__operator_iofile_shl_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shl_0____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: buffer ------- #
		# note, read PARAM buffer -> 8(%ebp)
		#//------- line: this . write ( 8(%ebp) ) ------- #
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
		# clobbering "c"
		popl __this__
		#//------- line: return this ------- #
		#//------- line: __this__ ------- #
		# optimized move from __this__ to __gc_dontClear__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "__this__"
		movl __this__, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: shl ------- #
	#//------- line: u32 number ------- #
	#//------- line: . iofile operator ( shl ) < number > -> iofile ------- #
__operator_iofile_shl_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shl_1____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: number ------- #
		# note, read PARAM number -> 8(%ebp)
		#//------- line: itos ( 8(%ebp) ) ------- #
		# pushing clobbers
		# Calling function itos
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call itos
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		# clobbering "c"
		#//------- line: this . write ( %ecx ) ------- #
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
		# clobbering "s"
		popl __this__
		#//------- line: return this ------- #
		#//------- line: __this__ ------- #
		# optimized move from __this__ to __gc_dontClear__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "__this__"
		movl __this__, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: shr ------- #
	#//------- line: string : reference buffer ------- #
	#//------- line: . iofile operator ( shr ) < buffer > -> iofile ------- #
__operator_iofile_shr_2__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shr_2____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . getLine (  ) ------- #
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
		# clobbering "c"
		popl __this__
		#//------- line: buffer <- %ecx ------- #
		# SETTING buffer <- %ecx
		# requesting ownership for buffer (set). Note, using MOV since reference
		mov 8(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: return this ------- #
		#//------- line: __this__ ------- #
		# optimized move from __this__ to __gc_dontClear__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "__this__"
		movl __this__, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: shr ------- #
	#//------- line: u32 : reference outnum ------- #
	#//------- line: . iofile operator ( shr ) < outnum > -> iofile ------- #
__operator_iofile_shr_3__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shr_3____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . getLine (  ) ------- #
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
		# clobbering "c"
		popl __this__
		#//------- line: create joe <- %ecx ------- #
		# creating variable "joe" of type "string:dynamic" stack?=true
		# Loading local variable "joe" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		# requesting ownership for joe (create)
		lea -4(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: joe ------- #
		# note, read STACK VAR joe -> -4(%ebp)
		#//------- line: atoi ( -4(%ebp) ) ------- #
		# pushing clobbers
		# Calling function atoi
		# TODO optimize if variable just do movl
		mov -4(%ebp), %edx
		push %edx
		call atoi
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		# clobbering "c"
		#//------- line: outnum <- %ecx ------- #
		# SETTING outnum <- %ecx
		# Setting pointer %ecx -> 8(%ebp)
		mov 8(%ebp), %eax
		movl %ecx, (%eax)
		

		#//------- line: return this ------- #
		#//------- line: __this__ ------- #
		# optimized move from __this__ to __gc_dontClear__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "__this__"
		movl __this__, %eax
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
# joe: 4
	#//------- line: shr ------- #
	#//------- line: char : reference outch ------- #
	#//------- line: . iofile operator ( shr ) < outch > -> iofile ------- #
__operator_iofile_shr_4__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_iofile_shr_4____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: 0 ------- #
		#//------- line: this . getLine (  ) [ 0 ] ------- #
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
		# clobbering "c"
		popl __this__
		# indexing array
		mov %ecx, %eax
		movw $0, __TEMP8_0__
		mov 0(%eax), %dl
		mov %edx, __TEMP8_0__
		#//------- line: char : ( __TEMP8_0__ ) ------- #
		# optimized move from __TEMP8_0__ to __TEMP8_1__
		xor %edx, %edx
		# setting register "d" to "__TEMP8_0__"
		xor %edx, %edx
		movb __TEMP8_0__, %dl
		mov %dl, __TEMP8_1__
		#//------- line: outch <- __TEMP8_1__ ------- #
		# SETTING outch <- __TEMP8_1__
		# Setting pointer __TEMP8_1__ -> 8(%ebp)
		mov 8(%ebp), %eax
		mov __TEMP8_1__, %dl
		movb %dl, (%eax)
		

		#//------- line: return this ------- #
		#//------- line: __this__ ------- #
		# optimized move from __this__ to __gc_dontClear__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "__this__"
		movl __this__, %eax
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
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: "test.txt" ------- #
	#//------- line: iofile ( __STRING2__ ) ------- #
	# pushing clobbers
	# Calling function __constructor_iofile_1_
	pushl $__STRING2__
	call __constructor_iofile_1_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
	#//------- line: create myFile <- %ecx ------- #
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
	#//------- line: myFile . isOpen (  ) == 0 ------- #
	# note, read STACK VAR myFile -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_iofile_isOpen_
	call __method_iofile_isOpen_
	mov %al, %cl
	# popping clobbers
	# clobbering "c"
	movb $0, __TEMP8_0__
	cmp $0, %cl
	sete __TEMP8_0__
	#//------- line: if ( __TEMP8_0__ ) ------- #
	cmpb $1, __TEMP8_0__ # comparison for "if" statement
	jne __LABEL3__
	#//------- line: { ; ------- #
	# {
		#//------- line: "Could not open file!" ------- #
		#//------- line: print_ ( __STRING3__ ) ------- #
		# pushing multi-line clobbers
		pushl $__STRING3__
		call puts
		add $4, %esp
		# popping multi-line clobbers
		#//------- line: 1 ------- #
		#//------- line: quit ( 1 ) ------- #
		# pushing clobbers
		# Calling function quit
		pushl $1
		call quit
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		# clobbering "c"
		#//------- line: } ------- #
	# }
jmp __LABEL4__
__LABEL3__:
	__LABEL4__:
	#//------- line: myFile << "Rio is the best dog!\n" << 123 << "\nC\nHello " ------- #
	# note, read STACK VAR myFile -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __operator_iofile_shl_0__
	# converting conststr to string (function call)
	pushl $__STRING4__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call __operator_iofile_shl_0__
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# clobbering "c"
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
	# clobbering "s"
	# optimized move from %esi to __this__
	mov %esi, __this__
	# pushing clobbers
	push %esi
	push %ecx
	# Calling function __operator_iofile_shl_0__
	# converting conststr to string (function call)
	pushl $__STRING5__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call __operator_iofile_shl_0__
	mov %eax, %edi
	add $4, %esp
	# popping clobbers
	pop %ecx
	pop %esi
	# clobbering "i"
	#//------- line: myFile << 456789 << " Bye!" ------- #
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
	# clobbering "c"
	# optimized move from %ecx to __this__
	mov %ecx, __this__
	# pushing clobbers
	push %ecx
	# Calling function __operator_iofile_shl_0__
	# converting conststr to string (function call)
	pushl $__STRING6__
	call cptos
	mov %eax, (%esp) # str is alr in stack just overwrite
	call __operator_iofile_shl_0__
	mov %eax, %esi
	add $4, %esp
	# popping clobbers
	pop %ecx
	# clobbering "s"
	#//------- line: myFile . rewind (  ) ------- #
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
	# clobbering "c"
	#//------- line: create string output ------- #
	# creating variable "output" of type "string:dynamic" stack?=true
	# Loading local variable "output" @-8(%ebp) with "0"
	# optimized move from 0 to -8(%ebp)
	movl $0, -8(%ebp)
	#//------- line: create u32 onum ------- #
	# creating variable "onum" of type "u32:borrowed" stack?=true
	# Loading local variable "onum" @-12(%ebp) with "0"
	# optimized move from 0 to -12(%ebp)
	movl $0, -12(%ebp)
	#//------- line: create char och ------- #
	# creating variable "och" of type "u8:borrowed" stack?=true
	# Loading local variable "och" @-13(%ebp) with "0"
	# optimized move from 0 to -13(%ebp)
	movb $0, -13(%ebp)
	#//------- line: myFile >> output >> onum ------- #
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
	# clobbering "c"
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
	# clobbering "s"
	#//------- line: myFile >> och ------- #
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
	# clobbering "c"
	#//------- line: `Read 1: ${output}` ------- #
	pushw __disable_gc__; movw $1, __disable_gc__
	#//------- line: output ------- #
	# note, read STACK VAR output -> -8(%ebp)
	#//------- line: -8(%ebp) ------- #
	#//------- line: "Read 1: " ------- #
	#//------- line: "" ------- #
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	push -8(%ebp)
	# setting register "d" to "__STRING7__"
	movl $__STRING7__, %edx
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
	#//------- line: `Read 2: ${onum}` ------- #
	pushw __disable_gc__; movw $1, __disable_gc__
	#//------- line: onum ------- #
	# note, read STACK VAR onum -> -12(%ebp)
	#//------- line: -12(%ebp) ------- #
	#//------- line: "Read 2: " ------- #
	#//------- line: "" ------- #
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	push -12(%ebp)
	call itos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING8__"
	movl $__STRING8__, %edx
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
	#//------- line: `Read 3: ${och}` ------- #
	pushw __disable_gc__; movw $1, __disable_gc__
	#//------- line: och ------- #
	# note, read STACK VAR och -> -13(%ebp)
	#//------- line: -13(%ebp) ------- #
	#//------- line: "Read 3: " ------- #
	#//------- line: "" ------- #
	# setting register "d" to "__STRING1__"
	movl $__STRING1__, %edx
	push %edx
	push -13(%ebp)
	call ctos
	add $4, %esp
	push %eax
	# setting register "d" to "__STRING9__"
	movl $__STRING9__, %edx
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
	#//------- line: myFile . getLine (  ) ------- #
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
	# clobbering "c"
	#//------- line: print_ ( %ecx ) ------- #
	# pushing multi-line clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line: myFile . close (  ) ------- #
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
	# clobbering "c"
	#//------- line: return 0 ------- #
	#//------- line: 0 ------- #
	# setting register "a" to "0"
	mov $0, %eax
	# auto-return OK for entry function
push %eax
call __rc_free_all__
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# myFile: 4
# output: 8
# onum: 12
# och: 13

