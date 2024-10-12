
.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
__PRINT_TYPE_INT__: .asciz "%i\n"
######## Auto included libs #######

.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/gcollect.s"


.include "/Users/squijano/Documents/HAMprimeC2/compiler/libs/alloc.s"

###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
.global ___TEMPORARY_OWNER___
.global __this__
.extern __disable_gc__
######## user data section ########
.extern gfx_mouse_x
.extern gfx_mouse_y
.extern gfx_mouse_button
.extern gfx_keypress_keycode
.extern gfx_keypress_key
.type	exit_game, @function
.4byte 23
__STRING0__: .asciz " Your final score was "
__ALLOCFOR_exit_game__ = 0
__SIZEOF_Position__ = 8
# format "Position" includes:
#   - PROPERTY (u32) x
#   - PROPERTY (u32) y
.type	__method_Food_move_, @function
__ALLOCFOR___method_Food_move___ = 8
.type	__constructor_Food_0_, @function
__ALLOCFOR___constructor_Food_0___ = 0
.type	__method_Food_render_, @function
__ALLOCFOR___method_Food_render___ = 0
__SIZEOF_Food__ = 4
# format "Food" includes:
#   - PROPERTY (p0) pos
#   - CNSTRCTR __constructor_Food_0_ (0 parameters)
.type	__constructor_Snake_1_, @function
__ALLOCFOR___constructor_Snake_1___ = 4
.type	__method_Snake_grow_, @function
.4byte 5
__STRING1__: .asciz "Win!"
__ALLOCFOR___method_Snake_grow___ = 8
.type	__method_Snake_setVelocity_, @function
__ALLOCFOR___method_Snake_setVelocity___ = 0
.type	__method_Snake_checkEat_, @function
__ALLOCFOR___method_Snake_checkEat___ = 0
.type	__method_Snake_moveAndRender_, @function
.4byte 6
__STRING2__: .asciz "Fail!"
__ALLOCFOR___method_Snake_moveAndRender___ = 4
__SIZEOF_Snake__ = 20
# format "Snake" includes:
#   - PROPERTY (u32) vx
#   - PROPERTY (u32) vy
#   - PROPERTY (u32) length
#   - PROPERTY (p0) head
#   - PROPERTY (p0) nodes
#   - CNSTRCTR __constructor_Snake_1_ (1 parameters)
snake: .4byte 0
food: .4byte 0
.type	render, @function
.4byte 8
__STRING3__: .asciz "Score: "
__ALLOCFOR_render__ = 0
.type	entry, @function
__ALLOCFOR_entry__ = 0
__TEMP8_0__: .1byte 0
__TEMP8_1__: .1byte 0
__TEMP8_2__: .1byte 0
__TEMP8_3__: .1byte 0
__TEMP8_4__: .1byte 0
__TEMP8_5__: .1byte 0
__TEMP8_6__: .1byte 0
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
__TEMP32_2__: .4byte 0
__TEMP32_3__: .4byte 0
__TEMP32_4__: .4byte 0
__TEMP32_5__: .4byte 0
__TEMP32_6__: .4byte 0
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
mov $0, %ecx
mov %ecx, snake
# requesting ownership for snake (create)
push $snake
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov $0, %ecx
mov %ecx, food
# requesting ownership for food (create)
push $food
push %ecx
call __rc_requestOwnership__
add $8, %esp
ret
###################################

main:
    call __init__
    call entry
    ret

###################################
exit_game:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_exit_game__, %esp

push 12(%ebp)
call itos
add $4, %esp
push %eax
pushl $__STRING0__
push 8(%ebp)
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
push %ecx
call puts
add $4, %esp
# Calling function exit
pushl $0
call exit
mov %eax, %ecx
add $4, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Food_move_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Food_move___, %esp

# Calling function rand
call rand
mov %eax, %ecx
mov %ecx, %eax
mov $96, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %esi
mov %esi, %eax
mov $5, %ebx
mul %ebx
mov %eax, %edi
# Loading local variable "rx" @-4(%ebp)
mov %edi, -4(%ebp)
# Calling function rand
call rand
mov %eax, %ecx
mov %ecx, %eax
mov $72, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %esi
mov %esi, %eax
mov $5, %ebx
mul %ebx
mov %eax, %edi
# Loading local variable "ry" @-8(%ebp)
mov %edi, -8(%ebp)
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Position
mov -4(%ebp), %edx
mov %edx, 0(%eax)
mov -8(%ebp), %edx
mov %edx, 4(%eax)
# Reading property "pos" in "__this__"
movl __this__, %eax
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# rx: 4
# ry: 8
__constructor_Food_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Food_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Food__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set)
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Food_move_
call __method_Food_move_
mov %eax, %ecx
popl __this__
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Food_render_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Food_render___, %esp

# Reading property "pos" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
# Reading property "pos" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %edi
# Reading property "y" in "%edi"
mov 4(%edi), %edx
mov %edx, __TEMP32_0__
push %esi
push %ecx
push %edi
# Calling function gfx_draw_rect
pushl $5
pushl $5
# TODO optimize if variable just do movl
mov __TEMP32_0__, %edx
push %edx
push %esi
call gfx_draw_rect
mov %eax, __TEMP32_1__
add $16, %esp
pop %edi
pop %ecx
pop %esi
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_Snake_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Snake_1___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Snake__, %edx
push %edx
call __rc_allocate__
add $8, %esp
mov %eax, __this__
# requesting ownership for ___TEMPORARY_OWNER___ (set)
lea ___TEMPORARY_OWNER___, %eax
push %eax
push __this__
call __rc_requestOwnership__
add $8, %esp
# Reading property "vx" in "__this__"
movl __this__, %eax
movl $5, 0(%eax)
# Reading property "vy" in "__this__"
movl __this__, %eax
movl $0, 4(%eax)
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 8(%eax)
push %ecx
# Asked for 100 allocations of "Position"
pushl $0
pushl $400
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %ecx
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov %ecx, 16(%eax)
# requesting ownership for __this__ (property)
lea 16(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ecx # Local allocation address for Position
movl $240, 0(%eax)
movl $180, 4(%eax)
# Reading property "head" in "__this__"
movl __this__, %eax
mov %ecx, 12(%eax)
# requesting ownership for __this__ (property)
lea 12(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
__LABEL0__:
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %cl
cmp %edx, %eax
setl %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL1__
mov -4(%ebp), %eax
mov $5, %ebx
mul %ebx
mov %eax, %ecx
mov $235, %eax
sub %ecx, %eax
mov %eax, %esi
push %esi
push %ecx
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
pop %ecx
pop %esi
mov %eax, %edi # Local allocation address for Position
mov %esi, 0(%eax)
movl $180, 4(%eax)
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_0__
#Array set begin
mov __TEMP32_0__, %eax
# array load trash awful. Fix this bad optimize
push %eax
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edi, (%eax)
# requesting ownership for array index
push %eax
push %edi
call __rc_requestOwnership__
add $8, %esp
#Set end
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
mov %ecx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
__method_Snake_grow_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Snake_grow___, %esp

# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $100, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL2__
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
push %ecx
# Calling function exit_game
push %ecx
pushl $__STRING1__
call exit_game
mov %eax, %esi
add $8, %esp
pop %ecx
jmp __LABEL3__
__LABEL2__:
__LABEL3__:
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
#indexing array
mov %edi, %eax
movw $0, __TEMP32_0__
mov (%eax, %esi, 4), %edx
mov %edx, __TEMP32_0__
# Reading property "x" in "__TEMP32_0__"
movl __TEMP32_0__, %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_1__
# Reading property "vx" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_2__
mov __TEMP32_1__, %eax
subl __TEMP32_2__, %eax
mov %eax, __TEMP32_3__
# Loading local variable "x" @-4(%ebp)
movl __TEMP32_3__, %edx
mov %edx, -4(%ebp)
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
#indexing array
mov %edi, %eax
movw $0, __TEMP32_0__
mov (%eax, %esi, 4), %edx
mov %edx, __TEMP32_0__
# Reading property "y" in "__TEMP32_0__"
movl __TEMP32_0__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_1__
# Reading property "vy" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_2__
mov __TEMP32_1__, %eax
subl __TEMP32_2__, %eax
mov %eax, __TEMP32_3__
# Loading local variable "y" @-8(%ebp)
movl __TEMP32_3__, %edx
mov %edx, -8(%ebp)
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
push %ecx
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %esi # Local allocation address for Position
mov -4(%ebp), %edx
mov %edx, 0(%eax)
mov -8(%ebp), %edx
mov %edx, 4(%eax)
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
#Array set begin
mov %esi, (%edi, %ecx, 4) # mhm
# requesting ownership for array index
lea (%edi, %ecx, 4), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
#Set end
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
add $1, %eax
mov %eax, %esi
# Reading property "length" in "__this__"
movl __this__, %eax
mov %esi, 8(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# x: 4
# y: 8
__method_Snake_setVelocity_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Snake_setVelocity___, %esp

# Reading property "vx" in "__this__"
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# Reading property "vy" in "__this__"
movl __this__, %eax
mov 12(%ebp), %edx
mov %edx, 4(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Snake_checkEat_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Snake_checkEat___, %esp

# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
# Reading property "pos" in "8(%ebp)"
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %edi
# Reading property "x" in "%edi"
mov 0(%edi), %edx
mov %edx, __TEMP32_0__
mov __TEMP32_0__, %edx
movb $0, __TEMP8_0__
cmp %edx, %esi
sete __TEMP8_0__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_1__
# Reading property "y" in "__TEMP32_1__"
movl __TEMP32_1__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_2__
# Reading property "pos" in "8(%ebp)"
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_3__
# Reading property "y" in "__TEMP32_3__"
movl __TEMP32_3__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_4__
mov __TEMP32_2__, %eax
mov __TEMP32_4__, %edx
movb $0, __TEMP8_1__
cmp %edx, %eax
sete __TEMP8_1__
# AND comparison
movb $0, __TEMP8_2__
cmpb $1, __TEMP8_0__
jne __LABEL4__
cmpb $1, __TEMP8_1__
sete __TEMP8_2__
__LABEL4__:
cmpb $1, __TEMP8_2__
jne __LABEL5__
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Snake_grow_
call __method_Snake_grow_
mov %eax, %ecx
popl __this__
pushl __this__
mov 8(%ebp), %edx
mov %edx, __this__
# Calling function __method_Food_move_
call __method_Food_move_
mov %eax, %ecx
popl __this__
jmp __LABEL6__
__LABEL5__:
__LABEL6__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Snake_moveAndRender_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Snake_moveAndRender___, %esp

# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %edi
# Reading property "y" in "%edi"
mov 4(%edi), %edx
mov %edx, __TEMP32_0__
push %esi
push %ecx
push %edi
# Calling function gfx_draw_rect
pushl $5
pushl $5
# TODO optimize if variable just do movl
mov __TEMP32_0__, %edx
push %edx
push %esi
call gfx_draw_rect
mov %eax, __TEMP32_1__
add $16, %esp
pop %edi
pop %ecx
pop %esi
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
#indexing array
mov %edi, %eax
movw $0, __TEMP32_0__
mov 0(%eax), %edx
mov %edx, __TEMP32_0__
# Reading property "x" in "__TEMP32_0__"
movl __TEMP32_0__, %eax
mov %esi, 0(%eax)
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "y" in "%ecx"
mov 4(%ecx), %edx
mov %edx, %esi
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
#indexing array
mov %edi, %eax
movw $0, __TEMP32_0__
mov 0(%eax), %edx
mov %edx, __TEMP32_0__
# Reading property "y" in "__TEMP32_0__"
movl __TEMP32_0__, %eax
mov %esi, 4(%eax)
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
sub $1, %eax
mov %eax, %esi
# Loading local variable "i" @-4(%ebp)
mov %esi, -4(%ebp)
__LABEL7__:
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
setg %cl
# comparison for WHILE loop
cmpb $1, %cl
jne __LABEL8__
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %ecx
#indexing array
mov %ecx, %eax
xor %esi, %esi
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
# Reading property "x" in "%esi"
mov 0(%esi), %edx
mov %edx, %edi
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_0__
# Reading property "x" in "__TEMP32_0__"
movl __TEMP32_0__, %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_1__
mov __TEMP32_1__, %edx
movb $0, __TEMP8_0__
cmp %edx, %edi
sete __TEMP8_0__
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_2__
#indexing array
mov __TEMP32_2__, %eax
movw $0, __TEMP32_3__
# TEST DOES THIS WORK??? (1)
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_3__
# Reading property "y" in "__TEMP32_3__"
movl __TEMP32_3__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_4__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_5__
# Reading property "y" in "__TEMP32_5__"
movl __TEMP32_5__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_6__
mov __TEMP32_4__, %eax
mov __TEMP32_6__, %edx
movb $0, __TEMP8_1__
cmp %edx, %eax
sete __TEMP8_1__
# AND comparison
movb $0, __TEMP8_2__
cmpb $1, __TEMP8_0__
jne __LABEL9__
cmpb $1, __TEMP8_1__
sete __TEMP8_2__
__LABEL9__:
cmpb $1, __TEMP8_2__
jne __LABEL10__
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
push %ecx
# Calling function exit_game
push %ecx
pushl $__STRING2__
call exit_game
mov %eax, %esi
add $8, %esp
pop %ecx
jmp __LABEL11__
__LABEL10__:
__LABEL11__:
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %ecx
#indexing array
mov %ecx, %eax
xor %esi, %esi
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
# Reading property "x" in "%esi"
mov 0(%esi), %edx
mov %edx, %edi
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_0__
#indexing array
mov __TEMP32_0__, %eax
movw $0, __TEMP32_1__
# TEST DOES THIS WORK??? (1)
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_1__
# Reading property "y" in "__TEMP32_1__"
movl __TEMP32_1__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_2__
push %esi
push %ecx
push %edi
# Calling function gfx_draw_rect
pushl $5
pushl $5
# TODO optimize if variable just do movl
mov __TEMP32_2__, %edx
push %edx
push %edi
call gfx_draw_rect
mov %eax, __TEMP32_3__
add $16, %esp
pop %edi
pop %ecx
pop %esi
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ecx
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
#indexing array
mov %esi, %eax
xor %edi, %edi
mov (%eax, %ecx, 4), %edi
# Reading property "x" in "%edi"
mov 0(%edi), %edx
mov %edx, __TEMP32_0__
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_1__
#indexing array
mov __TEMP32_1__, %eax
movw $0, __TEMP32_2__
# TEST DOES THIS WORK??? (1)
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_2__
# Reading property "x" in "__TEMP32_2__"
movl __TEMP32_2__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ecx
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
#indexing array
mov %esi, %eax
xor %edi, %edi
mov (%eax, %ecx, 4), %edi
# Reading property "y" in "%edi"
mov 4(%edi), %edx
mov %edx, __TEMP32_0__
# Reading property "nodes" in "__this__"
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_1__
#indexing array
mov __TEMP32_1__, %eax
movw $0, __TEMP32_2__
# TEST DOES THIS WORK??? (1)
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_2__
# Reading property "y" in "__TEMP32_2__"
movl __TEMP32_2__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ecx
mov %ecx, -4(%ebp)
jmp __LABEL7__
__LABEL8__:
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
# Reading property "vx" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %edi
mov %esi, %eax
add %edi, %eax
mov %eax, __TEMP32_0__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_1__
# Reading property "x" in "__TEMP32_1__"
movl __TEMP32_1__, %eax
movl __TEMP32_0__, %edx
mov %edx, 0(%eax)
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "y" in "%ecx"
mov 4(%ecx), %edx
mov %edx, %esi
# Reading property "vy" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %edi
mov %esi, %eax
add %edi, %eax
mov %eax, __TEMP32_0__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_1__
# Reading property "y" in "__TEMP32_1__"
movl __TEMP32_1__, %eax
movl __TEMP32_0__, %edx
mov %edx, 4(%eax)
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
# Reading property "x" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $0, %esi
setl __TEMP8_0__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %edi
# Reading property "x" in "%edi"
mov 0(%edi), %edx
mov %edx, __TEMP32_0__
mov __TEMP32_0__, %eax
movb $0, __TEMP8_1__
cmp $480, %eax
setg __TEMP8_1__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_1__
# Reading property "y" in "__TEMP32_1__"
movl __TEMP32_1__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_2__
mov __TEMP32_2__, %eax
movb $0, __TEMP8_2__
cmp $0, %eax
setl __TEMP8_2__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_3__
# Reading property "y" in "__TEMP32_3__"
movl __TEMP32_3__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_4__
mov __TEMP32_4__, %eax
movb $0, __TEMP8_3__
cmp $360, %eax
setg __TEMP8_3__
# OR comparison
movb $0, __TEMP8_4__
cmpb $1, __TEMP8_0__
sete __TEMP8_4__
je __LABEL12__
cmpb $1, __TEMP8_1__
sete __TEMP8_4__
__LABEL12__:
# OR comparison
movb $0, __TEMP8_5__
cmpb $1, __TEMP8_4__
sete __TEMP8_5__
je __LABEL13__
cmpb $1, __TEMP8_2__
sete __TEMP8_5__
__LABEL13__:
# OR comparison
movb $0, __TEMP8_6__
cmpb $1, __TEMP8_5__
sete __TEMP8_6__
je __LABEL14__
cmpb $1, __TEMP8_3__
sete __TEMP8_6__
__LABEL14__:
cmpb $1, __TEMP8_6__
jne __LABEL15__
# Reading property "length" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
push %ecx
# Calling function exit_game
push %ecx
pushl $__STRING2__
call exit_game
mov %eax, %esi
add $8, %esp
pop %ecx
jmp __LABEL16__
__LABEL15__:
__LABEL16__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
render:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_render__, %esp
pusha
# Calling function gfx_clear
call gfx_clear
mov %eax, %ecx
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_checkEat_
# TODO optimize if variable just do movl
mov food, %edx
push %edx
call __method_Snake_checkEat_
mov %eax, %ecx
add $4, %esp
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_moveAndRender_
call __method_Snake_moveAndRender_
mov %eax, %ecx
movl food, %edx
mov %edx, __this__
# Calling function __method_Food_render_
call __method_Food_render_
mov %eax, %ecx
# Reading property "length" in "snake"
movl snake, %eax
mov 8(%eax), %edx
mov %edx, %ecx
push %ecx
call itos
add $4, %esp
push %eax
pushl $__STRING3__
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %esi
push %esi
push %ecx
# Calling function gfx_draw_text
push %esi
pushl $15
pushl $5
call gfx_draw_text
mov %eax, %edi
add $12, %esp
pop %ecx
pop %esi
mov 8(%ebp), %eax
mov $0, %cl
cmp $2, %eax
sete %cl
cmpb $1, %cl
jne __LABEL17__
mov gfx_keypress_key, %al
mov $0, %cl
cmp $97, %al
sete %cl
# Reading property "vx" in "snake"
movl snake, %eax
mov 0(%eax), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $5, %esi
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %cl
jne __LABEL19__
cmpb $1, __TEMP8_0__
sete __TEMP8_1__
__LABEL19__:
cmpb $1, __TEMP8_1__
jne __LABEL20__
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_setVelocity_
pushl $0
pushl $-5
call __method_Snake_setVelocity_
mov %eax, %ecx
add $8, %esp
jmp __LABEL21__
__LABEL20__:
mov gfx_keypress_key, %al
mov $0, %cl
cmp $100, %al
sete %cl
# Reading property "vx" in "snake"
movl snake, %eax
mov 0(%eax), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $-5, %esi
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %cl
jne __LABEL22__
cmpb $1, __TEMP8_0__
sete __TEMP8_1__
__LABEL22__:
cmpb $1, __TEMP8_1__
jne __LABEL23__
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_setVelocity_
pushl $0
pushl $5
call __method_Snake_setVelocity_
mov %eax, %ecx
add $8, %esp
jmp __LABEL21__
__LABEL23__:
mov gfx_keypress_key, %al
mov $0, %cl
cmp $119, %al
sete %cl
# Reading property "vy" in "snake"
movl snake, %eax
mov 4(%eax), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $5, %esi
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %cl
jne __LABEL24__
cmpb $1, __TEMP8_0__
sete __TEMP8_1__
__LABEL24__:
cmpb $1, __TEMP8_1__
jne __LABEL25__
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_setVelocity_
pushl $-5
pushl $0
call __method_Snake_setVelocity_
mov %eax, %ecx
add $8, %esp
jmp __LABEL21__
__LABEL25__:
mov gfx_keypress_key, %al
mov $0, %cl
cmp $115, %al
sete %cl
# Reading property "vy" in "snake"
movl snake, %eax
mov 4(%eax), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $-5, %esi
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %cl
jne __LABEL26__
cmpb $1, __TEMP8_0__
sete __TEMP8_1__
__LABEL26__:
cmpb $1, __TEMP8_1__
jne __LABEL27__
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_setVelocity_
pushl $5
pushl $0
call __method_Snake_setVelocity_
mov %eax, %ecx
add $8, %esp
jmp __LABEL21__
__LABEL27__:
__LABEL21__:
jmp __LABEL18__
__LABEL17__:
mov 8(%ebp), %eax
mov $0, %cl
cmp $12, %eax
sete %cl
cmpb $1, %cl
jne __LABEL28__
# Calling function usleep
pushl $50000
call usleep
mov %eax, %ecx
add $4, %esp
# Calling function gfx_redraw
call gfx_redraw
mov %eax, %ecx
jmp __LABEL18__
__LABEL28__:
__LABEL18__:
call __rc_quick_check__
popa
mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Snake_1_
pushl $10
call __constructor_Snake_1_
mov %eax, %ecx
add $4, %esp
# requesting ownership for snake (set)
lea snake, %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function __constructor_Food_0_
call __constructor_Food_0_
mov %eax, %ecx
# requesting ownership for food (set)
lea food, %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Calling function gfx_setup
pushl $360
pushl $480
call gfx_setup
mov %eax, %ecx
add $8, %esp
lea render, %ecx
push %ecx
# Calling function gfx_begin
push %ecx
call gfx_begin
mov %eax, %esi
add $4, %esp
pop %ecx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
