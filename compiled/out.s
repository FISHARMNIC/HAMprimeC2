
/*
********HAM PRIME**********
<<<<<<< HEAD
Compiled with love on Sat Jan 25 2025 20:11:43 GMT-0700 (Mountain Standard Time)
=======
Compiled with love on Sat Jan 25 2025 20:12:27 GMT-0700 (Mountain Standard Time)
>>>>>>> c67818b4379b9c13424657f2895f27c380b1f104
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
.type	__constructor_StaticLLNode_0_, @function
.global __constructor_StaticLLNode_0_
__ALLOCFOR___constructor_StaticLLNode_0___ = 0
__SIZEOF_StaticLLNode__ = 8
# format "StaticLLNode" includes:
#   - PROPERTY (u32) value
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_StaticLLNode_0_ (1 parameters)
.type	__constructor_StaticLL_0_, @function
.global __constructor_StaticLL_0_
__ALLOCFOR___constructor_StaticLL_0___ = 0
.type	__method_StaticLL_empty_, @function
.global __method_StaticLL_empty_
__ALLOCFOR___method_StaticLL_empty___ = 0
.type	__method_StaticLL_push_, @function
.global __method_StaticLL_push_
__ALLOCFOR___method_StaticLL_push___ = 4
.type	__method_StaticLL_pushFront_, @function
.global __method_StaticLL_pushFront_
__ALLOCFOR___method_StaticLL_pushFront___ = 4
.type	__method_StaticLL_pop_, @function
.global __method_StaticLL_pop_
.4byte 37
__STRING0__: .asciz "[LL ERROR] Cannot pop, list is empty"
__ALLOCFOR___method_StaticLL_pop___ = 12
.type	__method_StaticLL_popFront_, @function
.global __method_StaticLL_popFront_
__ALLOCFOR___method_StaticLL_popFront___ = 4
.type	__method_StaticLL_get_, @function
.global __method_StaticLL_get_
.4byte 30
__STRING1__: .asciz "[LL ERROR] Index out of range"
__ALLOCFOR___method_StaticLL_get___ = 8
.type	__method_StaticLL_set_, @function
.global __method_StaticLL_set_
__ALLOCFOR___method_StaticLL_set___ = 8
.type	__operator_StaticLL_index_get_0__, @function
.global __operator_StaticLL_index_get_0__
__ALLOCFOR___operator_StaticLL_index_get_0____ = 0
.type	__operator_StaticLL_index_set_1__, @function
.global __operator_StaticLL_index_set_1__
__ALLOCFOR___operator_StaticLL_index_set_1____ = 0
.type	__method_StaticLL_forEach_, @function
.global __method_StaticLL_forEach_
__ALLOCFOR___method_StaticLL_forEach___ = 8
.type	__method_StaticLL_delete_, @function
.global __method_StaticLL_delete_
__ALLOCFOR___method_StaticLL_delete___ = 12
__SIZEOF_StaticLL__ = 12
# format "StaticLL" includes:
#   - PROPERTY (p0) start
#   - PROPERTY (p0) end
#   - PROPERTY (p0) secondLast
#   - CNSTRCTR __constructor_StaticLL_0_ (0 parameters)
.type	__constructor_StaticQueue_0_, @function
.global __constructor_StaticQueue_0_
__ALLOCFOR___constructor_StaticQueue_0___ = 0
.type	__method_StaticQueue_empty_, @function
.global __method_StaticQueue_empty_
__ALLOCFOR___method_StaticQueue_empty___ = 0
.type	__method_StaticQueue_push_, @function
.global __method_StaticQueue_push_
__ALLOCFOR___method_StaticQueue_push___ = 0
.type	__method_StaticQueue_pop_, @function
.global __method_StaticQueue_pop_
__ALLOCFOR___method_StaticQueue_pop___ = 0
__SIZEOF_StaticQueue__ = 4
# format "StaticQueue" includes:
#   - PROPERTY (p0) queue
#   - CNSTRCTR __constructor_StaticQueue_0_ (0 parameters)
__SIZEOF_LLGraphNode__ = 8
# format "LLGraphNode" includes:
#   - PROPERTY (p0) node
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_LLGraphNode_0_ (1 parameters)
#   - CNSTRCTR __constructor_LLGraphNode_1_ (1 parameters)
.type	__constructor_GraphNode_0_, @function
.global __constructor_GraphNode_0_
__ALLOCFOR___constructor_GraphNode_0___ = 0
.type	__method_GraphNode_addConnection_, @function
.global __method_GraphNode_addConnection_
__ALLOCFOR___method_GraphNode_addConnection___ = 0
.type	__method_GraphNode_addTwoWayConnection_, @function
.global __method_GraphNode_addTwoWayConnection_
__ALLOCFOR___method_GraphNode_addTwoWayConnection___ = 0
__SIZEOF_GraphNode__ = 16
# format "GraphNode" includes:
#   - PROPERTY (u32) distance
#   - PROPERTY (u32) visited
#   - PROPERTY (p0) connections
#   - PROPERTY (u32) value
#   - CNSTRCTR __constructor_GraphNode_0_ (1 parameters)
.type	__constructor_LLGraphNode_0_, @function
.global __constructor_LLGraphNode_0_
__ALLOCFOR___constructor_LLGraphNode_0___ = 0
.type	__constructor_LLGraphNode_1_, @function
.global __constructor_LLGraphNode_1_
__ALLOCFOR___constructor_LLGraphNode_1___ = 0
.type	__operator_LLGraphNode_index_get_2__, @function
.global __operator_LLGraphNode_index_get_2__
.4byte 20
__STRING2__: .asciz "Fatal error: Index "
.4byte 17
__STRING3__: .asciz " does not exist!"
__ALLOCFOR___operator_LLGraphNode_index_get_2____ = 8
.type	__method_LLGraphNode_findLast_, @function
.global __method_LLGraphNode_findLast_
.4byte 7
__STRING4__: .asciz "Error!"
__ALLOCFOR___method_LLGraphNode_findLast___ = 4
.type	__method_LLGraphNode_add_, @function
.global __method_LLGraphNode_add_
__ALLOCFOR___method_LLGraphNode_add___ = 4
.type	__method_LLGraphNode_add_brwd_, @function
.global __method_LLGraphNode_add_brwd_
__ALLOCFOR___method_LLGraphNode_add_brwd___ = 4
.type	__method_LLGraphNode_printAll_, @function
.global __method_LLGraphNode_printAll_
.4byte 5
__STRING5__: .asciz "%p\n"
__ALLOCFOR___method_LLGraphNode_printAll___ = 4
__SIZEOF_LLGraphNode__ = 8
# format "LLGraphNode" includes:
#   - PROPERTY (p0) node
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_LLGraphNode_0_ (1 parameters)
#   - CNSTRCTR __constructor_LLGraphNode_1_ (1 parameters)
.type	__constructor_Graph_0_, @function
.global __constructor_Graph_0_
__ALLOCFOR___constructor_Graph_0___ = 0
.type	__method_Graph_addNode_, @function
.global __method_Graph_addNode_
__ALLOCFOR___method_Graph_addNode___ = 0
.type	__method_Graph_bft_, @function
.global __method_Graph_bft_
__ALLOCFOR___method_Graph_bft___ = 12
.type	__method_Graph_dft_, @function
.global __method_Graph_dft_
.4byte 10
__STRING6__: .asciz "reading: "
.4byte 1
__STRING7__: .asciz ""
__ALLOCFOR___method_Graph_dft___ = 4
__SIZEOF_Graph__ = 4
# format "Graph" includes:
#   - PROPERTY (p0) allNodes
#   - CNSTRCTR __constructor_Graph_0_ (0 parameters)
.type	testDFT, @function
.global testDFT
__ALLOCFOR_testDFT__ = 32
.type	testBFT, @function
.global testBFT
__ALLOCFOR_testBFT__ = 28
.type	entry, @function
.global entry
.4byte 3
__STRING8__: .asciz "\n"
__ALLOCFOR_entry__ = 4
__TEMP8_0__: .1byte 0
###################################
.text

#### compiler initation section ###
__init_for_out__:

#//------- line:  ------- #
#//------- line:  ------- #
#//------- line:  ------- #
#//------- line: StaticLLNode format ------- #
#//------- line: { ; ------- #
# {
#//------- line: StaticLL format ------- #
#//------- line: { ; ------- #
# {
#//------- line: StaticQueue format ------- #
#//------- line: { ; ------- #
# {
#//------- line: forward GraphNode format ------- #
#//------- line:  ------- #
#//------- line: LLGraphNode format ------- #
#//------- line: { ; ------- #
# {
#//------- line: GraphNode format ------- #
#//------- line: { ; ------- #
# {
#//------- line: LLGraphNode format ------- #
#//------- line: { ; ------- #
# {
#//------- line: Graph format ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
#//------- line: testDFT function <  > ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
#//------- line: testBFT function <  > ------- #
#//------- line: { ; ------- #
# {
#//------- line:  ------- #
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
	#//------- line: . value any ------- #
	#//------- line: . next StaticLLNode ------- #
	#//------- line: any value ------- #
	#//------- line: . StaticLLNode constructor < value > ------- #
__constructor_StaticLLNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_StaticLLNode_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_StaticLLNode__"
	mov $__SIZEOF_StaticLLNode__, %edx
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
		#//------- line: this . value <- 8(%ebp) ------- #
		# Reading property "value" in "__this__"
		movl __this__, %eax
		# optimized move from 8(%ebp) to 0(%eax)
		# setting register "d" to "8(%ebp)"
		mov 8(%ebp), %edx
		mov %edx, 0(%eax)
		#//------- line: 0 ------- #
		#//------- line: StaticLLNode : ( 0 ) ------- #
		# setting register "c" to "0"
		mov $0, %ecx
		#//------- line: this . next <- %ecx ------- #
		# Reading property "next" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
		# requesting ownership for __this__ (property)
		lea 4(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
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
	#//------- line: } ------- #
# }
	#//------- line: . start StaticLLNode ------- #
	#//------- line: . end StaticLLNode : borrowed ------- #
	#//------- line: . secondLast StaticLLNode : borrowed ------- #
	#//------- line:  ------- #
	#//------- line: . StaticLL constructor <  > ------- #
__constructor_StaticLL_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_StaticLL_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_StaticLL__"
	mov $__SIZEOF_StaticLL__, %edx
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
		#//------- line: 0 ------- #
		#//------- line: StaticLLNode : ( 0 ) ------- #
		# setting register "c" to "0"
		mov $0, %ecx
		#//------- line: this . start <- %ecx ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 0(%eax)
		mov %ecx, 0(%eax)
		# requesting ownership for __this__ (property)
		lea 0(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: 0 ------- #
		#//------- line: borrow StaticLLNode : ( 0 ) ------- #
		# setting register "c" to "0"
		mov $0, %ecx
		#//------- line: this . end <- %ecx ------- #
		# Reading property "end" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
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
	#//------- line: . empty method <  > -> u32 ------- #
__method_StaticLL_empty_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_empty___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line:  ------- #
		#//------- line: this . start == 0 ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		sete __TEMP8_0__
		#//------- line: if ( __TEMP8_0__ ) ------- #
		cmpb $1, __TEMP8_0__ # comparison for "if" statement
		jne __LABEL0__
		#//------- line: { ; ------- #
		# {
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
jmp __LABEL1__
__LABEL0__:
		__LABEL1__:
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
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
	#//------- line: any value ------- #
	#//------- line: . push method < value > ------- #
__method_StaticLL_push_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_push___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . start == 0 ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		sete __TEMP8_0__
		#//------- line: if ( __TEMP8_0__ ) ------- #
		cmpb $1, __TEMP8_0__ # comparison for "if" statement
		jne __LABEL2__
		#//------- line: { ; ------- #
		# {
			#//------- line: value ------- #
			# note, read PARAM value -> 8(%ebp)
			#//------- line: StaticLLNode ( 8(%ebp) ) ------- #
			pushl __this__
			# pushing clobbers
			# Calling function __constructor_StaticLLNode_0_
			# TODO optimize if variable just do movl
			mov 8(%ebp), %edx
			push %edx
			call __constructor_StaticLLNode_0_
			mov %eax, %ecx
			add $4, %esp
			# popping clobbers
			popl __this__
			#//------- line: this . start <- %ecx ------- #
			# Reading property "start" in "__this__"
			movl __this__, %eax
			# optimized move from %ecx to 0(%eax)
			mov %ecx, 0(%eax)
			# requesting ownership for __this__ (property)
			lea 0(%eax), %eax
			push %eax
			push %ecx
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: borrow this . start ------- #
			# Reading property "start" in "__this__"
			movl __this__, %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			#//------- line: this . end <- %ecx ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from %ecx to 4(%eax)
			mov %ecx, 4(%eax)
			#//------- line: } ------- #
		# }
jmp __LABEL3__
__LABEL2__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			#//------- line: value ------- #
			# note, read PARAM value -> 8(%ebp)
			#//------- line: StaticLLNode ( 8(%ebp) ) ------- #
			pushl __this__
			# pushing clobbers
			# Calling function __constructor_StaticLLNode_0_
			# TODO optimize if variable just do movl
			mov 8(%ebp), %edx
			push %edx
			call __constructor_StaticLLNode_0_
			mov %eax, %ecx
			add $4, %esp
			# popping clobbers
			popl __this__
			#//------- line: create newEnd <- %ecx ------- #
			# creating variable "newEnd" of type "StaticLLNode:dynamic" stack?=true
			# Loading local variable "newEnd" @-4(%ebp) with "%ecx"
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			# requesting ownership for newEnd (create)
			lea -4(%ebp), %eax
			push %eax
			push %ecx
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: this . end ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: this . secondLast <- %ecx ------- #
			# Reading property "secondLast" in "__this__"
			movl __this__, %eax
			# optimized move from %ecx to 8(%eax)
			mov %ecx, 8(%eax)
			#//------- line: newEnd ------- #
			# note, read STACK VAR newEnd -> -4(%ebp)
			#//------- line: this . end . next <- -4(%ebp) ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			# Reading property "next" in "%ecx"
			# optimized move from -4(%ebp) to 4(%ecx)
			# setting register "d" to "-4(%ebp)"
			mov -4(%ebp), %edx
			mov %edx, 4(%ecx)
			# requesting ownership for %ecx (property)
			lea 4(%ecx), %eax
			push %eax
			push -4(%ebp)
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: borrow newEnd ------- #
			# note, read STACK VAR newEnd -> -4(%ebp)
			#//------- line: this . end <- -4(%ebp) ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from -4(%ebp) to 4(%eax)
			# setting register "d" to "-4(%ebp)"
			mov -4(%ebp), %edx
			mov %edx, 4(%eax)
			#//------- line: } ------- #
		# }
jmp __LABEL3__
__LABEL4__:
		__LABEL3__:
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
	#//------- line: any value ------- #
	#//------- line: . pushFront method < value > ------- #
__method_StaticLL_pushFront_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_pushFront___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: value ------- #
		# note, read PARAM value -> 8(%ebp)
		#//------- line: StaticLLNode ( 8(%ebp) ) ------- #
		pushl __this__
		# pushing clobbers
		# Calling function __constructor_StaticLLNode_0_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __constructor_StaticLLNode_0_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: create newNode <- %ecx ------- #
		# creating variable "newNode" of type "StaticLLNode:dynamic" stack?=true
		# Loading local variable "newNode" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		# requesting ownership for newNode (create)
		lea -4(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: this . start ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: newNode . next <- %ecx ------- #
		# note, read STACK VAR newNode -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
		# requesting ownership for -4(%ebp) (property)
		lea 4(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: this . end == 0 ------- #
		# Reading property "end" in "__this__"
		movl __this__, %eax
		# optimized move from 4(%eax) to %ecx
		# setting register "d" to "4(%eax)"
		mov 4(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		sete __TEMP8_0__
		#//------- line: if ( __TEMP8_0__ ) ------- #
		cmpb $1, __TEMP8_0__ # comparison for "if" statement
		jne __LABEL5__
		#//------- line: { ; ------- #
		# {
			#//------- line: borrow newNode ------- #
			# note, read STACK VAR newNode -> -4(%ebp)
			#//------- line: this . end <- -4(%ebp) ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from -4(%ebp) to 4(%eax)
			# setting register "d" to "-4(%ebp)"
			mov -4(%ebp), %edx
			mov %edx, 4(%eax)
			#//------- line: } ------- #
		# }
jmp __LABEL6__
__LABEL5__:
		__LABEL6__:
		#//------- line: newNode ------- #
		# note, read STACK VAR newNode -> -4(%ebp)
		#//------- line: this . start <- -4(%ebp) ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from -4(%ebp) to 0(%eax)
		# setting register "d" to "-4(%ebp)"
		mov -4(%ebp), %edx
		mov %edx, 0(%eax)
		# requesting ownership for __this__ (property)
		lea 0(%eax), %eax
		push %eax
		push -4(%ebp)
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
# newNode: 4
	#//------- line:  ------- #
	#//------- line: . pop method <  > -> unknown ------- #
__method_StaticLL_pop_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_pop___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this . start ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: create walker <- %ecx ------- #
		# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: walker == 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		sete %cl
		#//------- line: if ( %cl ) ------- #
		cmpb $1, %cl # comparison for "if" statement
		jne __LABEL7__
		#//------- line: { ; ------- #
		# {
			#//------- line: `[LL ERROR] Cannot pop, list is empty` ------- #
			pushw __disable_gc__; movw $1, __disable_gc__
			#//------- line: "[LL ERROR] Cannot pop, list is empty" ------- #
			# setting register "d" to "__STRING0__"
			movl $__STRING0__, %edx
			push %edx
			pushl $1
			call strjoinmany
			add $8, %esp
			mov %eax, %ecx
			popw __disable_gc__
			#//------- line: print_ ( %ecx ) ------- #
			# pushing multi-line clobbers
			push %ecx
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
			#//------- line: } ------- #
		# }
jmp __LABEL8__
__LABEL7__:
		__LABEL8__:
		#//------- line: walker . next == 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
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
		jne __LABEL9__
		#//------- line: { ; ------- #
		# {
			#//------- line: walker . value ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "value" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			#//------- line: create rval <- %ecx ------- #
			# creating variable "rval" of type "u32:borrowed" stack?=true
			# Loading local variable "rval" @-8(%ebp) with "%ecx"
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
			#//------- line: 0 ------- #
			#//------- line: this . start <- 0 ------- #
			# Reading property "start" in "__this__"
			movl __this__, %eax
			# optimized move from 0 to 0(%eax)
			movl $0, 0(%eax)
			#//------- line: 0 ------- #
			#//------- line: this . end <- 0 ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from 0 to 4(%eax)
			movl $0, 4(%eax)
			#//------- line: return rval ------- #
			#//------- line: rval ------- #
			# note, read STACK VAR rval -> -8(%ebp)
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
			# note, read STACK VAR rval -> -8(%ebp)
			#//------- line: } ------- #
		# }
jmp __LABEL10__
__LABEL9__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			__LABEL12__:
			#//------- line: walker . next . next != 0 ------- #
			# note, read STACK VAR walker -> -4(%ebp)
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
			movb $0, __TEMP8_0__
			cmp $0, %esi
			setne __TEMP8_0__
			#//------- line: while ( __TEMP8_0__ ) ------- #
			# comparison for WHILE loop
			cmpb $1, __TEMP8_0__
			jne __LABEL13__
			#//------- line: { ; ------- #
			# {
				#//------- line: borrow walker . next ------- #
				# note, read STACK VAR walker -> -4(%ebp)
				# Reading property "next" in "-4(%ebp)"
				movl -4(%ebp), %eax
				# optimized move from 4(%eax) to %ecx
				# setting register "d" to "4(%eax)"
				mov 4(%eax), %edx
				mov %edx, %ecx
				#//------- line: walker <- %ecx ------- #
				# SETTING walker <- %ecx
				# optimized move from %ecx to -4(%ebp)
				mov %ecx, -4(%ebp)
				#//------- line: } ------- #
			# }
			jmp __LABEL12__
			__LABEL13__:
			#//------- line: walker . next . value ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			# Reading property "value" in "%ecx"
			# optimized move from 0(%ecx) to %esi
			# setting register "d" to "0(%ecx)"
			mov 0(%ecx), %edx
			mov %edx, %esi
			#//------- line: create rval <- %esi ------- #
			# creating variable "rval" of type "u32:borrowed" stack?=true
			# Loading local variable "rval" @-12(%ebp) with "%esi"
			# optimized move from %esi to -12(%ebp)
			mov %esi, -12(%ebp)
			#//------- line: 0 ------- #
			#//------- line: walker . next <- 0 ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 0 to 4(%eax)
			movl $0, 4(%eax)
			#//------- line: walker ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			#//------- line: this . end <- -4(%ebp) ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from -4(%ebp) to 4(%eax)
			# setting register "d" to "-4(%ebp)"
			mov -4(%ebp), %edx
			mov %edx, 4(%eax)
			#//------- line: return rval ------- #
			#//------- line: rval ------- #
			# note, read STACK VAR rval -> -12(%ebp)
			# setting register "a" to "-12(%ebp)"
			mov -12(%ebp), %eax
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax

mov %ebp, %esp
pop %ebp
ret
			# note, read STACK VAR rval -> -12(%ebp)
			#//------- line: } ------- #
		# }
jmp __LABEL10__
__LABEL11__:
		__LABEL10__:
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
# walker: 4
	#//------- line:  ------- #
	#//------- line: . popFront method <  > -> unknown ------- #
__method_StaticLL_popFront_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_popFront___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . start ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: create rval <- %ecx ------- #
		# creating variable "rval" of type "StaticLLNode:dynamic" stack?=true
		# Loading local variable "rval" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		# requesting ownership for rval (create)
		lea -4(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: rval == 0 ------- #
		# note, read STACK VAR rval -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		sete %cl
		#//------- line: if ( %cl ) ------- #
		cmpb $1, %cl # comparison for "if" statement
		jne __LABEL14__
		#//------- line: { ; ------- #
		# {
			#//------- line: `[LL ERROR] Cannot pop, list is empty` ------- #
			pushw __disable_gc__; movw $1, __disable_gc__
			#//------- line: "[LL ERROR] Cannot pop, list is empty" ------- #
			# setting register "d" to "__STRING0__"
			movl $__STRING0__, %edx
			push %edx
			pushl $1
			call strjoinmany
			add $8, %esp
			mov %eax, %ecx
			popw __disable_gc__
			#//------- line: print_ ( %ecx ) ------- #
			# pushing multi-line clobbers
			push %ecx
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
			#//------- line: } ------- #
		# }
jmp __LABEL15__
__LABEL14__:
		__LABEL15__:
		#//------- line: rval == this . end ------- #
		# note, read STACK VAR rval -> -4(%ebp)
		# Reading property "end" in "__this__"
		movl __this__, %eax
		# optimized move from 4(%eax) to %ecx
		# setting register "d" to "4(%eax)"
		mov 4(%eax), %edx
		mov %edx, %ecx
		mov -4(%ebp), %eax
		movb $0, __TEMP8_0__
		cmp %ecx, %eax
		sete __TEMP8_0__
		#//------- line: if ( __TEMP8_0__ ) ------- #
		cmpb $1, __TEMP8_0__ # comparison for "if" statement
		jne __LABEL16__
		#//------- line: { ; ------- #
		# {
			#//------- line: 0 ------- #
			#//------- line: this . end <- 0 ------- #
			# Reading property "end" in "__this__"
			movl __this__, %eax
			# optimized move from 0 to 4(%eax)
			movl $0, 4(%eax)
			#//------- line: } ------- #
		# }
jmp __LABEL17__
__LABEL16__:
		__LABEL17__:
		#//------- line:  ------- #
		#//------- line: rval . next ------- #
		# note, read STACK VAR rval -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from 4(%eax) to %ecx
		# setting register "d" to "4(%eax)"
		mov 4(%eax), %edx
		mov %edx, %ecx
		#//------- line: this . start <- %ecx ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 0(%eax)
		mov %ecx, 0(%eax)
		# requesting ownership for __this__ (property)
		lea 0(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: rval . value ------- #
		# note, read STACK VAR rval -> -4(%ebp)
		# Reading property "value" in "-4(%ebp)"
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
# rval: 4
	#//------- line: u32 index ------- #
	#//------- line: . get method < index > -> unknown ------- #
__method_StaticLL_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_get___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this . start ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: create walker <- %ecx ------- #
		# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: 0 ------- #
		#//------- line: create i <- 0 ------- #
		# creating variable "i" of type "u32:borrowed" stack?=true
		# Loading local variable "i" @-8(%ebp) with "0"
		# optimized move from 0 to -8(%ebp)
		movl $0, -8(%ebp)
		__LABEL18__:
		#//------- line: walker != 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setne %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL19__
		#//------- line: { ; ------- #
		# {
			#//------- line: i == index ------- #
			# note, read STACK VAR i -> -8(%ebp)
			# note, read PARAM index -> 8(%ebp)
			mov -8(%ebp), %eax
			mov 8(%ebp), %edx
			mov $0, %cl
			cmp %edx, %eax
			sete %cl
			#//------- line: if ( %cl ) ------- #
			cmpb $1, %cl # comparison for "if" statement
			jne __LABEL20__
			#//------- line: { ; ------- #
			# {
				#//------- line: walker . value ------- #
				# note, read STACK VAR walker -> -4(%ebp)
				# Reading property "value" in "-4(%ebp)"
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
jmp __LABEL21__
__LABEL20__:
			__LABEL21__:
			#//------- line: i + 1 ------- #
			# note, read STACK VAR i -> -8(%ebp)
			mov -8(%ebp), %eax
			add $1, %eax
			mov %eax, %ecx
			#//------- line: i <- %ecx ------- #
			# SETTING i <- %ecx
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL18__
		__LABEL19__:
		#//------- line: `[LL ERROR] Index out of range` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: "[LL ERROR] Index out of range" ------- #
		# setting register "d" to "__STRING1__"
		movl $__STRING1__, %edx
		push %edx
		pushl $1
		call strjoinmany
		add $8, %esp
		mov %eax, %ecx
		popw __disable_gc__
		#//------- line: print_ ( %ecx ) ------- #
		# pushing multi-line clobbers
		push %ecx
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
# walker: 4
# i: 8
	#//------- line: u32 index , any value ------- #
	#//------- line: . set method < index,,,value > ------- #
__method_StaticLL_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_set___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this . start ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: create walker <- %ecx ------- #
		# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: 0 ------- #
		#//------- line: create i <- 0 ------- #
		# creating variable "i" of type "u32:borrowed" stack?=true
		# Loading local variable "i" @-8(%ebp) with "0"
		# optimized move from 0 to -8(%ebp)
		movl $0, -8(%ebp)
		__LABEL22__:
		#//------- line: walker != 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setne %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL23__
		#//------- line: { ; ------- #
		# {
			#//------- line: i == index ------- #
			# note, read STACK VAR i -> -8(%ebp)
			# note, read PARAM index -> 8(%ebp)
			mov -8(%ebp), %eax
			mov 8(%ebp), %edx
			mov $0, %cl
			cmp %edx, %eax
			sete %cl
			#//------- line: if ( %cl ) ------- #
			cmpb $1, %cl # comparison for "if" statement
			jne __LABEL24__
			#//------- line: { ; ------- #
			# {
				#//------- line: value ------- #
				# note, read PARAM value -> 12(%ebp)
				#//------- line: walker . value <- 12(%ebp) ------- #
				# note, read STACK VAR walker -> -4(%ebp)
				# Reading property "value" in "-4(%ebp)"
				movl -4(%ebp), %eax
				# optimized move from 12(%ebp) to 0(%eax)
				# setting register "d" to "12(%ebp)"
				mov 12(%ebp), %edx
				mov %edx, 0(%eax)
				#//------- line: return ------- #
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
jmp __LABEL25__
__LABEL24__:
			__LABEL25__:
			#//------- line: i + 1 ------- #
			# note, read STACK VAR i -> -8(%ebp)
			mov -8(%ebp), %eax
			add $1, %eax
			mov %eax, %ecx
			#//------- line: i <- %ecx ------- #
			# SETTING i <- %ecx
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL22__
		__LABEL23__:
		#//------- line: `[LL ERROR] Index out of range` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: "[LL ERROR] Index out of range" ------- #
		# setting register "d" to "__STRING1__"
		movl $__STRING1__, %edx
		push %edx
		pushl $1
		call strjoinmany
		add $8, %esp
		mov %eax, %ecx
		popw __disable_gc__
		#//------- line: print_ ( %ecx ) ------- #
		# pushing multi-line clobbers
		push %ecx
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
# walker: 4
# i: 8
	#//------- line: index_get ------- #
	#//------- line: u32 index ------- #
	#//------- line: . StaticLL operator ( index_get ) < index > -> unknown ------- #
__operator_StaticLL_index_get_0__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_StaticLL_index_get_0____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: index ------- #
		# note, read PARAM index -> 8(%ebp)
		#//------- line: this . get ( 8(%ebp) ) ------- #
		pushl __this__
		# optimized move from __this__ to __this__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_StaticLL_get_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __method_StaticLL_get_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
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
	#//------- line: index_set ------- #
	#//------- line: u32 index , any value ------- #
	#//------- line: . StaticLL operator ( index_set ) < index,,,value > ------- #
__operator_StaticLL_index_set_1__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_StaticLL_index_set_1____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: index , value ------- #
		# note, read PARAM index -> 8(%ebp)
		# note, read PARAM value -> 12(%ebp)
		#//------- line: this . set ( 8(%ebp),,,12(%ebp) ) ------- #
		pushl __this__
		# optimized move from __this__ to __this__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_StaticLL_set_
		# TODO optimize if variable just do movl
		mov 12(%ebp), %edx
		push %edx
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __method_StaticLL_set_
		mov %eax, %ecx
		add $8, %esp
		# popping clobbers
		popl __this__
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
	#//------- line: fn func ------- #
	#//------- line: . forEach method < func > ------- #
__method_StaticLL_forEach_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_forEach___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this . start ------- #
		# Reading property "start" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		#//------- line: create walker <- %ecx ------- #
		# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: 0 ------- #
		#//------- line: create i <- 0 ------- #
		# creating variable "i" of type "u32:borrowed" stack?=true
		# Loading local variable "i" @-8(%ebp) with "0"
		# optimized move from 0 to -8(%ebp)
		movl $0, -8(%ebp)
		__LABEL26__:
		#//------- line: walker != 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setne %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL27__
		#//------- line: { ; ------- #
		# {
			#//------- line: walker . value , i ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "value" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			# note, read STACK VAR i -> -8(%ebp)
			#//------- line: func ( %ecx,,,-8(%ebp) ) ------- #
			# note, read PARAM func -> 8(%ebp)
			# pushing clobbers
			push %ecx
			# Calling function __not_a_function__
			# TODO optimize if variable just do movl
			mov -8(%ebp), %edx
			push %edx
			push %ecx
			call *8(%ebp)
			mov %eax, %esi
			add $8, %esp
			# popping clobbers
			pop %ecx
			#//------- line: i + 1 ------- #
			# note, read STACK VAR i -> -8(%ebp)
			mov -8(%ebp), %eax
			add $1, %eax
			mov %eax, %ecx
			#//------- line: i <- %ecx ------- #
			# SETTING i <- %ecx
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL26__
		__LABEL27__:
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
# walker: 4
# i: 8
	#//------- line: u32 index ------- #
	#//------- line: . delete method < index > ------- #
__method_StaticLL_delete_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticLL_delete___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: index <= 0 ------- #
		# note, read PARAM index -> 8(%ebp)
		mov 8(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setle %cl
		#//------- line: if ( %cl ) ------- #
		cmpb $1, %cl # comparison for "if" statement
		jne __LABEL28__
		#//------- line: { ; ------- #
		# {
			#//------- line: this . start . next ------- #
			# Reading property "start" in "__this__"
			movl __this__, %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			# Reading property "next" in "%ecx"
			# optimized move from 4(%ecx) to %esi
			# setting register "d" to "4(%ecx)"
			mov 4(%ecx), %edx
			mov %edx, %esi
			#//------- line: this . start <- %esi ------- #
			# Reading property "start" in "__this__"
			movl __this__, %eax
			# optimized move from %esi to 0(%eax)
			mov %esi, 0(%eax)
			# requesting ownership for __this__ (property)
			lea 0(%eax), %eax
			push %eax
			push %esi
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: } ------- #
		# }
jmp __LABEL29__
__LABEL28__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			#//------- line: borrow this . start ------- #
			# Reading property "start" in "__this__"
			movl __this__, %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			#//------- line: create walker <- %ecx ------- #
			# creating variable "walker" of type "StaticLLNode:dynamic" stack?=true
			# Loading local variable "walker" @-4(%ebp) with "%ecx"
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: 0 ------- #
			#//------- line: create i <- 0 ------- #
			# creating variable "i" of type "u32:borrowed" stack?=true
			# Loading local variable "i" @-8(%ebp) with "0"
			# optimized move from 0 to -8(%ebp)
			movl $0, -8(%ebp)
			#//------- line: index - 1 ------- #
			# note, read PARAM index -> 8(%ebp)
			mov 8(%ebp), %eax
			sub $1, %eax
			mov %eax, %ecx
			#//------- line: index <- %ecx ------- #
			# SETTING index <- %ecx
			# optimized move from %ecx to 8(%ebp)
			mov %ecx, 8(%ebp)
			#//------- line: create next ------- #
			# creating variable "next" of type "u32:borrowed" stack?=true
			# Loading local variable "next" @-12(%ebp) with "0"
			# optimized move from 0 to -12(%ebp)
			movl $0, -12(%ebp)
			__LABEL31__:
			#//------- line: walker != 0 ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			mov -4(%ebp), %eax
			mov $0, %cl
			cmp $0, %eax
			setne %cl
			#//------- line: while ( %cl ) ------- #
			# comparison for WHILE loop
			cmpb $1, %cl
			jne __LABEL32__
			#//------- line: { ; ------- #
			# {
				#//------- line: borrow walker . next ------- #
				# note, read STACK VAR walker -> -4(%ebp)
				# Reading property "next" in "-4(%ebp)"
				movl -4(%ebp), %eax
				# optimized move from 4(%eax) to %ecx
				# setting register "d" to "4(%eax)"
				mov 4(%eax), %edx
				mov %edx, %ecx
				#//------- line: next <- %ecx ------- #
				# SETTING next <- %ecx
				# optimized move from %ecx to -12(%ebp)
				mov %ecx, -12(%ebp)
				#//------- line: i == index ------- #
				# note, read STACK VAR i -> -8(%ebp)
				# note, read PARAM index -> 8(%ebp)
				mov -8(%ebp), %eax
				mov 8(%ebp), %edx
				mov $0, %cl
				cmp %edx, %eax
				sete %cl
				#//------- line: if ( %cl ) ------- #
				cmpb $1, %cl # comparison for "if" statement
				jne __LABEL33__
				#//------- line: { ; ------- #
				# {
					#//------- line: next == this . end ------- #
					# note, read STACK VAR next -> -12(%ebp)
					# Reading property "end" in "__this__"
					movl __this__, %eax
					# optimized move from 4(%eax) to %ecx
					# setting register "d" to "4(%eax)"
					mov 4(%eax), %edx
					mov %edx, %ecx
					mov -12(%ebp), %eax
					movb $0, __TEMP8_0__
					cmp %ecx, %eax
					sete __TEMP8_0__
					#//------- line: if ( __TEMP8_0__ ) ------- #
					cmpb $1, __TEMP8_0__ # comparison for "if" statement
					jne __LABEL35__
					#//------- line: { ; ------- #
					# {
						#//------- line: walker ------- #
						# note, read STACK VAR walker -> -4(%ebp)
						#//------- line: this . end <- -4(%ebp) ------- #
						# Reading property "end" in "__this__"
						movl __this__, %eax
						# optimized move from -4(%ebp) to 4(%eax)
						# setting register "d" to "-4(%ebp)"
						mov -4(%ebp), %edx
						mov %edx, 4(%eax)
						#//------- line: } ------- #
					# }
jmp __LABEL36__
__LABEL35__:
					__LABEL36__:
					#//------- line: walker . next . next ------- #
					# note, read STACK VAR walker -> -4(%ebp)
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
					#//------- line: walker . next <- %esi ------- #
					# note, read STACK VAR walker -> -4(%ebp)
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
					#//------- line: return ------- #
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
jmp __LABEL34__
__LABEL33__:
				__LABEL34__:
				#//------- line: i + 1 ------- #
				# note, read STACK VAR i -> -8(%ebp)
				mov -8(%ebp), %eax
				add $1, %eax
				mov %eax, %ecx
				#//------- line: i <- %ecx ------- #
				# SETTING i <- %ecx
				# optimized move from %ecx to -8(%ebp)
				mov %ecx, -8(%ebp)
				#//------- line: borrow next ------- #
				# note, read STACK VAR next -> -12(%ebp)
				#//------- line: walker <- -12(%ebp) ------- #
				# SETTING walker <- -12(%ebp)
				# optimized move from -12(%ebp) to -4(%ebp)
				# setting register "d" to "-12(%ebp)"
				mov -12(%ebp), %edx
				mov %edx, -4(%ebp)
				#//------- line: } ------- #
			# }
			jmp __LABEL31__
			__LABEL32__:
			#//------- line: `[LL ERROR] Index out of range` ------- #
			pushw __disable_gc__; movw $1, __disable_gc__
			#//------- line: "[LL ERROR] Index out of range" ------- #
			# setting register "d" to "__STRING1__"
			movl $__STRING1__, %edx
			push %edx
			pushl $1
			call strjoinmany
			add $8, %esp
			mov %eax, %ecx
			popw __disable_gc__
			#//------- line: print_ ( %ecx ) ------- #
			# pushing multi-line clobbers
			push %ecx
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
			#//------- line: } ------- #
		# }
jmp __LABEL29__
__LABEL30__:
		__LABEL29__:
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
	#//------- line: } ------- #
# }
	#//------- line: . queue StaticLL ------- #
	#//------- line:  ------- #
	#//------- line: . StaticQueue constructor <  > ------- #
__constructor_StaticQueue_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_StaticQueue_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_StaticQueue__"
	mov $__SIZEOF_StaticQueue__, %edx
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
		#//------- line:  ------- #
		#//------- line: StaticLL (  ) ------- #
		pushl __this__
		# pushing clobbers
		# Calling function __constructor_StaticLL_0_
		call __constructor_StaticLL_0_
		mov %eax, %ecx
		# popping clobbers
		popl __this__
		#//------- line: this . queue <- %ecx ------- #
		# Reading property "queue" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 0(%eax)
		mov %ecx, 0(%eax)
		# requesting ownership for __this__ (property)
		lea 0(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
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
	#//------- line: . empty method <  > -> u32 ------- #
__method_StaticQueue_empty_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticQueue_empty___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line:  ------- #
		#//------- line: this . queue . empty (  ) ------- #
		# Reading property "queue" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		pushl __this__
		# optimized move from %ecx to __this__
		mov %ecx, __this__
		# pushing clobbers
		push %ecx
		# Calling function __method_StaticLL_empty_
		call __method_StaticLL_empty_
		mov %eax, %esi
		# popping clobbers
		pop %ecx
		popl __this__
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
	#//------- line: any item ------- #
	#//------- line: . push method < item > ------- #
__method_StaticQueue_push_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticQueue_push___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: item ------- #
		# note, read PARAM item -> 8(%ebp)
		#//------- line: this . queue . push ( 8(%ebp) ) ------- #
		# Reading property "queue" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		pushl __this__
		# optimized move from %ecx to __this__
		mov %ecx, __this__
		# pushing clobbers
		push %ecx
		# Calling function __method_StaticLL_push_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __method_StaticLL_push_
		mov %eax, %esi
		add $4, %esp
		# popping clobbers
		pop %ecx
		popl __this__
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
	#//------- line: . pop method <  > -> unknown ------- #
__method_StaticQueue_pop_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_StaticQueue_pop___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line:  ------- #
		#//------- line: this . queue . popFront (  ) ------- #
		# Reading property "queue" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		pushl __this__
		# optimized move from %ecx to __this__
		mov %ecx, __this__
		# pushing clobbers
		push %ecx
		# Calling function __method_StaticLL_popFront_
		call __method_StaticLL_popFront_
		mov %eax, %esi
		# popping clobbers
		pop %ecx
		popl __this__
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
	#//------- line: } ------- #
# }
	#//------- line: . node GraphNode ------- #
	#//------- line: . next LLGraphNode ------- #
	#//------- line: GraphNode node ------- #
	#//------- line: forward . LLGraphNode constructor < node > ------- #
	#//------- line: GraphNode : borrowed node ------- #
	#//------- line: forward . LLGraphNode constructor < node > ------- #
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: forward . findLast method <  > -> LLGraphNode : borrowed ------- #
	#//------- line: GraphNode node ------- #
	#//------- line: forward . add method < node > -> LLGraphNode : borrowed ------- #
	#//------- line: GraphNode : borrowed node ------- #
	#//------- line: forward . add_brwd method < node > -> LLGraphNode : borrowed ------- #
	#//------- line: } ------- #
# }
	#//------- line: . distance u32 ------- #
	#//------- line: . visited u32 ------- #
	#//------- line: . connections LLGraphNode ------- #
	#//------- line:  ------- #
	#//------- line: . value u32 ------- #
	#//------- line: u32 v ------- #
	#//------- line: . GraphNode constructor < v > ------- #
__constructor_GraphNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_GraphNode_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_GraphNode__"
	mov $__SIZEOF_GraphNode__, %edx
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
		#//------- line: v ------- #
		# note, read PARAM v -> 8(%ebp)
		#//------- line: this . value <- 8(%ebp) ------- #
		# Reading property "value" in "__this__"
		movl __this__, %eax
		# optimized move from 8(%ebp) to 12(%eax)
		# setting register "d" to "8(%ebp)"
		mov 8(%ebp), %edx
		mov %edx, 12(%eax)
		#//------- line: 0 ------- #
		#//------- line: this . visited <- 0 ------- #
		# Reading property "visited" in "__this__"
		movl __this__, %eax
		# optimized move from 0 to 4(%eax)
		movl $0, 4(%eax)
		#//------- line: 0 ------- #
		#//------- line: LLGraphNode : ( 0 ) ------- #
		# setting register "c" to "0"
		mov $0, %ecx
		#//------- line: this . connections <- %ecx ------- #
		# Reading property "connections" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 8(%eax)
		mov %ecx, 8(%eax)
		# requesting ownership for __this__ (property)
		lea 8(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
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
	#//------- line: GraphNode node ------- #
	#//------- line: . addConnection method < node > ------- #
__method_GraphNode_addConnection_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_GraphNode_addConnection___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . connections == 0 ------- #
		# Reading property "connections" in "__this__"
		movl __this__, %eax
		# optimized move from 8(%eax) to %ecx
		# setting register "d" to "8(%eax)"
		mov 8(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		sete __TEMP8_0__
		#//------- line: if ( __TEMP8_0__ ) ------- #
		cmpb $1, __TEMP8_0__ # comparison for "if" statement
		jne __LABEL37__
		#//------- line: { ; ------- #
		# {
			#//------- line: node ------- #
			# note, read PARAM node -> 8(%ebp)
			#//------- line: GraphNode : borrowed : ( 8(%ebp) ) ------- #
			# setting register "c" to "8(%ebp)"
			mov 8(%ebp), %ecx
			#//------- line: LLGraphNode ( %ecx ) ------- #
			pushl __this__
			# pushing clobbers
			push %ecx
			# Calling function __constructor_LLGraphNode_1_
			push %ecx
			call __constructor_LLGraphNode_1_
			mov %eax, %esi
			add $4, %esp
			# popping clobbers
			pop %ecx
			popl __this__
			#//------- line: this . connections <- %esi ------- #
			# Reading property "connections" in "__this__"
			movl __this__, %eax
			# optimized move from %esi to 8(%eax)
			mov %esi, 8(%eax)
			# requesting ownership for __this__ (property)
			lea 8(%eax), %eax
			push %eax
			push %esi
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: } ------- #
		# }
jmp __LABEL38__
__LABEL37__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			#//------- line: node ------- #
			# note, read PARAM node -> 8(%ebp)
			#//------- line: GraphNode : borrowed : ( 8(%ebp) ) ------- #
			# setting register "c" to "8(%ebp)"
			mov 8(%ebp), %ecx
			#//------- line: this . connections . add_brwd ( %ecx ) ------- #
			# Reading property "connections" in "__this__"
			movl __this__, %eax
			# optimized move from 8(%eax) to %esi
			# setting register "d" to "8(%eax)"
			mov 8(%eax), %edx
			mov %edx, %esi
			pushl __this__
			# optimized move from %esi to __this__
			mov %esi, __this__
			# pushing clobbers
			push %esi
			push %ecx
			# Calling function __method_LLGraphNode_add_brwd_
			push %ecx
			call __method_LLGraphNode_add_brwd_
			mov %eax, %edi
			add $4, %esp
			# popping clobbers
			pop %ecx
			pop %esi
			popl __this__
			#//------- line: } ------- #
		# }
jmp __LABEL38__
__LABEL39__:
		__LABEL38__:
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
	#//------- line: GraphNode node ------- #
	#//------- line: . addTwoWayConnection method < node > ------- #
__method_GraphNode_addTwoWayConnection_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_GraphNode_addTwoWayConnection___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: node ------- #
		# note, read PARAM node -> 8(%ebp)
		#//------- line: this . addConnection ( 8(%ebp) ) ------- #
		pushl __this__
		# optimized move from __this__ to __this__
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_GraphNode_addConnection_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __method_GraphNode_addConnection_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: this ------- #
		#//------- line: node . addConnection ( __this__ ) ------- #
		# note, read PARAM node -> 8(%ebp)
		pushl __this__
		# optimized move from 8(%ebp) to __this__
		# setting register "d" to "8(%ebp)"
		mov 8(%ebp), %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_GraphNode_addConnection_
		# TODO optimize if variable just do movl
		mov __this__, %edx
		push %edx
		call __method_GraphNode_addConnection_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
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
	#//------- line: . node GraphNode ------- #
	#//------- line: . next LLGraphNode ------- #
	#//------- line: GraphNode : borrowed node ------- #
	#//------- line: . LLGraphNode constructor < node > ------- #
__constructor_LLGraphNode_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_LLGraphNode_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_LLGraphNode__"
	mov $__SIZEOF_LLGraphNode__, %edx
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
		#//------- line: node ------- #
		# note, read PARAM node -> 8(%ebp)
		#//------- line: this . node <- 8(%ebp) ------- #
		# Reading property "node" in "__this__"
		movl __this__, %eax
		# optimized move from 8(%ebp) to 0(%eax)
		# setting register "d" to "8(%ebp)"
		mov 8(%ebp), %edx
		mov %edx, 0(%eax)
		#//------- line: 0 ------- #
		#//------- line: LLGraphNode : ( 0 ) ------- #
		# setting register "c" to "0"
		mov $0, %ecx
		#//------- line: this . next <- %ecx ------- #
		# Reading property "next" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
		# requesting ownership for __this__ (property)
		lea 4(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
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
	#//------- line: GraphNode node ------- #
	#//------- line: . LLGraphNode constructor < node > ------- #
__constructor_LLGraphNode_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_LLGraphNode_1___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_LLGraphNode__"
	mov $__SIZEOF_LLGraphNode__, %edx
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
		#//------- line: node ------- #
		# note, read PARAM node -> 8(%ebp)
		#//------- line: this . node <- 8(%ebp) ------- #
		# Reading property "node" in "__this__"
		movl __this__, %eax
		# optimized move from 8(%ebp) to 0(%eax)
		# setting register "d" to "8(%ebp)"
		mov 8(%ebp), %edx
		mov %edx, 0(%eax)
		# requesting ownership for __this__ (property)
		lea 0(%eax), %eax
		push %eax
		push 8(%ebp)
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line: 0 ------- #
		#//------- line: LLGraphNode : ( 0 ) ------- #
		# setting register "c" to "0"
		mov $0, %ecx
		#//------- line: this . next <- %ecx ------- #
		# Reading property "next" in "__this__"
		movl __this__, %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
		# requesting ownership for __this__ (property)
		lea 4(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
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
	#//------- line: index_get ------- #
	#//------- line: u32 index ------- #
	#//------- line: . LLGraphNode operator ( index_get ) < index > -> GraphNode : borrowed ------- #
__operator_LLGraphNode_index_get_2__:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_LLGraphNode_index_get_2____, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: 0 ------- #
		#//------- line: create i <- 0 ------- #
		# creating variable "i" of type "u32:borrowed" stack?=true
		# Loading local variable "i" @-4(%ebp) with "0"
		# optimized move from 0 to -4(%ebp)
		movl $0, -4(%ebp)
		#//------- line:  ------- #
		#//------- line: borrow this ------- #
		#//------- line: create walker <- __this__ ------- #
		# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
		# Loading local variable "walker" @-8(%ebp) with "__this__"
		# optimized move from __this__ to -8(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -8(%ebp)
		__LABEL40__:
		#//------- line: walker != 0 ------- #
		# note, read STACK VAR walker -> -8(%ebp)
		mov -8(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setne %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL41__
		#//------- line: { ; ------- #
		# {
			#//------- line: i == index ------- #
			# note, read STACK VAR i -> -4(%ebp)
			# note, read PARAM index -> 8(%ebp)
			mov -4(%ebp), %eax
			mov 8(%ebp), %edx
			mov $0, %cl
			cmp %edx, %eax
			sete %cl
			#//------- line: if ( %cl ) ------- #
			cmpb $1, %cl # comparison for "if" statement
			jne __LABEL42__
			#//------- line: { ; ------- #
			# {
				#//------- line: borrow walker . node ------- #
				# note, read STACK VAR walker -> -8(%ebp)
				# Reading property "node" in "-8(%ebp)"
				movl -8(%ebp), %eax
				# optimized move from 0(%eax) to %ecx
				# setting register "d" to "0(%eax)"
				mov 0(%eax), %edx
				mov %edx, %ecx
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
jmp __LABEL43__
__LABEL42__:
			__LABEL43__:
			#//------- line:  ------- #
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -8(%ebp)
			# Reading property "next" in "-8(%ebp)"
			movl -8(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
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
		jmp __LABEL40__
		__LABEL41__:
		#//------- line: `Fatal error: Index ${index} does not exist!` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: index ------- #
		# note, read PARAM index -> 8(%ebp)
		#//------- line: "Fatal error: Index " ------- #
		#//------- line: " does not exist!" ------- #
		# setting register "d" to "__STRING3__"
		movl $__STRING3__, %edx
		push %edx
		push 8(%ebp)
		call itos
		add $4, %esp
		push %eax
		# setting register "d" to "__STRING2__"
		movl $__STRING2__, %edx
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
		#//------- line: 1 ------- #
		#//------- line: quit ( 1 ) ------- #
		# pushing clobbers
		# Calling function quit
		pushl $1
		call quit
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
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
# walker: 8
	#//------- line:  ------- #
	#//------- line: . findLast method <  > -> LLGraphNode : borrowed ------- #
__method_LLGraphNode_findLast_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_findLast___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this ------- #
		#//------- line: create walker <- __this__ ------- #
		# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		#//------- line: walker == 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		sete %cl
		#//------- line: if ( %cl ) ------- #
		cmpb $1, %cl # comparison for "if" statement
		jne __LABEL44__
		#//------- line: { ; ------- #
		# {
			#//------- line: `Error!` ------- #
			pushw __disable_gc__; movw $1, __disable_gc__
			#//------- line: "Error!" ------- #
			# setting register "d" to "__STRING4__"
			movl $__STRING4__, %edx
			push %edx
			pushl $1
			call strjoinmany
			add $8, %esp
			mov %eax, %ecx
			popw __disable_gc__
			#//------- line: print_ ( %ecx ) ------- #
			# pushing multi-line clobbers
			push %ecx
			call puts
			add $4, %esp
			# popping multi-line clobbers
			#//------- line: 0 ------- #
			#//------- line: quit ( 0 ) ------- #
			# pushing clobbers
			# Calling function quit
			pushl $0
			call quit
			mov %eax, %ecx
			add $4, %esp
			# popping clobbers
			#//------- line: } ------- #
		# }
jmp __LABEL45__
__LABEL44__:
		__LABEL45__:
		#//------- line:  ------- #
		__LABEL46__:
		#//------- line: walker . next != 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
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
		jne __LABEL47__
		#//------- line: { ; ------- #
		# {
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL46__
		__LABEL47__:
		#//------- line: return walker ------- #
		#//------- line: walker ------- #
		# note, read STACK VAR walker -> -4(%ebp)
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
		# note, read STACK VAR walker -> -4(%ebp)
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
# walker: 4
	#//------- line:  ------- #
	#//------- line: GraphNode node ------- #
	#//------- line: . add method < node > ------- #
__method_LLGraphNode_add_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_add___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
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
		# Calling function __method_LLGraphNode_findLast_
		call __method_LLGraphNode_findLast_
		mov %eax, %ecx
		# popping clobbers
		popl __this__
		#//------- line: create last <- %ecx ------- #
		# creating variable "last" of type "__LLGraphNode__staticdef__:borrowed" stack?=true
		# Loading local variable "last" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: node ------- #
		# note, read PARAM node -> 8(%ebp)
		#//------- line: LLGraphNode ( 8(%ebp) ) ------- #
		pushl __this__
		# pushing clobbers
		# Calling function __constructor_LLGraphNode_1_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __constructor_LLGraphNode_1_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: last . next <- %ecx ------- #
		# note, read STACK VAR last -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
		# requesting ownership for -4(%ebp) (property)
		lea 4(%eax), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line:  ------- #
		#//------- line:  ------- #
		#//------- line:  ------- #
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
# last: 4
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: GraphNode : borrowed node ------- #
	#//------- line: . add_brwd method < node > ------- #
__method_LLGraphNode_add_brwd_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_add_brwd___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
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
		# Calling function __method_LLGraphNode_findLast_
		call __method_LLGraphNode_findLast_
		mov %eax, %ecx
		# popping clobbers
		popl __this__
		#//------- line: create last <- %ecx ------- #
		# creating variable "last" of type "__LLGraphNode__staticdef__:borrowed" stack?=true
		# Loading local variable "last" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		#//------- line: node ------- #
		# note, read PARAM node -> 8(%ebp)
		#//------- line: LLGraphNode ( 8(%ebp) ) ------- #
		pushl __this__
		# pushing clobbers
		# Calling function __constructor_LLGraphNode_0_
		# TODO optimize if variable just do movl
		mov 8(%ebp), %edx
		push %edx
		call __constructor_LLGraphNode_0_
		mov %eax, %ecx
		add $4, %esp
		# popping clobbers
		popl __this__
		#//------- line: last . next <- %ecx ------- #
		# note, read STACK VAR last -> -4(%ebp)
		# Reading property "next" in "-4(%ebp)"
		movl -4(%ebp), %eax
		# optimized move from %ecx to 4(%eax)
		mov %ecx, 4(%eax)
		# requesting ownership for -4(%ebp) (property)
		lea 4(%eax), %eax
		push %eax
		push %ecx
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
# last: 4
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: . printAll method <  > ------- #
__method_LLGraphNode_printAll_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_LLGraphNode_printAll___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: borrow this ------- #
		#//------- line: create walker <- __this__ ------- #
		# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "__this__"
		# optimized move from __this__ to -4(%ebp)
		# setting register "d" to "__this__"
		movl __this__, %edx
		mov %edx, -4(%ebp)
		#//------- line: "%p\n" , walker ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		#//------- line: printf ( __STRING5__,,,-4(%ebp) ) ------- #
		# pushing clobbers
		# Calling function printf
		# TODO optimize if variable just do movl
		mov -4(%ebp), %edx
		push %edx
		pushl $__STRING5__
		call printf
		mov %eax, %ecx
		add $8, %esp
		# popping clobbers
		__LABEL48__:
		#//------- line: walker != 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setne %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL49__
		#//------- line: { ; ------- #
		# {
			#//------- line: walker . node . value ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "node" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			# Reading property "value" in "%ecx"
			# optimized move from 12(%ecx) to %esi
			# setting register "d" to "12(%ecx)"
			mov 12(%ecx), %edx
			mov %edx, %esi
			#//------- line: print_ ( %esi ) ------- #
			# pushing multi-line clobbers
			push %esi
			pushl $__PRINT_TYPE_INT__
			call printf
			add $8, %esp
			# popping multi-line clobbers
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL48__
		__LABEL49__:
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
# walker: 4
	#//------- line: } ------- #
# }
	#//------- line: . allNodes LLGraphNode ------- #
	#//------- line:  ------- #
	#//------- line: . Graph constructor <  > ------- #
__constructor_Graph_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Graph_0___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	# pushing clobbers
	# Allocate for THIS
	pushl $0
	# setting register "d" to "$__SIZEOF_Graph__"
	mov $__SIZEOF_Graph__, %edx
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
	#//------- line: GraphNode node ------- #
	#//------- line: . addNode method < node > ------- #
__method_Graph_addNode_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Graph_addNode___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line: this . allNodes == 0 ------- #
		# Reading property "allNodes" in "__this__"
		movl __this__, %eax
		# optimized move from 0(%eax) to %ecx
		# setting register "d" to "0(%eax)"
		mov 0(%eax), %edx
		mov %edx, %ecx
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		sete __TEMP8_0__
		#//------- line: if ( __TEMP8_0__ ) ------- #
		cmpb $1, __TEMP8_0__ # comparison for "if" statement
		jne __LABEL50__
		#//------- line: { ; ------- #
		# {
			#//------- line: node ------- #
			# note, read PARAM node -> 8(%ebp)
			#//------- line: LLGraphNode ( 8(%ebp) ) ------- #
			pushl __this__
			# pushing clobbers
			# Calling function __constructor_LLGraphNode_1_
			# TODO optimize if variable just do movl
			mov 8(%ebp), %edx
			push %edx
			call __constructor_LLGraphNode_1_
			mov %eax, %ecx
			add $4, %esp
			# popping clobbers
			popl __this__
			#//------- line: this . allNodes <- %ecx ------- #
			# Reading property "allNodes" in "__this__"
			movl __this__, %eax
			# optimized move from %ecx to 0(%eax)
			mov %ecx, 0(%eax)
			# requesting ownership for __this__ (property)
			lea 0(%eax), %eax
			push %eax
			push %ecx
			call __rc_requestOwnership__
			add $8, %esp
			#//------- line: } ------- #
		# }
jmp __LABEL51__
__LABEL50__:
		#//------- line: else ------- #
		#//------- line: { ; ------- #
		# {
			#//------- line: node ------- #
			# note, read PARAM node -> 8(%ebp)
			#//------- line: this . allNodes . add ( 8(%ebp) ) ------- #
			# Reading property "allNodes" in "__this__"
			movl __this__, %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			pushl __this__
			# optimized move from %ecx to __this__
			mov %ecx, __this__
			# pushing clobbers
			push %ecx
			# Calling function __method_LLGraphNode_add_
			# TODO optimize if variable just do movl
			mov 8(%ebp), %edx
			push %edx
			call __method_LLGraphNode_add_
			mov %eax, %esi
			add $4, %esp
			# popping clobbers
			pop %ecx
			popl __this__
			#//------- line: } ------- #
		# }
jmp __LABEL51__
__LABEL52__:
		__LABEL51__:
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
	#//------- line: GraphNode node ------- #
	#//------- line: . bft method < node > ------- #
__method_Graph_bft_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Graph_bft___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line: { ; ------- #
	# {
		#//------- line:  ------- #
		#//------- line: StaticQueue (  ) ------- #
		pushl __this__
		# pushing clobbers
		# Calling function __constructor_StaticQueue_0_
		call __constructor_StaticQueue_0_
		mov %eax, %ecx
		# popping clobbers
		popl __this__
		#//------- line: create queue <- %ecx ------- #
		# creating variable "queue" of type "StaticQueue:dynamic" stack?=true
		# Loading local variable "queue" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		# requesting ownership for queue (create)
		lea -4(%ebp), %eax
		push %eax
		push %ecx
		call __rc_requestOwnership__
		add $8, %esp
		#//------- line:  ------- #
		#//------- line: node ------- #
		# note, read PARAM node -> 8(%ebp)
		#//------- line: GraphNode : borrowed : ( 8(%ebp) ) ------- #
		# setting register "c" to "8(%ebp)"
		mov 8(%ebp), %ecx
		#//------- line: queue . push ( %ecx ) ------- #
		# note, read STACK VAR queue -> -4(%ebp)
		pushl __this__
		# optimized move from -4(%ebp) to __this__
		# setting register "d" to "-4(%ebp)"
		mov -4(%ebp), %edx
		mov %edx, __this__
		# pushing clobbers
		push %ecx
		# Calling function __method_StaticQueue_push_
		push %ecx
		call __method_StaticQueue_push_
		mov %eax, %esi
		add $4, %esp
		# popping clobbers
		pop %ecx
		popl __this__
		#//------- line: 1 ------- #
		#//------- line: node . visited <- 1 ------- #
		# note, read PARAM node -> 8(%ebp)
		# Reading property "visited" in "8(%ebp)"
		movl 8(%ebp), %eax
		# optimized move from 1 to 4(%eax)
		movl $1, 4(%eax)
		__LABEL53__:
		#//------- line:  ------- #
		#//------- line: queue . empty (  ) == 0 ------- #
		# note, read STACK VAR queue -> -4(%ebp)
		pushl __this__
		# optimized move from -4(%ebp) to __this__
		# setting register "d" to "-4(%ebp)"
		mov -4(%ebp), %edx
		mov %edx, __this__
		# pushing clobbers
		# Calling function __method_StaticQueue_empty_
		call __method_StaticQueue_empty_
		mov %eax, %ecx
		# popping clobbers
		popl __this__
		movb $0, __TEMP8_0__
		cmp $0, %ecx
		sete __TEMP8_0__
		#//------- line: while ( __TEMP8_0__ ) ------- #
		# comparison for WHILE loop
		cmpb $1, __TEMP8_0__
		jne __LABEL54__
		#//------- line: { ; ------- #
		# {
			#//------- line:  ------- #
			#//------- line: queue . pop (  ) ------- #
			# note, read STACK VAR queue -> -4(%ebp)
			pushl __this__
			# optimized move from -4(%ebp) to __this__
			# setting register "d" to "-4(%ebp)"
			mov -4(%ebp), %edx
			mov %edx, __this__
			# pushing clobbers
			# Calling function __method_StaticQueue_pop_
			call __method_StaticQueue_pop_
			mov %eax, %ecx
			# popping clobbers
			popl __this__
			#//------- line: create GraphNode : borrowed current <- %ecx ------- #
			# creating variable "current" of type "__GraphNode__staticdef__:borrowed" stack?=true
			# Loading local variable "current" @-8(%ebp) with "%ecx"
			# optimized move from %ecx to -8(%ebp)
			mov %ecx, -8(%ebp)
			#//------- line: current . value ------- #
			# note, read STACK VAR current -> -8(%ebp)
			# Reading property "value" in "-8(%ebp)"
			movl -8(%ebp), %eax
			# optimized move from 12(%eax) to %ecx
			# setting register "d" to "12(%eax)"
			mov 12(%eax), %edx
			mov %edx, %ecx
			#//------- line: print_ ( %ecx ) ------- #
			# pushing multi-line clobbers
			push %ecx
			pushl $__PRINT_TYPE_INT__
			call printf
			add $8, %esp
			# popping multi-line clobbers
			#//------- line: borrow current . connections ------- #
			# note, read STACK VAR current -> -8(%ebp)
			# Reading property "connections" in "-8(%ebp)"
			movl -8(%ebp), %eax
			# optimized move from 8(%eax) to %ecx
			# setting register "d" to "8(%eax)"
			mov 8(%eax), %edx
			mov %edx, %ecx
			#//------- line: create walker <- %ecx ------- #
			# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
			# Loading local variable "walker" @-12(%ebp) with "%ecx"
			# optimized move from %ecx to -12(%ebp)
			mov %ecx, -12(%ebp)
			__LABEL55__:
			#//------- line: walker != 0 ------- #
			# note, read STACK VAR walker -> -12(%ebp)
			mov -12(%ebp), %eax
			mov $0, %cl
			cmp $0, %eax
			setne %cl
			#//------- line: while ( %cl ) ------- #
			# comparison for WHILE loop
			cmpb $1, %cl
			jne __LABEL56__
			#//------- line: { ; ------- #
			# {
				#//------- line: walker . node . visited == 0 ------- #
				# note, read STACK VAR walker -> -12(%ebp)
				# Reading property "node" in "-12(%ebp)"
				movl -12(%ebp), %eax
				# optimized move from 0(%eax) to %ecx
				# setting register "d" to "0(%eax)"
				mov 0(%eax), %edx
				mov %edx, %ecx
				# Reading property "visited" in "%ecx"
				# optimized move from 4(%ecx) to %esi
				# setting register "d" to "4(%ecx)"
				mov 4(%ecx), %edx
				mov %edx, %esi
				movb $0, __TEMP8_0__
				cmp $0, %esi
				sete __TEMP8_0__
				#//------- line: if ( __TEMP8_0__ ) ------- #
				cmpb $1, __TEMP8_0__ # comparison for "if" statement
				jne __LABEL57__
				#//------- line: { ; ------- #
				# {
					#//------- line: walker . node ------- #
					# note, read STACK VAR walker -> -12(%ebp)
					# Reading property "node" in "-12(%ebp)"
					movl -12(%ebp), %eax
					# optimized move from 0(%eax) to %ecx
					# setting register "d" to "0(%eax)"
					mov 0(%eax), %edx
					mov %edx, %ecx
					#//------- line: GraphNode : borrowed : ( %ecx ) ------- #
					# setting register "s" to "%ecx"
					mov %ecx, %esi
					#//------- line: queue . push ( %esi ) ------- #
					# note, read STACK VAR queue -> -4(%ebp)
					pushl __this__
					# optimized move from -4(%ebp) to __this__
					# setting register "d" to "-4(%ebp)"
					mov -4(%ebp), %edx
					mov %edx, __this__
					# pushing clobbers
					push %esi
					push %ecx
					# Calling function __method_StaticQueue_push_
					push %esi
					call __method_StaticQueue_push_
					mov %eax, %edi
					add $4, %esp
					# popping clobbers
					pop %ecx
					pop %esi
					popl __this__
					#//------- line: 1 ------- #
					#//------- line: walker . node . visited <- 1 ------- #
					# note, read STACK VAR walker -> -12(%ebp)
					# Reading property "node" in "-12(%ebp)"
					movl -12(%ebp), %eax
					# optimized move from 0(%eax) to %ecx
					# setting register "d" to "0(%eax)"
					mov 0(%eax), %edx
					mov %edx, %ecx
					# Reading property "visited" in "%ecx"
					# optimized move from 1 to 4(%ecx)
					movl $1, 4(%ecx)
					#//------- line: } ------- #
				# }
jmp __LABEL58__
__LABEL57__:
				__LABEL58__:
				#//------- line: borrow walker . next ------- #
				# note, read STACK VAR walker -> -12(%ebp)
				# Reading property "next" in "-12(%ebp)"
				movl -12(%ebp), %eax
				# optimized move from 4(%eax) to %ecx
				# setting register "d" to "4(%eax)"
				mov 4(%eax), %edx
				mov %edx, %ecx
				#//------- line: walker <- %ecx ------- #
				# SETTING walker <- %ecx
				# optimized move from %ecx to -12(%ebp)
				mov %ecx, -12(%ebp)
				#//------- line: } ------- #
			# }
			jmp __LABEL55__
			__LABEL56__:
			#//------- line: } ------- #
		# }
		jmp __LABEL53__
		__LABEL54__:
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
# queue: 4
	#//------- line:  ------- #
	#//------- line: GraphNode current ------- #
	#//------- line: . dft method < current > ------- #
__method_Graph_dft_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Graph_dft___, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
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
		#//------- line: 1 ------- #
		#//------- line: current . visited <- 1 ------- #
		# note, read PARAM current -> 8(%ebp)
		# Reading property "visited" in "8(%ebp)"
		movl 8(%ebp), %eax
		# optimized move from 1 to 4(%eax)
		movl $1, 4(%eax)
		#//------- line: `reading: ${current.value}` ------- #
		pushw __disable_gc__; movw $1, __disable_gc__
		#//------- line: current . value ------- #
		# note, read PARAM current -> 8(%ebp)
		# Reading property "value" in "8(%ebp)"
		movl 8(%ebp), %eax
		# optimized move from 12(%eax) to %ecx
		# setting register "d" to "12(%eax)"
		mov 12(%eax), %edx
		mov %edx, %ecx
		#//------- line: "reading: " ------- #
		#//------- line: "" ------- #
		# setting register "d" to "__STRING7__"
		movl $__STRING7__, %edx
		push %edx
		push %ecx
		call itos
		add $4, %esp
		push %eax
		# setting register "d" to "__STRING6__"
		movl $__STRING6__, %edx
		push %edx
		pushl $3
		call strjoinmany
		add $16, %esp
		mov %eax, %esi
		popw __disable_gc__
		#//------- line: print_ ( %esi ) ------- #
		# pushing multi-line clobbers
		push %esi
		call puts
		add $4, %esp
		# popping multi-line clobbers
		#//------- line: borrow current . connections ------- #
		# note, read PARAM current -> 8(%ebp)
		# Reading property "connections" in "8(%ebp)"
		movl 8(%ebp), %eax
		# optimized move from 8(%eax) to %ecx
		# setting register "d" to "8(%eax)"
		mov 8(%eax), %edx
		mov %edx, %ecx
		#//------- line: create walker <- %ecx ------- #
		# creating variable "walker" of type "LLGraphNode:dynamic" stack?=true
		# Loading local variable "walker" @-4(%ebp) with "%ecx"
		# optimized move from %ecx to -4(%ebp)
		mov %ecx, -4(%ebp)
		__LABEL59__:
		#//------- line: walker != 0 ------- #
		# note, read STACK VAR walker -> -4(%ebp)
		mov -4(%ebp), %eax
		mov $0, %cl
		cmp $0, %eax
		setne %cl
		#//------- line: while ( %cl ) ------- #
		# comparison for WHILE loop
		cmpb $1, %cl
		jne __LABEL60__
		#//------- line: { ; ------- #
		# {
			#//------- line:  ------- #
			#//------- line:  ------- #
			#//------- line:  ------- #
			#//------- line:  ------- #
			#//------- line: walker . node . visited == 0 ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "node" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 0(%eax) to %ecx
			# setting register "d" to "0(%eax)"
			mov 0(%eax), %edx
			mov %edx, %ecx
			# Reading property "visited" in "%ecx"
			# optimized move from 4(%ecx) to %esi
			# setting register "d" to "4(%ecx)"
			mov 4(%ecx), %edx
			mov %edx, %esi
			movb $0, __TEMP8_0__
			cmp $0, %esi
			sete __TEMP8_0__
			#//------- line: if ( __TEMP8_0__ ) ------- #
			cmpb $1, __TEMP8_0__ # comparison for "if" statement
			jne __LABEL61__
			#//------- line: { ; ------- #
			# {
				#//------- line: walker . node ------- #
				# note, read STACK VAR walker -> -4(%ebp)
				# Reading property "node" in "-4(%ebp)"
				movl -4(%ebp), %eax
				# optimized move from 0(%eax) to %ecx
				# setting register "d" to "0(%eax)"
				mov 0(%eax), %edx
				mov %edx, %ecx
				#//------- line: this . dft ( %ecx ) ------- #
				pushl __this__
				# optimized move from __this__ to __this__
				# setting register "d" to "__this__"
				movl __this__, %edx
				mov %edx, __this__
				# pushing clobbers
				push %ecx
				# Calling function __method_Graph_dft_
				push %ecx
				call __method_Graph_dft_
				mov %eax, %esi
				add $4, %esp
				# popping clobbers
				pop %ecx
				popl __this__
				#//------- line: } ------- #
			# }
jmp __LABEL62__
__LABEL61__:
			__LABEL62__:
			#//------- line: borrow walker . next ------- #
			# note, read STACK VAR walker -> -4(%ebp)
			# Reading property "next" in "-4(%ebp)"
			movl -4(%ebp), %eax
			# optimized move from 4(%eax) to %ecx
			# setting register "d" to "4(%eax)"
			mov 4(%eax), %edx
			mov %edx, %ecx
			#//------- line: walker <- %ecx ------- #
			# SETTING walker <- %ecx
			# optimized move from %ecx to -4(%ebp)
			mov %ecx, -4(%ebp)
			#//------- line: } ------- #
		# }
		jmp __LABEL59__
		__LABEL60__:
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
# walker: 4
	#//------- line: } ------- #
# }
testDFT:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_testDFT__, %esp # total stack allocation

# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
	#//------- line:  ------- #
	#//------- line: Graph (  ) ------- #
	# pushing clobbers
	# Calling function __constructor_Graph_0_
	call __constructor_Graph_0_
	mov %eax, %ecx
	# popping clobbers
	#//------- line: create graph <- %ecx ------- #
	# creating variable "graph" of type "Graph:dynamic" stack?=true
	# Loading local variable "graph" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for graph (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line:  ------- #
	#//------- line: 1 ------- #
	#//------- line: GraphNode ( 1 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $1
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node1 <- %ecx ------- #
	# creating variable "node1" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node1" @-8(%ebp) with "%ecx"
	# optimized move from %ecx to -8(%ebp)
	mov %ecx, -8(%ebp)
	# requesting ownership for node1 (create)
	lea -8(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 2 ------- #
	#//------- line: GraphNode ( 2 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $2
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node2 <- %ecx ------- #
	# creating variable "node2" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node2" @-12(%ebp) with "%ecx"
	# optimized move from %ecx to -12(%ebp)
	mov %ecx, -12(%ebp)
	# requesting ownership for node2 (create)
	lea -12(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 3 ------- #
	#//------- line: GraphNode ( 3 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $3
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node3 <- %ecx ------- #
	# creating variable "node3" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node3" @-16(%ebp) with "%ecx"
	# optimized move from %ecx to -16(%ebp)
	mov %ecx, -16(%ebp)
	# requesting ownership for node3 (create)
	lea -16(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 4 ------- #
	#//------- line: GraphNode ( 4 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $4
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node4 <- %ecx ------- #
	# creating variable "node4" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node4" @-20(%ebp) with "%ecx"
	# optimized move from %ecx to -20(%ebp)
	mov %ecx, -20(%ebp)
	# requesting ownership for node4 (create)
	lea -20(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 5 ------- #
	#//------- line: GraphNode ( 5 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $5
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node5 <- %ecx ------- #
	# creating variable "node5" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node5" @-24(%ebp) with "%ecx"
	# optimized move from %ecx to -24(%ebp)
	mov %ecx, -24(%ebp)
	# requesting ownership for node5 (create)
	lea -24(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 6 ------- #
	#//------- line: GraphNode ( 6 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $6
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node6 <- %ecx ------- #
	# creating variable "node6" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node6" @-28(%ebp) with "%ecx"
	# optimized move from %ecx to -28(%ebp)
	mov %ecx, -28(%ebp)
	# requesting ownership for node6 (create)
	lea -28(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 7 ------- #
	#//------- line: GraphNode ( 7 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $7
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node7 <- %ecx ------- #
	# creating variable "node7" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node7" @-32(%ebp) with "%ecx"
	# optimized move from %ecx to -32(%ebp)
	mov %ecx, -32(%ebp)
	# requesting ownership for node7 (create)
	lea -32(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: node2 ------- #
	# note, read STACK VAR node2 -> -12(%ebp)
	#//------- line: node1 . addTwoWayConnection ( -12(%ebp) ) ------- #
	# note, read STACK VAR node1 -> -8(%ebp)
	# optimized move from -8(%ebp) to __this__
	# setting register "d" to "-8(%ebp)"
	mov -8(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -12(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node5 ------- #
	# note, read STACK VAR node5 -> -24(%ebp)
	#//------- line: node1 . addTwoWayConnection ( -24(%ebp) ) ------- #
	# note, read STACK VAR node1 -> -8(%ebp)
	# optimized move from -8(%ebp) to __this__
	# setting register "d" to "-8(%ebp)"
	mov -8(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -24(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node3 ------- #
	# note, read STACK VAR node3 -> -16(%ebp)
	#//------- line: node1 . addTwoWayConnection ( -16(%ebp) ) ------- #
	# note, read STACK VAR node1 -> -8(%ebp)
	# optimized move from -8(%ebp) to __this__
	# setting register "d" to "-8(%ebp)"
	mov -8(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -16(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node6 ------- #
	# note, read STACK VAR node6 -> -28(%ebp)
	#//------- line: node2 . addTwoWayConnection ( -28(%ebp) ) ------- #
	# note, read STACK VAR node2 -> -12(%ebp)
	# optimized move from -12(%ebp) to __this__
	# setting register "d" to "-12(%ebp)"
	mov -12(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -28(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node4 ------- #
	# note, read STACK VAR node4 -> -20(%ebp)
	#//------- line: node2 . addTwoWayConnection ( -20(%ebp) ) ------- #
	# note, read STACK VAR node2 -> -12(%ebp)
	# optimized move from -12(%ebp) to __this__
	# setting register "d" to "-12(%ebp)"
	mov -12(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -20(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node4 ------- #
	# note, read STACK VAR node4 -> -20(%ebp)
	#//------- line: node3 . addTwoWayConnection ( -20(%ebp) ) ------- #
	# note, read STACK VAR node3 -> -16(%ebp)
	# optimized move from -16(%ebp) to __this__
	# setting register "d" to "-16(%ebp)"
	mov -16(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -20(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node7 ------- #
	# note, read STACK VAR node7 -> -32(%ebp)
	#//------- line: node3 . addTwoWayConnection ( -32(%ebp) ) ------- #
	# note, read STACK VAR node3 -> -16(%ebp)
	# optimized move from -16(%ebp) to __this__
	# setting register "d" to "-16(%ebp)"
	mov -16(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -32(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node5 ------- #
	# note, read STACK VAR node5 -> -24(%ebp)
	#//------- line: node4 . addTwoWayConnection ( -24(%ebp) ) ------- #
	# note, read STACK VAR node4 -> -20(%ebp)
	# optimized move from -20(%ebp) to __this__
	# setting register "d" to "-20(%ebp)"
	mov -20(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addTwoWayConnection_
	# TODO optimize if variable just do movl
	mov -24(%ebp), %edx
	push %edx
	call __method_GraphNode_addTwoWayConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node1 ------- #
	# note, read STACK VAR node1 -> -8(%ebp)
	#//------- line: graph . dft ( -8(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_dft_
	# TODO optimize if variable just do movl
	mov -8(%ebp), %edx
	push %edx
	call __method_Graph_dft_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: } ------- #
# }
<<<<<<< HEAD
call __rc_quick_check__
=======
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax
>>>>>>> c67818b4379b9c13424657f2895f27c380b1f104

mov %ebp, %esp
pop %ebp
ret
# graph: 4
# node1: 8
# node2: 12
# node3: 16
# node4: 20
# node5: 24
# node6: 28
# node7: 32
testBFT:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_testBFT__, %esp # total stack allocation

<<<<<<< HEAD
=======
# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
>>>>>>> c67818b4379b9c13424657f2895f27c380b1f104
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line:  ------- #
	#//------- line: Graph (  ) ------- #
	# pushing clobbers
	# Calling function __constructor_Graph_0_
	call __constructor_Graph_0_
	mov %eax, %ecx
	# popping clobbers
	#//------- line: create graph <- %ecx ------- #
	# creating variable "graph" of type "Graph:dynamic" stack?=true
	# Loading local variable "graph" @-4(%ebp) with "%ecx"
	# optimized move from %ecx to -4(%ebp)
	mov %ecx, -4(%ebp)
	# requesting ownership for graph (create)
	lea -4(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 0 ------- #
	#//------- line: GraphNode ( 0 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $0
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node0 <- %ecx ------- #
	# creating variable "node0" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node0" @-8(%ebp) with "%ecx"
	# optimized move from %ecx to -8(%ebp)
	mov %ecx, -8(%ebp)
	# requesting ownership for node0 (create)
	lea -8(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 1 ------- #
	#//------- line: GraphNode ( 1 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $1
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node1 <- %ecx ------- #
	# creating variable "node1" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node1" @-12(%ebp) with "%ecx"
	# optimized move from %ecx to -12(%ebp)
	mov %ecx, -12(%ebp)
	# requesting ownership for node1 (create)
	lea -12(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 2 ------- #
	#//------- line: GraphNode ( 2 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $2
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node2 <- %ecx ------- #
	# creating variable "node2" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node2" @-16(%ebp) with "%ecx"
	# optimized move from %ecx to -16(%ebp)
	mov %ecx, -16(%ebp)
	# requesting ownership for node2 (create)
	lea -16(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 3 ------- #
	#//------- line: GraphNode ( 3 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $3
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node3 <- %ecx ------- #
	# creating variable "node3" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node3" @-20(%ebp) with "%ecx"
	# optimized move from %ecx to -20(%ebp)
	mov %ecx, -20(%ebp)
	# requesting ownership for node3 (create)
	lea -20(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 4 ------- #
	#//------- line: GraphNode ( 4 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $4
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node4 <- %ecx ------- #
	# creating variable "node4" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node4" @-24(%ebp) with "%ecx"
	# optimized move from %ecx to -24(%ebp)
	mov %ecx, -24(%ebp)
	# requesting ownership for node4 (create)
	lea -24(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: 5 ------- #
	#//------- line: GraphNode ( 5 ) ------- #
	# pushing clobbers
	# Calling function __constructor_GraphNode_0_
	pushl $5
	call __constructor_GraphNode_0_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: create node5 <- %ecx ------- #
	# creating variable "node5" of type "GraphNode:dynamic" stack?=true
	# Loading local variable "node5" @-28(%ebp) with "%ecx"
	# optimized move from %ecx to -28(%ebp)
	mov %ecx, -28(%ebp)
	# requesting ownership for node5 (create)
	lea -28(%ebp), %eax
	push %eax
	push %ecx
	call __rc_requestOwnership__
	add $8, %esp
	#//------- line: node0 ------- #
	# note, read STACK VAR node0 -> -8(%ebp)
	#//------- line: graph . addNode ( -8(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_addNode_
	# TODO optimize if variable just do movl
	mov -8(%ebp), %edx
	push %edx
	call __method_Graph_addNode_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node1 ------- #
	# note, read STACK VAR node1 -> -12(%ebp)
	#//------- line: graph . addNode ( -12(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_addNode_
	# TODO optimize if variable just do movl
	mov -12(%ebp), %edx
	push %edx
	call __method_Graph_addNode_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node2 ------- #
	# note, read STACK VAR node2 -> -16(%ebp)
	#//------- line: graph . addNode ( -16(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_addNode_
	# TODO optimize if variable just do movl
	mov -16(%ebp), %edx
	push %edx
	call __method_Graph_addNode_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node3 ------- #
	# note, read STACK VAR node3 -> -20(%ebp)
	#//------- line: graph . addNode ( -20(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_addNode_
	# TODO optimize if variable just do movl
	mov -20(%ebp), %edx
	push %edx
	call __method_Graph_addNode_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node4 ------- #
	# note, read STACK VAR node4 -> -24(%ebp)
	#//------- line: graph . addNode ( -24(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_addNode_
	# TODO optimize if variable just do movl
	mov -24(%ebp), %edx
	push %edx
	call __method_Graph_addNode_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node5 ------- #
	# note, read STACK VAR node5 -> -28(%ebp)
	#//------- line: graph . addNode ( -28(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_addNode_
	# TODO optimize if variable just do movl
	mov -28(%ebp), %edx
	push %edx
	call __method_Graph_addNode_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node1 ------- #
	# note, read STACK VAR node1 -> -12(%ebp)
	#//------- line: node0 . addConnection ( -12(%ebp) ) ------- #
	# note, read STACK VAR node0 -> -8(%ebp)
	# optimized move from -8(%ebp) to __this__
	# setting register "d" to "-8(%ebp)"
	mov -8(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -12(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node2 ------- #
	# note, read STACK VAR node2 -> -16(%ebp)
	#//------- line: node0 . addConnection ( -16(%ebp) ) ------- #
	# note, read STACK VAR node0 -> -8(%ebp)
	# optimized move from -8(%ebp) to __this__
	# setting register "d" to "-8(%ebp)"
	mov -8(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -16(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node2 ------- #
	# note, read STACK VAR node2 -> -16(%ebp)
	#//------- line: node1 . addConnection ( -16(%ebp) ) ------- #
	# note, read STACK VAR node1 -> -12(%ebp)
	# optimized move from -12(%ebp) to __this__
	# setting register "d" to "-12(%ebp)"
	mov -12(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -16(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node3 ------- #
	# note, read STACK VAR node3 -> -20(%ebp)
	#//------- line: node1 . addConnection ( -20(%ebp) ) ------- #
	# note, read STACK VAR node1 -> -12(%ebp)
	# optimized move from -12(%ebp) to __this__
	# setting register "d" to "-12(%ebp)"
	mov -12(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -20(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node3 ------- #
	# note, read STACK VAR node3 -> -20(%ebp)
	#//------- line: node2 . addConnection ( -20(%ebp) ) ------- #
	# note, read STACK VAR node2 -> -16(%ebp)
	# optimized move from -16(%ebp) to __this__
	# setting register "d" to "-16(%ebp)"
	mov -16(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -20(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: node4 ------- #
	# note, read STACK VAR node4 -> -24(%ebp)
	#//------- line: node3 . addConnection ( -24(%ebp) ) ------- #
	# note, read STACK VAR node3 -> -20(%ebp)
	# optimized move from -20(%ebp) to __this__
	# setting register "d" to "-20(%ebp)"
	mov -20(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -24(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line:  ------- #
	#//------- line: node0 ------- #
	# note, read STACK VAR node0 -> -8(%ebp)
	#//------- line: node4 . addConnection ( -8(%ebp) ) ------- #
	# note, read STACK VAR node4 -> -24(%ebp)
	# optimized move from -24(%ebp) to __this__
	# setting register "d" to "-24(%ebp)"
	mov -24(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -8(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node1 ------- #
	# note, read STACK VAR node1 -> -12(%ebp)
	#//------- line: node4 . addConnection ( -12(%ebp) ) ------- #
	# note, read STACK VAR node4 -> -24(%ebp)
	# optimized move from -24(%ebp) to __this__
	# setting register "d" to "-24(%ebp)"
	mov -24(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -12(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node5 ------- #
	# note, read STACK VAR node5 -> -28(%ebp)
	#//------- line: node4 . addConnection ( -28(%ebp) ) ------- #
	# note, read STACK VAR node4 -> -24(%ebp)
	# optimized move from -24(%ebp) to __this__
	# setting register "d" to "-24(%ebp)"
	mov -24(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_GraphNode_addConnection_
	# TODO optimize if variable just do movl
	mov -28(%ebp), %edx
	push %edx
	call __method_GraphNode_addConnection_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: node0 ------- #
	# note, read STACK VAR node0 -> -8(%ebp)
	#//------- line: graph . bft ( -8(%ebp) ) ------- #
	# note, read STACK VAR graph -> -4(%ebp)
	# optimized move from -4(%ebp) to __this__
	# setting register "d" to "-4(%ebp)"
	mov -4(%ebp), %edx
	mov %edx, __this__
	# pushing clobbers
	# Calling function __method_Graph_bft_
	# TODO optimize if variable just do movl
	mov -8(%ebp), %edx
	push %edx
	call __method_Graph_bft_
	mov %eax, %ecx
	add $4, %esp
	# popping clobbers
	#//------- line: } ------- #
# }
<<<<<<< HEAD
call __rc_quick_check__
=======
push %eax
push %esp
push %ebp
call __rc_exitChunk__
add $8, %esp
pop %eax
>>>>>>> c67818b4379b9c13424657f2895f27c380b1f104

mov %ebp, %esp
pop %ebp
ret
# graph: 4
# node0: 8
# node1: 12
# node2: 16
# node3: 20
# node4: 24
# node5: 28
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp # total stack allocation

<<<<<<< HEAD
=======
# pushing multi-line clobbers
call __rc_enterChunk__
# popping multi-line clobbers
>>>>>>> c67818b4379b9c13424657f2895f27c380b1f104
	#//------- line: 0 ------- #
	#//------- line: create i <- 0 ------- #
	# creating variable "i" of type "u32:borrowed" stack?=true
	# Loading local variable "i" @-4(%ebp) with "0"
	# optimized move from 0 to -4(%ebp)
	movl $0, -4(%ebp)
	__LABEL63__:
	#//------- line: i <: 500 ------- #
	# note, read STACK VAR i -> -4(%ebp)
	mov -4(%ebp), %eax
	mov $0, %cl
	cmp $500, %eax
	setl %cl
	#//------- line: while ( %cl ) ------- #
	# comparison for WHILE loop
	cmpb $1, %cl
	jne __LABEL64__
	#//------- line: { ; ------- #
	# {
		#//------- line:  ------- #
		#//------- line: testBFT (  ) ------- #
		# pushing clobbers
		# Calling function testBFT
		call testBFT
		mov %eax, %ecx
		# popping clobbers
		#//------- line: "\n" ------- #
		#//------- line: print_ ( __STRING8__ ) ------- #
		# pushing multi-line clobbers
		pushl $__STRING8__
		call puts
		add $4, %esp
		# popping multi-line clobbers
		#//------- line:  ------- #
		#//------- line: testDFT (  ) ------- #
		# pushing clobbers
		# Calling function testDFT
		call testDFT
		mov %eax, %ecx
		# popping clobbers
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
	jmp __LABEL63__
	__LABEL64__:
	#//------- line: } ------- #
# }
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# i: 4

