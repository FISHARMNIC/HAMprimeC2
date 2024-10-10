
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
__ALLOCFOR___operator_Map_index_set___ = 4
__ALLOCFOR___operator_Map_index_get___ = 4
__SIZEOF_Map__ = 16
# format "Map" includes:
#   - PROPERTY (u32) allocatedSize
#   - PROPERTY (u32) occupiedSize
#   - PROPERTY (p8) keys
#   - PROPERTY (u32) values
#   - CNSTRCTR __constructor_Map_0_ (0 parameters)
.4byte 5
__STRING0__: .asciz "Nico"
.4byte 4
__STRING1__: .asciz "ABC"
.4byte 4
__STRING2__: .asciz "Dad"
.4byte 4
__STRING3__: .asciz "Rio"
.4byte 8
__STRING4__: .asciz "NicoABC"
.4byte 11
__STRING5__: .asciz "%i %i %i\n"
__ALLOCFOR_entry__ = 4
__TEMP8_0__: .1byte 0
__TEMP32_0__: .4byte 0
__TEMP32_1__: .4byte 0
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
# Reading property "allocatedSize" in "__this__"
movl __this__, %eax
movl $10, 0(%eax)
# Reading property "occupiedSize" in "__this__"
movl __this__, %eax
movl $0, 4(%eax)
push %ecx
# Asked for 10 allocations of "conststr"
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
push %ecx
# Asked for 10 allocations of "u32"
pushl $0
pushl $40
call __rc_allocate__
add $8, %esp
pop %ecx
mov %eax, %ecx
# Reading property "values" in "__this__"
movl __this__, %eax
mov %ecx, 12(%eax)
# requesting ownership for __this__ (property)
lea 12(%eax), %eax
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

# Reading property "occupiedSize" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
# Loading local variable "occupiedSize" @-4(%ebp)
mov %ecx, -4(%ebp)
# Reading property "allocatedSize" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
mov -4(%ebp), %eax
movb $0, __TEMP8_0__
cmp %ecx, %eax
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL0__
# Reading property "allocatedSize" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
mov %ecx, %eax
mov $2, %ebx
mul %ebx
mov %eax, %esi
# Reading property "allocatedSize" in "__this__"
movl __this__, %eax
mov %esi, 0(%eax)
# Reading property "allocatedSize" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Asked for %ecx allocations of "conststr"
mov $4, %edx
mov %ecx, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %esi
# Reading property "keys" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %edi
# realloc buffer
push %edi
push %esi
call __copydata__
add $8, %esp
mov %eax, __TEMP32_0__
# Reading property "keys" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 8(%eax)
# requesting ownership for __this__ (property)
lea 8(%eax), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
# Reading property "allocatedSize" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Asked for %ecx allocations of "u32"
mov $4, %edx
mov %ecx, %eax
mul %edx
pushl $0
push %eax
call __rc_allocate__
add $8, %esp
mov %eax, %esi
# Reading property "values" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %edi
# realloc buffer
push %edi
push %esi
call __copydata__
add $8, %esp
mov %eax, __TEMP32_0__
# Reading property "values" in "__this__"
movl __this__, %eax
movl __TEMP32_0__, %edx
mov %edx, 12(%eax)
# requesting ownership for __this__ (property)
lea 12(%eax), %eax
push %eax
push __TEMP32_0__
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
# Reading property "keys" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
#Array set begin
mov 8(%ebp), %edx
# array load trash awful. Fix this bad optimize
push %ecx
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edx, (%eax)
#Set end
# Reading property "values" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
#Array set begin
mov 12(%ebp), %edx
# array load trash awful. Fix this bad optimize
push %ecx
mov -4(%ebp), %eax
shl $2, %eax
add (%esp), %eax
add $4, %esp
mov %edx, (%eax)
#Set end
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
# Reading property "occupiedSize" in "__this__"
movl __this__, %eax
mov %ecx, 4(%eax)
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# occupiedSize: 4
__operator_Map_index_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Map_index_get___, %esp

# Loading local variable "i" @-4(%ebp)
mov $0, %edx
mov %edx, -4(%ebp)
__LABEL2__:
# Reading property "occupiedSize" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %ecx
mov -4(%ebp), %eax
movb $0, __TEMP8_0__
cmp %ecx, %eax
setl __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL3__
# Reading property "keys" in "__this__"
movl __this__, %eax
mov 8(%eax), %edx
mov %edx, %ecx
#indexing array
mov %ecx, %eax
xor %esi, %esi
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
push %esi
push %ecx
push %esi
push 8(%ebp)
call strcmp
add $8, %esp
pop %ecx
pop %esi
movb $0, __TEMP8_0__
cmp $0, %eax
setz __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL4__
# Reading property "values" in "__this__"
movl __this__, %eax
mov 12(%eax), %edx
mov %edx, %ecx
#indexing array
mov %ecx, %eax
mov -4(%ebp), %edx
mov %edx, %edx
mov (%eax, %edx, 4), %esi
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL5__
__LABEL4__:
__LABEL5__:
mov -4(%ebp), %eax
add $1, %eax
mov %eax, %ecx
mov %ecx, -4(%ebp)
jmp __LABEL2__
__LABEL3__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# i: 4
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
pushl $__STRING1__
pushl $__STRING0__
pushl $2
call strjoinmany
add $12, %esp
mov %eax, %ecx
mov -4(%ebp), %edx
mov %edx, __this__
push %ecx
# Calling function __operator_Map_index_set_
pushl $123
push %ecx
call __operator_Map_index_set_
mov %eax, %esi
add $8, %esp
pop %ecx
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $456
pushl $__STRING2__
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $789
pushl $__STRING3__
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_get_
pushl $__STRING3__
call __operator_Map_index_get_
mov %eax, %ecx
add $4, %esp
mov -4(%ebp), %edx
mov %edx, __this__
push %ecx
# Calling function __operator_Map_index_get_
pushl $__STRING2__
call __operator_Map_index_get_
mov %eax, %esi
add $4, %esp
pop %ecx
mov -4(%ebp), %edx
mov %edx, __this__
push %esi
push %ecx
# Calling function __operator_Map_index_get_
pushl $__STRING4__
call __operator_Map_index_get_
mov %eax, %edi
add $4, %esp
pop %ecx
pop %esi
push %esi
push %ecx
push %edi
# Calling function printf
push %edi
push %esi
push %ecx
pushl $__STRING5__
call printf
mov %eax, __TEMP32_0__
add $16, %esp
pop %edi
pop %ecx
pop %esi
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# map: 4
