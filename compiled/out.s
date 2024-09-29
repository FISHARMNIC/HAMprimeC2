
.macro .1byte v
.byte \v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
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
.4byte 23
__STRING0__: .asciz " Your final score was "
__ALLOCFOR_exit_game__ = 0
__SIZEOF_Position__ = 8
# format "Position" includes:
#   - PROPERTY (u32) x
#   - PROPERTY (u32) y
__ALLOCFOR___method_Food_move___ = 8
__ALLOCFOR___constructor_Food_0___ = 0
__ALLOCFOR___method_Food_render___ = 0
__SIZEOF_Food__ = 4
# format "Food" includes:
#   - PROPERTY (p0) pos
#   - CNSTRCTR __constructor_Food_0_ (0 parameters)
__ALLOCFOR___constructor_Snake_1___ = 4
.4byte 5
__STRING1__: .asciz "Win!"
__ALLOCFOR___method_Snake_grow___ = 8
__ALLOCFOR___method_Snake_setVelocity___ = 0
__ALLOCFOR___method_Snake_checkEat___ = 0
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
.4byte 8
__STRING3__: .asciz "Score: "
__ALLOCFOR_render__ = 0
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
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
mov $0, %ebx
mov %ebx, snake
# requesting ownership for snake (create)
push $snake
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov $0, %ebx
mov %ebx, food
# requesting ownership for food (create)
push $food
push %ebx
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
mov %eax, %ebx
push %ebx
call puts
add $4, %esp
# Calling function exit
pushl $0
call exit
mov %eax, %ebx
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
mov %eax, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
mov $96, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov $5, %ebx
mul %ebx
mov %eax, %ecx
pop %ebx
# Loading local variable "rx" @-4(%ebp)
mov %ecx, -4(%ebp)
# Calling function rand
call rand
mov %eax, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
mov $72, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov $5, %ebx
mul %ebx
mov %eax, %ecx
pop %ebx
# Loading local variable "ry" @-8(%ebp)
mov %ecx, -8(%ebp)
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Position
mov -4(%ebp), %edx
mov %edx, 0(%eax)
mov -8(%ebp), %edx
mov %edx, 4(%eax)
movl __this__, %eax
mov %ebx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ebx
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
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Food_move_
call __method_Food_move_
mov %eax, %ebx
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Food_render_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Food_render___, %esp

movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
mov 4(%esi), %edx
mov %edx, %edi
push %ebx
push %esi
push %ecx
push %edi
# Calling function gfx_draw_rect
pushl $5
pushl $5
push %edi
push %ecx
call gfx_draw_rect
mov %eax, __TEMP32_0__
add $16, %esp
pop %edi
pop %ecx
pop %esi
pop %ebx
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
movl __this__, %eax
movl $5, 0(%eax)
movl __this__, %eax
movl $0, 4(%eax)
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 8(%eax)
push %ebx
# Asked for 100 allocations of "Position"
pushl $0
pushl $400
call __rc_allocate__
add $8, %esp
pop %ebx
mov %eax, %ebx
movl __this__, %eax
mov %ebx, 16(%eax)
# requesting ownership for __this__ (property)
lea 16(%eax), %eax
push %eax
push %ebx
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
mov %eax, %ebx # Local allocation address for Position
movl $240, 0(%eax)
movl $180, 4(%eax)
movl __this__, %eax
mov %ebx, 12(%eax)
# requesting ownership for __this__ (property)
lea 12(%eax), %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
__LABEL0__:
mov -4(%ebp), %eax
mov 8(%ebp), %edx
mov $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL1__
xor %eax, %eax
mov -4(%ebp), %eax
mov $5, %ebx
mul %ebx
mov %eax, %ebx
push %ebx
xor %eax, %eax
mov $235, %eax
sub %ebx, %eax
mov %eax, %ecx
pop %ebx
push %ebx
push %ecx
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
pop %ecx
pop %ebx
mov %eax, %esi # Local allocation address for Position
mov %ecx, 0(%eax)
movl $180, 4(%eax)
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
#Array set begin
# array load trash awful. Fix this bad optimize
push %edi
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %esi, (%eax)
# requesting ownership for array index
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
#Set end
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
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

movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
mov $0, %cl
cmp $100, %ebx
sete %cl
cmpb $1, %cl
jne __LABEL2__
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
# Calling function exit_game
push %ebx
pushl $__STRING1__
call exit_game
mov %eax, %ecx
add $8, %esp
pop %ebx
jmp __LABEL3__
__LABEL2__:
__LABEL3__:
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
sub $1, %eax
mov %eax, %ecx
pop %ebx
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
mov %esi, %eax
xor %edi, %edi
mov (%eax, %ecx, 4), %edi
mov 0(%edi), %edx
mov %edx, __TEMP32_0__
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_1__
push %ebx
push %ecx
push %esi
push %edi
xor %eax, %eax
mov __TEMP32_0__, %eax
sub __TEMP32_1__, %eax
mov %eax, __TEMP32_2__
pop %ebx
pop %ecx
pop %esi
pop %edi
# Loading local variable "x" @-4(%ebp)
movl __TEMP32_2__, %edx
mov %edx, -4(%ebp)
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
sub $1, %eax
mov %eax, %ecx
pop %ebx
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
mov %esi, %eax
xor %edi, %edi
mov (%eax, %ecx, 4), %edi
mov 4(%edi), %edx
mov %edx, __TEMP32_0__
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_1__
push %ebx
push %ecx
push %esi
push %edi
xor %eax, %eax
mov __TEMP32_0__, %eax
sub __TEMP32_1__, %eax
mov %eax, __TEMP32_2__
pop %ebx
pop %ecx
pop %esi
pop %edi
# Loading local variable "y" @-8(%ebp)
movl __TEMP32_2__, %edx
mov %edx, -8(%ebp)
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
pop %ebx
mov %eax, %ecx # Local allocation address for Position
mov -4(%ebp), %edx
mov %edx, 0(%eax)
mov -8(%ebp), %edx
mov %edx, 4(%eax)
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
#Array set begin
mov %ecx, (%esi, %ebx, 4) # bomboclat
# requesting ownership for array index
lea (%esi, %ebx, 4), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
#Set end
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
add $1, %eax
mov %eax, %ecx
pop %ebx
movl __this__, %eax
mov %ecx, 8(%eax)
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

movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
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

movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %esi
mov 0(%esi), %edx
mov %edx, %edi
movb $0, __TEMP8_0__
cmp %edi, %ecx
sete __TEMP8_0__
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_0__
movl __TEMP32_0__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_1__
movl 8(%ebp), %eax
mov 0(%eax), %edx
mov %edx, __TEMP32_2__
movl __TEMP32_2__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_3__
mov __TEMP32_1__, %eax
mov __TEMP32_3__, %edx
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
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Snake_grow_
call __method_Snake_grow_
mov %eax, %ebx
mov 8(%ebp), %edx
mov %edx, __this__
# Calling function __method_Food_move_
call __method_Food_move_
mov %eax, %ebx
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

movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %esi
mov 4(%esi), %edx
mov %edx, %edi
push %ebx
push %esi
push %ecx
push %edi
# Calling function gfx_draw_rect
pushl $5
pushl $5
push %edi
push %ecx
call gfx_draw_rect
mov %eax, __TEMP32_0__
add $16, %esp
pop %edi
pop %ecx
pop %esi
pop %ebx
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
mov %esi, %eax
xor %edi, %edi
mov 0(%eax), %edi
mov %ecx, 0(%edi)
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 4(%ebx), %edx
mov %edx, %ecx
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %esi
mov %esi, %eax
xor %edi, %edi
mov 0(%eax), %edi
mov %ecx, 4(%edi)
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
xor %eax, %eax
mov %ebx, %eax
sub $1, %eax
mov %eax, %ecx
pop %ebx
# Loading local variable "i" @-4(%ebp)
mov %ecx, -4(%ebp)
__LABEL7__:
mov -4(%ebp), %eax
mov $0, %bl
cmp $0, %eax
setg %bl
cmpb $1, %bl
jne __LABEL8__
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
xor %ecx, %ecx
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
mov 0(%ecx), %edx
mov %edx, %esi
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %edi
mov 0(%edi), %edx
mov %edx, __TEMP32_0__
mov __TEMP32_0__, %edx
movb $0, __TEMP8_0__
cmp %edx, %esi
sete __TEMP8_0__
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_1__
mov __TEMP32_1__, %eax
movw $0, __TEMP32_2__
# TEST DOES THIS WORK???
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_2__
movl __TEMP32_2__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_3__
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_4__
movl __TEMP32_4__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_5__
mov __TEMP32_3__, %eax
mov __TEMP32_5__, %edx
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
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
# Calling function exit_game
push %ebx
pushl $__STRING2__
call exit_game
mov %eax, %ecx
add $8, %esp
pop %ebx
jmp __LABEL11__
__LABEL10__:
__LABEL11__:
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %ebx
mov %ebx, %eax
xor %ecx, %ecx
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ecx
mov 0(%ecx), %edx
mov %edx, %esi
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %edi
mov %edi, %eax
movw $0, __TEMP32_0__
# TEST DOES THIS WORK???
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_0__
movl __TEMP32_0__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_1__
push %ebx
push %esi
push %ecx
push %edi
# Calling function gfx_draw_rect
pushl $5
pushl $5
# TODO optimize if variable just do movl
mov __TEMP32_1__, %edx
push %edx
push %esi
call gfx_draw_rect
mov %eax, __TEMP32_2__
add $16, %esp
pop %edi
pop %ecx
pop %esi
pop %ebx
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
xor %esi, %esi
mov (%eax, %ebx, 4), %esi
mov 0(%esi), %edx
mov %edx, %edi
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_0__
mov __TEMP32_0__, %eax
movw $0, __TEMP32_1__
# TEST DOES THIS WORK???
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_1__
movl __TEMP32_1__, %eax
mov %edi, 0(%eax)
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
xor %esi, %esi
mov (%eax, %ebx, 4), %esi
mov 4(%esi), %edx
mov %edx, %edi
movl __this__, %eax
mov 16(%eax), %edx
mov %edx, __TEMP32_0__
mov __TEMP32_0__, %eax
movw $0, __TEMP32_1__
# TEST DOES THIS WORK???
mov -4(%ebp), %edx
mov (%eax, %edx, 4), %edx
# END TEST
mov %edx, __TEMP32_1__
movl __TEMP32_1__, %eax
mov %edi, 4(%eax)
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL7__
__LABEL8__:
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %esi
push %ebx
push %ecx
push %esi
xor %eax, %eax
mov %ecx, %eax
add %esi, %eax
mov %eax, %edi
pop %ebx
pop %ecx
pop %esi
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_0__
movl __TEMP32_0__, %eax
mov %edi, 0(%eax)
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 4(%ebx), %edx
mov %edx, %ecx
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %esi
push %ebx
push %ecx
push %esi
xor %eax, %eax
mov %ecx, %eax
add %esi, %eax
mov %eax, %edi
pop %ebx
pop %ecx
pop %esi
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_0__
movl __TEMP32_0__, %eax
mov %edi, 4(%eax)
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
setl __TEMP8_0__
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %esi
mov 0(%esi), %edx
mov %edx, %edi
movb $0, __TEMP8_1__
cmp $480, %edi
setg __TEMP8_1__
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_0__
movl __TEMP32_0__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_1__
mov __TEMP32_1__, %eax
movb $0, __TEMP8_2__
cmp $0, %eax
setl __TEMP8_2__
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, __TEMP32_2__
movl __TEMP32_2__, %eax
mov 4(%eax), %edx
mov %edx, __TEMP32_3__
mov __TEMP32_3__, %eax
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
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
# Calling function exit_game
push %ebx
pushl $__STRING2__
call exit_game
mov %eax, %ecx
add $8, %esp
pop %ebx
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
mov %eax, %ebx
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_checkEat_
# TODO optimize if variable just do movl
mov food, %edx
push %edx
call __method_Snake_checkEat_
mov %eax, %ebx
add $4, %esp
movl snake, %edx
mov %edx, __this__
# Calling function __method_Snake_moveAndRender_
call __method_Snake_moveAndRender_
mov %eax, %ebx
movl food, %edx
mov %edx, __this__
# Calling function __method_Food_render_
call __method_Food_render_
mov %eax, %ebx
movl snake, %eax
mov 8(%eax), %edx
mov %edx, %ebx
push %ebx
call itos
add $4, %esp
push %eax
pushl $__STRING3__
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
push %ebx
push %ecx
# Calling function gfx_draw_text
push %ecx
pushl $15
pushl $5
call gfx_draw_text
mov %eax, %esi
add $12, %esp
pop %ecx
pop %ebx
mov 8(%ebp), %eax
mov $0, %bl
cmp $2, %eax
sete %bl
cmpb $1, %bl
jne __LABEL17__
mov gfx_keypress_key, %al
mov $0, %bl
cmp $97, %al
sete %bl
movl snake, %eax
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $5, %ecx
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %bl
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
mov %eax, %ebx
add $8, %esp
jmp __LABEL21__
__LABEL20__:
mov gfx_keypress_key, %al
mov $0, %bl
cmp $100, %al
sete %bl
movl snake, %eax
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $-5, %ecx
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %bl
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
mov %eax, %ebx
add $8, %esp
jmp __LABEL21__
__LABEL23__:
mov gfx_keypress_key, %al
mov $0, %bl
cmp $119, %al
sete %bl
movl snake, %eax
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $5, %ecx
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %bl
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
mov %eax, %ebx
add $8, %esp
jmp __LABEL21__
__LABEL25__:
mov gfx_keypress_key, %al
mov $0, %bl
cmp $115, %al
sete %bl
movl snake, %eax
mov 4(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $-5, %ecx
setne __TEMP8_0__
# AND comparison
movb $0, __TEMP8_1__
cmpb $1, %bl
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
mov %eax, %ebx
add $8, %esp
jmp __LABEL21__
__LABEL27__:
__LABEL21__:
jmp __LABEL18__
__LABEL17__:
mov 8(%ebp), %eax
mov $0, %bl
cmp $12, %eax
sete %bl
cmpb $1, %bl
jne __LABEL28__
# Calling function usleep
pushl $50000
call usleep
mov %eax, %ebx
add $4, %esp
# Calling function gfx_redraw
call gfx_redraw
mov %eax, %ebx
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
mov %eax, %ebx
add $4, %esp
# requesting ownership for snake (set)
lea snake, %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Calling function __constructor_Food_0_
call __constructor_Food_0_
mov %eax, %ebx
# requesting ownership for food (set)
lea food, %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Calling function gfx_setup
pushl $360
pushl $480
call gfx_setup
mov %eax, %ebx
add $8, %esp
lea render, %ebx
push %ebx
# Calling function gfx_begin
push %ebx
call gfx_begin
mov %eax, %ecx
add $4, %esp
pop %ebx
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
