
.1byte = .byte
######## Auto included libs #######

###################################
.data
.align 4

######## user data section ########
.extern gfx_mouse_x
.extern gfx_mouse_y
.extern gfx_mouse_button
.extern gfx_keypress_keycode
.extern gfx_keypress_key
size: .4byte 20
__ALLOCFOR_render__ = 0
__ALLOCFOR_entry__ = 0
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:

ret
###################################

main:
    call __init__
    call entry
    ret

###################################
render:
push %ebp
mov %esp, %ebp
pusha
sub $__ALLOCFOR_render__, %esp
# Calling function gfx_clear
call gfx_clear
mov %eax, %ebx
mov 8(%ebp), %eax
movb $0, %bl
cmp $4, %eax
sete %bl
cmpb $1, %bl
jne __LABEL0__
xor %eax, %eax
mov size, %eax
add $10, %eax
mov %eax, %ebx
mov %ebx, size
xor %eax, %eax
mov gfx_mouse_x, %eax
sub $5, %eax
mov %eax, %ebx
mov %ebx, gfx_mouse_x
xor %eax, %eax
mov gfx_mouse_y, %eax
sub $5, %eax
mov %eax, %ebx
mov %ebx, gfx_mouse_y
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
mov 8(%ebp), %eax
movb $0, %bl
cmp $5, %eax
sete %bl
cmpb $1, %bl
jne __LABEL2__
xor %eax, %eax
mov size, %eax
sub $10, %eax
mov %eax, %ebx
mov %ebx, size
jmp __LABEL3__
__LABEL2__:
__LABEL3__:
xor %eax, %eax
mov gfx_mouse_x, %eax
sub $10, %eax
mov %eax, %ebx
push %ebx
xor %eax, %eax
mov gfx_mouse_y, %eax
sub $10, %eax
mov %eax, %ecx
pop %ebx
push %ebx
push %ecx
# Calling function gfx_rect
mov size, %edx
push %edx
mov size, %edx
push %edx
push %ecx
push %ebx
call gfx_rect
mov %eax, %esi
add $16, %esp
pop %ebx
pop %ecx
popa
mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp

sub $__ALLOCFOR_entry__, %esp
mov $render, %ebx
push %ebx
# Calling function gfx_begin
push %ebx
pushl $360
pushl $500
call gfx_begin
mov %eax, %ecx
add $12, %esp
pop %ebx

mov %ebp, %esp
pop %ebp
ret
