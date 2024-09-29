
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
vx: .4byte 1
vy: .4byte 0
length: .4byte 5
snake: .4byte 0
__ALLOCFOR_entry__ = 0
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
mov $0, %ebx
mov %ebx, snake
ret
###################################

main:
    call __init__
    call entry
    ret

###################################
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
# Asked for length allocations of "Position"
mov $4, %edx
mov length, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %ebx
# requesting ownership for snake (set)
lea snake, %eax
push %eax
push %ebx
call __rc_requestOwnership__
add $8, %esp
mov snake, %eax
mov 0(%eax), %ebx
movl $240, 0(%ebx)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
