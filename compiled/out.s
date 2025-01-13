
/*
********HAM PRIME**********
Compiled with love on Sun Jan 12 2025 17:59:19 GMT-0800 (Pacific Standard Time)
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
.type	__constructor_Linked_0_, @function
.global __constructor_Linked_0_
__ALLOCFOR___constructor_Linked_0___ = 0
.type	__method_Linked_findLast_, @function
.global __method_Linked_findLast_
__ALLOCFOR___method_Linked_findLast___ = 4
.type	__method_Linked_find_, @function
.global __method_Linked_find_
__ALLOCFOR___method_Linked_find___ = 8
.type	__method_Linked_index_, @function
.global __method_Linked_index_
__ALLOCFOR___method_Linked_index___ = 4
.type	__method_Linked_add_, @function
.global __method_Linked_add_
__ALLOCFOR___method_Linked_add___ = 8
.type	__method_Linked_remove_, @function
.global __method_Linked_remove_
.4byte 7
__STRING0__: .asciz "Index "
.4byte 17
__STRING1__: .asciz " does not exist!"
.4byte 18
__STRING2__: .asciz " is out of range!"
__ALLOCFOR___method_Linked_remove___ = 4
.type	__method_Linked_replace_, @function
.global __method_Linked_replace_
__ALLOCFOR___method_Linked_replace___ = 4
.type	__method_Linked_toString_, @function
.global __method_Linked_toString_
.4byte 2
__STRING3__: .asciz "["
.4byte 3
__STRING4__: .asciz "->"
.4byte 2
__STRING5__: .asciz "]"
__ALLOCFOR___method_Linked_toString___ = 8
__SIZEOF_Linked__ = 8
# format "Linked" includes:
#   - PROPERTY (u32) current
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_Linked_0_ (1 parameters)
.type	entry, @function
.global entry
.4byte 46
__STRING6__: .asciz "There should be an error below this...\n---> "
__ALLOCFOR_entry__ = 4
__TEMP8_0__: .1byte 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line:  ------- #
#//------- line:  ------- #
#//------- line:  ------- #
#//------- line:  ------- #
#//------- line:  ------- #
#//------- line: Linked format ------- #
#//------- line: { ; ------- #
# {
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
	#//------- line: . current u32 ------- #
	#//------- line: . next Linked ------- #
	#//------- line:  ------- #
	#//------- line: u32 value ------- #
	#//------- line: . Linked constructor < value > ------- #
__constructor_Linked_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Linked_0___, %esp # total stack allocation

call __rc_enterChunk__
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_Linked__"
	mov $__SIZEOF_Linked__, %edx
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
	#//------- line: { ; ------- #
	# {
		#//------- line: value ------- #
		# note, read PARAM value -> 8(%ebp)
		#//------- line: this . current <- 8(%ebp) ------- #
		# Reading property "current" in "__this__"
		movl __this__, %eax
		# optimized move from 8(%ebp) to 0(%eax)
		# setting register "d" to "8(%ebp)"
		mov 8(%ebp), %edx
		mov %edx, 0(%eax)
		#//------- line: 0 ------- #
		#//------- line: this . next <- 0 ------- #
		# Reading property "next" in "__this__"
		movl __this__, %eax
		# optimized move from 0 to 4(%eax)
		movl $0, 4(%eax)
		#//------- line: } ------- #
	# }
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
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: . findLast method <  > -> Linked : borrowed ------- #
__method_Linked_findLast_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_findLast___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this ------- #
		#//------- line: create node <- __this__ ------- #
		# creating variable "node" of type "Linked:dynamic" stack?=true
		# Loading local variable "node" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		__LABEL0__:
		#//------- line: node . next != 0 ------- #
		# note, read STACK VAR node -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from 4(%eax) to %ecx
		# setting register "d" to "4(%eax)"
		mov 4(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		setne __TEMP8_0__
		#//------- line: while ( __TEMP8_0__ ) ------- #
		# comparison for WHILE loop
		cmpb $1, __TEMP8_0__
		jne __LABEL1__
		#//------- line: { ; ------- #
		# {
			#//------- line: borrow node . next ------- #
			# note, read STACK VAR node -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: node <- %ecx ------- #
			# SETTING node <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL0__
		__LABEL1__:
		#//------- line:  ------- #
		#//------- line: return node ------- #
		#//------- line: node ------- #
		# note, read STACK VAR node -> -4(%ebp)
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
		# note, read STACK VAR node -> -4(%ebp)
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
# node: 4
	#//------- line:  ------- #
	#//------- line: u32 index ------- #
	#//------- line: . find method < index > -> Linked : borrowed ------- #
__method_Linked_find_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_find___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this ------- #
		#//------- line: create node <- __this__ ------- #
		# creating variable "node" of type "Linked:dynamic" stack?=true
		# Loading local variable "node" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		#//------- line: 0 ------- #
		#//------- line: create i <- 0 ------- #
		# creating variable "i" of type "u32:borrowed" stack?=true
		# Loading local variable "i" @-8(%ebp) with "0"
		# optimized move from 0 to -8(%ebp)
		movl $0, -8(%ebp)
		#//------- line:  ------- #
		__LABEL2__:
		#//------- line: i <: index ------- #
		# note, read STACK VAR i -> -8(%ebp)
		# note, read PARAM index -> 8(%ebp)
		mov -8(%ebp), %eax
		mov 8(%ebp), %edx
		mov $0, %cl
		cmp %edx, %eax
		setl %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL3__
		#//------- line: { ; ------- #
		# {
			#//------- line: node . next == 0 ------- #
			# note, read STACK VAR node -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			movb $0, __TEMP8_0__
			cmp $0, %ecx
			sete __TEMP8_0__
			#//------- line: if ( __TEMP8_0__ ) ------- #
			cmpb $1, __TEMP8_0__ # comparison for "if" statement
			jne __LABEL4__
			#//------- line: { ; ------- #
			# {
				#//------- line: return null ------- #
				#//------- line: null ------- #
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
jmp __LABEL5__
__LABEL4__:
			__LABEL5__:
			#//------- line: borrow node . next ------- #
			# note, read STACK VAR node -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: node <- %ecx ------- #
			# SETTING node <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: i + 1 ------- #
			# note, read STACK VAR i -> -8(%ebp)
			mov -8(%ebp), %eax
			add $1, %eax
			mov %eax, %ecx
			#//------- line: i <- %ecx ------- #
			# SETTING i <- %ecx
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL2__
		__LABEL3__:
		#//------- line: return node ------- #
		#//------- line: node ------- #
		# note, read STACK VAR node -> -4(%ebp)
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
		# note, read STACK VAR node -> -4(%ebp)
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
# node: 4
# i: 8
	#//------- line:  ------- #
	#//------- line: u32 index ------- #
	#//------- line: . index method < index > -> u32 ------- #
__method_Linked_index_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_index___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line: index ------- #
		# note, read PARAM index -> 8(%ebp)
		#//------- line: this . find ( 8(%ebp) ) ------- #
		pushl __this__
		# optimized move from __this__ to __this__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_Linked_find_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __method_Linked_find_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: create ref <- %ecx ------- #
		# creating variable "ref" of type "__Linked__staticdef__:borrowed" stack?=true
		# Loading local variable "ref" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: ref . current ------- #
		# note, read STACK VAR ref -> -4(%ebp)
		# Reading property "current" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: return ( %ecx ) ------- #
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
# ref: 4
	#//------- line:  ------- #
	#//------- line: u32 value ------- #
	#//------- line: . add method < value > -> u32 ------- #
__method_Linked_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_add___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line:  ------- #
		#//------- line: this . findLast (  ) ------- #
		pushl __this__
		# optimized move from __this__ to __this__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_Linked_findLast_
		call __method_Linked_findLast_
		mov %eax, %ecx
		# popping clobbers
		popl __this__
		#//------- line: create end <- %ecx ------- #
		# creating variable "end" of type "__Linked__staticdef__:borrowed" stack?=true
		# Loading local variable "end" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line:  ------- #
		#//------- line: value ------- #
		# note, read PARAM value -> 8(%ebp)
		#//------- line: Linked ( 8(%ebp) ) ------- #
		pushl __this__
		# pushing clobbers
		# Calling function __constructor_Linked_0_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __constructor_Linked_0_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: create newAddr <- %ecx ------- #
		# creating variable "newAddr" of type "Linked:dynamic" stack?=true
		# Loading local variable "newAddr" @-8(%ebp) with "%ecx"
		# optimized move from %ecx to -8(%ebp)
		mov %ecx, -8(%ebp)
		# requesting ownership for newAddr (create)
		lea -8(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: newAddr ------- #
		# note, read STACK VAR newAddr -> -8(%ebp)
		#//------- line: end . next <- -8(%ebp) ------- #
		# note, read STACK VAR end -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from -8(%ebp) to 4(%eax)
		# setting register "d" to "-8(%ebp)"
		mov -8(%ebp), %edx
		mov %edx, 4(%eax)
		# requesting ownership for -4(%ebp) (property)
		lea 4(%eax), %eax
		push %eax
		push -8(%ebp)
		call __rc_requestOwnership__
		add $8, %esp
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
# end: 4
# newAddr: 8
	#//------- line:  ------- #
	#//------- line: u32 index ------- #
	#//------- line: . remove method < index > -> u32 ------- #
__method_Linked_remove_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_remove___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line: index <: 1 ------- #
		# note, read PARAM index -> 8(%ebp)
		mov 8(%ebp), %eax
		mov $0, %cl
		cmp $1, %eax
		setl %cl
		#//------- line: if ( %cl ) ------- #
		cmpb $1, %cl # comparison for "if" statement
		jne __LABEL6__
		#//------- line: { ; ------- #
		# {
			#//------- line: this . next ------- #
			# Reading property "next" in "__this__"
			movl __this__, %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: this <- %ecx ------- #
			# SETTING __this__ <- %ecx
			# requesting ownership for __this__ (set). 
			lea __this__, %eax
			push %eax
			push %ecx
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: } ------- #
		# }
jmp __LABEL7__
__LABEL6__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			#//------- line: index - 1 ------- #
			# note, read PARAM index -> 8(%ebp)
			mov 8(%ebp), %eax
			sub $1, %eax
			mov %eax, %ecx
			#//------- line: this . find ( %ecx ) ------- #
			pushl __this__
			# optimized move from __this__ to __this__
			# setting register "d" to "__this__"
			movl __this__, %edx
			mov %edx, __this__
			# pushing clobbers
			push %ecx
			# Calling function __method_Linked_find_
			push %ecx
			call __method_Linked_find_
			mov %eax, %esi
			add $4, %esp
			# popping clobbers
			pop %ecx
			popl __this__
			#//------- line: create previous <- %esi ------- #
			# creating variable "previous" of type "__Linked__staticdef__:borrowed" stack?=true
			# Loading local variable "previous" @-4(%ebp) with "%esi"
			# optimized move from %esi to -4(%ebp)
			mov %esi, -4(%ebp)
			#//------- line:  ------- #
			#//------- line: previous == 0 ------- #
			# note, read STACK VAR previous -> -4(%ebp)
			mov -4(%ebp), %eax
			mov $0, %cl
			cmp $0, %eax
			sete %cl
			#//------- line: if ( %cl ) ------- #
			cmpb $1, %cl # comparison for "if" statement
			jne __LABEL9__
			#//------- line: { ; ------- #
			# {
				#//------- line: `Index ${index} does not exist!` ------- #
				pushw __disable_gc__; movw $1, __disable_gc__
				#//------- line: index ------- #
				# note, read PARAM index -> 8(%ebp)
				#//------- line: "Index " ------- #
				#//------- line: " does not exist!" ------- #
				# setting register "d" to "__STRING1__"
				movl $__STRING1__, %edx
				push %edx
				push 8(%ebp)
				call itos
				add $4, %esp
				push %eax
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
jmp __LABEL10__
__LABEL9__:
			#//------- line: previous . next == 0 ------- #
			# note, read STACK VAR previous -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			movb $0, __TEMP8_0__
			cmp $0, %ecx
			sete __TEMP8_0__
			#//------- line: elif ( __TEMP8_0__ ) ------- #
cmpb $1, __TEMP8_0__ # comparison for "elif" statement
jne __LABEL11__
			#//------- line: { ; ------- #
			# {
				#//------- line: `Index ${index} is out of range!` ------- #
				pushw __disable_gc__; movw $1, __disable_gc__
				#//------- line: index ------- #
				# note, read PARAM index -> 8(%ebp)
				#//------- line: "Index " ------- #
				#//------- line: " is out of range!" ------- #
				# setting register "d" to "__STRING2__"
				movl $__STRING2__, %edx
				push %edx
				push 8(%ebp)
				call itos
				add $4, %esp
				push %eax
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
				#//------- line: } ------- #
			# }
jmp __LABEL10__
__LABEL11__:
			#//------- line: else ------- #
			#//------- line: { ; ------- #
			# {
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line:  ------- #
				#//------- line: previous . next . next ------- #
				# note, read STACK VAR previous -> -4(%ebp)
				# Reading property "next" in "-4(%ebp)"
				movl -4(%ebp), %eax
				# optimized move from 4(%eax) to %ecx
				# setting register "d" to "4(%eax)"
				mov 4(%eax), %edx
				mov %edx, %ecx
				# Reading property "next" in "%ecx"
				# optimized move from 4(%ecx) to %esi
				# setting register "d" to "4(%ecx)"
				mov 4(%ecx), %edx
				mov %edx, %esi
				#//------- line: previous . next <- %esi ------- #
				# note, read STACK VAR previous -> -4(%ebp)
				# Reading property "next" in "-4(%ebp)"
				movl -4(%ebp), %eax
				# optimized move from %esi to 4(%eax)
				mov %esi, 4(%eax)
				# requesting ownership for -4(%ebp) (property)
				lea 4(%eax), %eax
				push %eax
				push %esi
				call __rc_requestOwnership__
				add $8, %esp
				#//------- line: } ------- #
			# }
jmp __LABEL10__
__LABEL12__:
			__LABEL10__:
			#//------- line: } ------- #
		# }
jmp __LABEL7__
__LABEL8__:
		__LABEL7__:
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
	#//------- line:  ------- #
	#//------- line: u32 index , u32 value ------- #
	#//------- line: . replace method < index,,,value > -> u32 ------- #
__method_Linked_replace_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_replace___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line: index ------- #
		# note, read PARAM index -> 8(%ebp)
		#//------- line: this . find ( 8(%ebp) ) ------- #
		pushl __this__
		# optimized move from __this__ to __this__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_Linked_find_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __method_Linked_find_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: create node <- %ecx ------- #
		# creating variable "node" of type "__Linked__staticdef__:borrowed" stack?=true
		# Loading local variable "node" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: value ------- #
		# note, read PARAM value -> 12(%ebp)
		#//------- line: node . current <- 12(%ebp) ------- #
		# note, read STACK VAR node -> -4(%ebp)
		# Reading property "current" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from 12(%ebp) to 0(%eax)
		# setting register "d" to "12(%ebp)"
		mov 12(%ebp), %edx
		mov %edx, 0(%eax)
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
# node: 4
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: . toString method <  > -> string ------- #
__method_Linked_toString_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Linked_toString___, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this ------- #
		#//------- line: create node <- __this__ ------- #
		# creating variable "node" of type "Linked:dynamic" stack?=true
		# Loading local variable "node" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		#//------- line: "[" ------- #
		#//------- line: create build <- __STRING3__ ------- #
		# creating variable "build" of type "conststr:borrowed" stack?=true
		# converting conststr "__STRING3__" to dynamic string
		pushl $__STRING3__
		call cptos
		add $4, %esp
		mov %eax, %ecx
		# Loading local variable "build" @-8(%ebp) with "%ecx"
		# optimized move from %ecx to -8(%ebp)
		mov %ecx, -8(%ebp)
		# requesting ownership for build (create)
		lea -8(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		__LABEL13__:
		#//------- line: node . next != 0 ------- #
		# note, read STACK VAR node -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from 4(%eax) to %ecx
		# setting register "d" to "4(%eax)"
		mov 4(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		setne __TEMP8_0__
		#//------- line: while ( __TEMP8_0__ ) ------- #
		# comparison for WHILE loop
		cmpb $1, __TEMP8_0__
		jne __LABEL14__
		#//------- line: { ; ------- #
		# {
			#//------- line:  ------- #
			#//------- line: build + node . current + "->" ------- #
			# note, read STACK VAR build -> -8(%ebp)
			# note, read STACK VAR node -> -4(%ebp)
			# Reading property "current" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			pushw __disable_gc__; movw $1, __disable_gc__
			# setting register "d" to "__STRING4__"
			movl $__STRING4__, %edx
			push %edx
			push %ecx
			call itos
			add $4, %esp
			push %eax
			push -8(%ebp)
			pushl $3
			call strjoinmany
			add $16, %esp
			mov %eax, %esi
			popw __disable_gc__
			#//------- line: build <- %esi ------- #
			# SETTING build <- %esi
			# requesting ownership for build (set). 
			lea -8(%ebp), %eax
			push %eax
			push %esi
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line:  ------- #
			#//------- line: borrow node . next ------- #
			# note, read STACK VAR node -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: node <- %ecx ------- #
			# SETTING node <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL13__
		__LABEL14__:
		#//------- line:  ------- #
		#//------- line: build + node . current + "]" ------- #
		# note, read STACK VAR build -> -8(%ebp)
		# note, read STACK VAR node -> -4(%ebp)
		# Reading property "current" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		pushw __disable_gc__; movw $1, __disable_gc__
		# setting register "d" to "__STRING5__"
		movl $__STRING5__, %edx
		push %edx
		push %ecx
		call itos
		add $4, %esp
		push %eax
		push -8(%ebp)
		pushl $3
		call strjoinmany
		add $16, %esp
		mov %eax, %esi
		popw __disable_gc__
		#//------- line: build <- %esi ------- #
		# SETTING build <- %esi
		# requesting ownership for build (set). 
		lea -8(%ebp), %eax
		push %eax
		push %esi
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line:  ------- #
		#//------- line: return build ------- #
		#//------- line: build ------- #
		# note, read STACK VAR build -> -8(%ebp)
		# optimized move from -8(%ebp) to __gc_dontClear__
		# setting register "d" to "-8(%ebp)"
		mov -8(%ebp), %edx
		mov %edx, __gc_dontClear__
		# setting register "a" to "-8(%ebp)"
		mov -8(%ebp), %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
		# note, read STACK VAR build -> -8(%ebp)
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
# node: 4
# build: 8
	#//------- line: } ------- #
# }
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

call __rc_enterChunk__
	#//------- line: 1 ------- #
	#//------- line: Linked ( 1 ) ------- #
	# pushing clobbers
	# Calling function __constructor_Linked_0_
	pushl $1
	call __constructor_Linked_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create myList <- %ecx ------- #
	# creating variable "myList" of type "Linked:dynamic" stack?=true
	# Loading local variable "myList" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for myList (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line: 2 ------- #
	#//------- line: myList . add ( 2 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_add_
	pushl $2
	call __method_Linked_add_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: 3 ------- #
	#//------- line: myList . add ( 3 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_add_
	pushl $3
	call __method_Linked_add_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: myList ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	#//------- line: print_ ( -4(%ebp) ) ------- #
	# pushing multi-line clobbers
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_toString_
	call __method_Linked_toString_
	mov %eax, %ecx
	# popping clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line:  ------- #
	#//------- line: 0 ------- #
	#//------- line: myList . remove ( 0 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_remove_
	pushl $0
	call __method_Linked_remove_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# Loading into __this__ because function modified it 
	# optimized move from __this__ to -4(%ebp)
	# setting register "d" to "__this__"
	movl __this__, %edx
	mov %edx, -4(%ebp)
	#//------- line: 5 ------- #
	#//------- line: myList . add ( 5 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_add_
	pushl $5
	call __method_Linked_add_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: 2 , 4 ------- #
	#//------- line: myList . replace ( 2,,,4 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_replace_
	pushl $4
	pushl $2
	call __method_Linked_replace_
	mov %eax, %ecx
	add $8, %esp
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: myList ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	#//------- line: print_ ( -4(%ebp) ) ------- #
	# pushing multi-line clobbers
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_toString_
	call __method_Linked_toString_
	mov %eax, %ecx
	# popping clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line:  ------- #
	#//------- line: 1 ------- #
	#//------- line: myList . remove ( 1 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_remove_
	pushl $1
	call __method_Linked_remove_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# Loading into __this__ because function modified it 
	# optimized move from __this__ to -4(%ebp)
	# setting register "d" to "__this__"
	movl __this__, %edx
	mov %edx, -4(%ebp)
	#//------- line: 8 ------- #
	#//------- line: myList . add ( 8 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_add_
	pushl $8
	call __method_Linked_add_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: 16 ------- #
	#//------- line: myList . add ( 16 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_add_
	pushl $16
	call __method_Linked_add_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: 32 ------- #
	#//------- line: myList . add ( 32 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_add_
	pushl $32
	call __method_Linked_add_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: 4 ------- #
	#//------- line: myList . remove ( 4 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_remove_
	pushl $4
	call __method_Linked_remove_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# Loading into __this__ because function modified it 
	# optimized move from __this__ to -4(%ebp)
	# setting register "d" to "__this__"
	movl __this__, %edx
	mov %edx, -4(%ebp)
	#//------- line:  ------- #
	#//------- line: myList ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	#//------- line: print_ ( -4(%ebp) ) ------- #
	# pushing multi-line clobbers
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_toString_
	call __method_Linked_toString_
	mov %eax, %ecx
	# popping clobbers
	push %ecx
	call puts
	add $4, %esp
	# popping multi-line clobbers
	#//------- line:  ------- #
	#//------- line: "There should be an error below this...\n---> " ------- #
	#//------- line: printf ( __STRING6__ ) ------- #
	# pushing clobbers
	# Calling function printf
	pushl $__STRING6__
	call printf
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: 10 ------- #
	#//------- line: myList . remove ( 10 ) ------- #
	# note, read STACK VAR myList -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Linked_remove_
	pushl $10
	call __method_Linked_remove_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	# Loading into __this__ because function modified it 
	# optimized move from __this__ to -4(%ebp)
	# setting register "d" to "__this__"
	movl __this__, %edx
	mov %edx, -4(%ebp)
	#//------- line:  ------- #
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
# myList: 4

