
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
__SIZEOF_Position__ = 8
# format "Position" includes:
#   - PROPERTY (u32) x
#   - PROPERTY (u32) y
vx: .4byte 5
vy: .4byte 0
length: .4byte 5
snake: .4byte 0
__ALLOCFOR_addNew__ = 0
__ALLOCFOR_render__ = 4
__ALLOCFOR_entry__ = 4
__TEMP32_0__: .4byte 0
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
ret
###################################

main:
    call __init__
    call entry
    ret

###################################
addNew:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_addNew__, %esp

# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Position
mov 8(%ebp), %edx
mov %edx, 0(%eax)
mov 12(%ebp), %edx
mov %edx, 4(%eax)
#Array set begin
mov snake, %eax
# array load trash awful. Fix this bad optimize
push %eax
mov length, %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %ebx, (%eax)
# requesting ownership for array index
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
render:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_render__, %esp
pusha
# Calling function gfx_clear
call gfx_clear
mov %eax, %ebx
xor %eax, %eax
mov length, %eax
sub $1, %eax
mov %eax, %ebx
# Loading local variable "i" @-4(%ebp)
mov %ebx, -4(%ebp)
__LABEL0__:
mov -4(%ebp), %eax
mov $0, %bl
cmp $0, %eax
setg %bl
cmpb $1, %bl
jne __LABEL1__
mov snake, %eax
xor %ebx, %ebx
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
mov snake, %eax
xor %esi, %esi
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
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
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
mov snake, %eax
xor %ecx, %ecx
mov (%eax, %ebx, 4), %ecx
mov 0(%ecx), %edx
mov %edx, %esi
mov snake, %eax
xor %edi, %edi
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %edi
mov %esi, 0(%edi)
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
mov snake, %eax
xor %ecx, %ecx
mov (%eax, %ebx, 4), %ecx
mov 4(%ecx), %edx
mov %edx, %esi
mov snake, %eax
xor %edi, %edi
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %edi
mov %esi, 4(%edi)
xor %eax, %eax
mov -4(%ebp), %eax
sub $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL0__
__LABEL1__:
mov snake, %eax
xor %ebx, %ebx
mov 0(%eax), %ebx
mov 0(%ebx), %edx
mov %edx, %ecx
push %ebx
push %ecx
xor %eax, %eax
mov %ecx, %eax
add vx, %eax
mov %eax, %esi
pop %ebx
pop %ecx
mov snake, %eax
xor %edi, %edi
mov 0(%eax), %edi
mov %esi, 0(%edi)
mov snake, %eax
xor %ebx, %ebx
mov 0(%eax), %ebx
mov 4(%ebx), %edx
mov %edx, %ecx
push %ebx
push %ecx
xor %eax, %eax
mov %ecx, %eax
add vy, %eax
mov %eax, %esi
pop %ebx
pop %ecx
mov snake, %eax
xor %edi, %edi
mov 0(%eax), %edi
mov %esi, 4(%edi)
mov 8(%ebp), %eax
mov $0, %bl
cmp $2, %eax
sete %bl
cmpb $1, %bl
jne __LABEL2__
mov gfx_keypress_key, %al
mov $0, %bl
cmp $97, %al
sete %bl
cmpb $1, %bl
jne __LABEL4__
movl $-5, vx
movl $0, vy
jmp __LABEL5__
__LABEL4__:
mov gfx_keypress_key, %al
mov $0, %bl
cmp $100, %al
sete %bl
cmpb $1, %bl
jne __LABEL6__
movl $5, vx
movl $0, vy
jmp __LABEL5__
__LABEL6__:
mov gfx_keypress_key, %al
mov $0, %bl
cmp $119, %al
sete %bl
cmpb $1, %bl
jne __LABEL7__
movl $0, vx
movl $-5, vy
jmp __LABEL5__
__LABEL7__:
mov gfx_keypress_key, %al
mov $0, %bl
cmp $115, %al
sete %bl
cmpb $1, %bl
jne __LABEL8__
movl $0, vx
movl $5, vy
jmp __LABEL5__
__LABEL8__:
__LABEL5__:
jmp __LABEL3__
__LABEL2__:
mov 8(%ebp), %eax
mov $0, %bl
cmp $12, %eax
sete %bl
cmpb $1, %bl
jne __LABEL9__
# Calling function usleep
pushl $50000
call usleep
mov %eax, %ebx
add $4, %esp
# Calling function gfx_redraw
call gfx_redraw
mov %eax, %ebx
jmp __LABEL3__
__LABEL9__:
__LABEL3__:
call __rc_quick_check__
popa
mov %ebp, %esp
pop %ebp
ret
# i: 4
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

push %ebx
# Asked for 100 allocations of "Position"
pushl $0
pushl $400
call __rc_allocate__
add $8, %esp
pop %ebx
mov %eax, %ebx
# requesting ownership for snake (set)
lea snake, %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
# Loading local variable "i" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL10__:
mov -4(%ebp), %eax
mov length, %edx
mov $0, %bl
cmp %edx, %eax
setl %bl
cmpb $1, %bl
jne __LABEL11__
# 
pushl $0
pushl $8
call __rc_allocate__
add $8, %esp
mov %eax, %ebx # Local allocation address for Position
movl $240, 0(%eax)
movl $180, 4(%eax)
#Array set begin
mov snake, %eax
# array load trash awful. Fix this bad optimize
push %eax
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %ebx, (%eax)
# requesting ownership for array index
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
#Set end
xor %eax, %eax
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ebx
mov %ebx, -4(%ebp)
jmp __LABEL10__
__LABEL11__:
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
# i: 4
