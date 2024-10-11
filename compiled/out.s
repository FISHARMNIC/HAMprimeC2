
.section .note.GNU-stack,"",@progbits
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
__ALLOCFOR___constructor_Map_0___ = 0
__ALLOCFOR___operator_Map_index_set___ = 0
__SIZEOF_Map__ = 16
# format "Map" includes:
#   - PROPERTY (u32) allocatedSize
#   - PROPERTY (u32) occupiedSize
#   - PROPERTY (p8) keys
#   - PROPERTY (p32) values
#   - CNSTRCTR __constructor_Map_0_ (0 parameters)
.4byte 4
__STRING0__: .asciz "Dad"
__ALLOCFOR_entry__ = 4
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
__constructor_Map_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Map_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Map__, %edx
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
# Reading property "occupiedSize" in "__this__"
movl __this__, %eax
movl $0, 4(%eax)
push %ecx
# Asked for 10 allocations of "string"
pushl $0
pushl $40
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %ecx
# Reading property "keys" in "__this__"
movl __this__, %eax
mov %ecx, 8(%eax)
# requesting ownership for __this__ (property)
lea 8(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Map_index_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Map_index_set___, %esp

push 8(%ebp)
call puts
add $4, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Map_0_
call __constructor_Map_0_
mov %eax, %ecx
# Loading local variable "map" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for map (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $456
# converting conststr to string (function call)
pushl $__STRING0__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# map: 4
