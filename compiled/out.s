
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
.type	__constructor_MapEntry_0_, @function
__ALLOCFOR___constructor_MapEntry_0___ = 0
__SIZEOF_MapEntry__ = 12
# format "MapEntry" includes:
#   - PROPERTY (p8) key
#   - PROPERTY (u32) value
#   - PROPERTY (p0) next
#   - CNSTRCTR __constructor_MapEntry_0_ (2 parameters)
.type	__constructor_Map_1_, @function
__ALLOCFOR___constructor_Map_1___ = 0
.type	__method_Map_kneErr_, @function
.4byte 5
__STRING0__: .asciz "Key<"
.4byte 17
__STRING1__: .asciz "> does not exist"
__ALLOCFOR___method_Map_kneErr___ = 0
.type	__method_Map_find_, @function
.4byte 10
__STRING2__: .asciz "Map empty"
__ALLOCFOR___method_Map_find___ = 4
.type	__method_Map_remove_, @function
__ALLOCFOR___method_Map_remove___ = 4
.type	__method_Map_set_, @function
__ALLOCFOR___method_Map_set___ = 4
.type	__method_Map_get_, @function
__ALLOCFOR___method_Map_get___ = 4
.type	__operator_Map_index_set_, @function
__ALLOCFOR___operator_Map_index_set___ = 0
.type	__operator_Map_index_get_, @function
__ALLOCFOR___operator_Map_index_get___ = 0
__SIZEOF_Map__ = 8
# format "Map" includes:
#   - PROPERTY (p0) head
#   - PROPERTY (p0) rlast
#   - CNSTRCTR __constructor_Map_1_ (0 parameters)
.type	entry, @function
.4byte 4
__STRING3__: .asciz "bob"
.4byte 4
__STRING4__: .asciz "jon"
.4byte 5
__STRING5__: .asciz "mike"
.4byte 4
__STRING6__: .asciz "joe"
__ALLOCFOR_entry__ = 4
__TEMP8_0__: .1byte 0
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
__constructor_MapEntry_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_MapEntry_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_MapEntry__, %edx
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
# Reading property "key" in "__this__"
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push 8(%ebp)
call __rc_requestOwnership__
add $8, %esp
# Reading property "value" in "__this__"
movl __this__, %eax
mov 12(%ebp), %edx
mov %edx, 4(%eax)
# Reading property "next" in "__this__"
movl __this__, %eax
movl $0, 8(%eax)
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__constructor_Map_1_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Map_1___, %esp

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
# Reading property "head" in "__this__"
movl __this__, %eax
movl $0, 0(%eax)
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Map_kneErr_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_kneErr___, %esp

pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING1__
push 8(%ebp)
pushl $__STRING0__
pushl $3
call strjoinmany
add $16, %esp
mov %eax, %ecx
popw __disable_gc__
push %ecx
call puts
add $4, %esp
# Calling function __rc_free_all__
call __rc_free_all__
mov %eax, %ecx
# Calling function exit
pushl $0
call exit
mov %eax, %ecx
add $4, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Map_find_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_find___, %esp

# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL0__
pushl $__STRING2__
call puts
add $4, %esp
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL1__
__LABEL0__:
__LABEL1__:
# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Loading local variable "reference" @-4(%ebp)
mov %ecx, -4(%ebp)
__LABEL2__:
# Reading property "key" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 0(%eax), %edx
mov %edx, %ecx
push %ecx
push %ecx
push 8(%ebp)
call strcmp
add $8, %esp
pop %ecx
movb $0, __TEMP8_0__
cmp $0, %eax
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL3__
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL4__
# Reading property "rlast" in "__this__"
movl __this__, %eax
mov -4(%ebp), %edx
mov %edx, 4(%eax)
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL5__
__LABEL4__:
__LABEL5__:
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
mov %ecx, -4(%ebp)
jmp __LABEL2__
__LABEL3__:
mov -4(%ebp), %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# reference: 4
__method_Map_remove_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_remove___, %esp

# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "key" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
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
jne __LABEL6__
# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
mov 8(%ecx), %edx
mov %edx, %esi
# Reading property "head" in "__this__"
movl __this__, %eax
mov %esi, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL7__
__LABEL6__:
__LABEL7__:
# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
mov 8(%ecx), %edx
mov %edx, %esi
movb $0, __TEMP8_0__
cmp $0, %esi
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL8__
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_kneErr_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_kneErr_
mov %eax, %ecx
add $4, %esp
popl __this__
jmp __LABEL9__
__LABEL8__:
__LABEL9__:
# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
# Loading local variable "reference" @-4(%ebp)
mov %ecx, -4(%ebp)
__LABEL10__:
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
# Reading property "key" in "%ecx"
mov 0(%ecx), %edx
mov %edx, %esi
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
setne __TEMP8_0__
# comparison for WHILE loop
cmpb $1, __TEMP8_0__
jne __LABEL11__
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
mov %ecx, -4(%ebp)
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL12__
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_kneErr_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_kneErr_
mov %eax, %ecx
add $4, %esp
popl __this__
jmp __LABEL13__
__LABEL12__:
__LABEL13__:
jmp __LABEL10__
__LABEL11__:
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %ecx
# Reading property "next" in "%ecx"
mov 8(%ecx), %edx
mov %edx, %esi
# Reading property "next" in "-4(%ebp)"
movl -4(%ebp), %eax
mov %esi, 8(%eax)
# requesting ownership for -4(%ebp) (property)
lea 8(%eax), %eax
push %eax
push %esi
call __rc_requestOwnership__
add $8, %esp
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# reference: 4
__method_Map_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_set___, %esp

# Reading property "head" in "__this__"
movl __this__, %eax
mov 0(%eax), %edx
mov %edx, %ecx
movb $0, __TEMP8_0__
cmp $0, %ecx
sete __TEMP8_0__
cmpb $1, __TEMP8_0__
jne __LABEL14__
pushl __this__
# Calling function __constructor_MapEntry_0_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_MapEntry_0_
mov %eax, %ecx
add $8, %esp
popl __this__
# Reading property "head" in "__this__"
movl __this__, %eax
mov %ecx, 0(%eax)
# requesting ownership for __this__ (property)
lea 0(%eax), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL15__
__LABEL14__:
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_find_
mov %eax, %ecx
add $4, %esp
popl __this__
# Loading local variable "reference" @-4(%ebp)
mov %ecx, -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl
jne __LABEL17__
pushl __this__
# Calling function __constructor_MapEntry_0_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __constructor_MapEntry_0_
mov %eax, %ecx
add $8, %esp
popl __this__
# Reading property "rlast" in "__this__"
movl __this__, %eax
mov 4(%eax), %edx
mov %edx, %esi
# Reading property "next" in "%esi"
mov %ecx, 8(%esi)
# requesting ownership for %esi (property)
lea 8(%esi), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
jmp __LABEL18__
__LABEL17__:
# Reading property "value" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 12(%ebp), %edx
mov %edx, 4(%eax)
jmp __LABEL18__
__LABEL19__:
__LABEL18__:
jmp __LABEL15__
__LABEL16__:
__LABEL15__:
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__method_Map_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___method_Map_get___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_find_
mov %eax, %ecx
add $4, %esp
popl __this__
# Loading local variable "found" @-4(%ebp)
mov %ecx, -4(%ebp)
mov -4(%ebp), %eax
mov $0, %cl
cmp $0, %eax
sete %cl
cmpb $1, %cl
jne __LABEL20__
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_kneErr_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_kneErr_
mov %eax, %ecx
add $4, %esp
popl __this__
mov $0, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
jmp __LABEL21__
__LABEL20__:
__LABEL21__:
pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_find_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_find_
mov %eax, %ecx
add $4, %esp
popl __this__
# Reading property "value" in "%ecx"
mov 4(%ecx), %edx
mov %edx, %esi
mov %esi, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
# found: 4
__operator_Map_index_set_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Map_index_set___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_set_
# TODO optimize if variable just do movl
mov 12(%ebp), %edx
push %edx
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_set_
mov %eax, %ecx
add $8, %esp
popl __this__
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
__operator_Map_index_get_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___operator_Map_index_get___, %esp

pushl __this__
movl __this__, %edx
mov %edx, __this__
# Calling function __method_Map_get_
# TODO optimize if variable just do movl
mov 8(%ebp), %edx
push %edx
call __method_Map_get_
mov %eax, %ecx
add $4, %esp
popl __this__
mov %ecx, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Map_1_
call __constructor_Map_1_
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
pushl $123
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_get_
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_
mov %eax, %ecx
add $4, %esp
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $456
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_get_
# converting conststr to string (function call)
pushl $__STRING3__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_
mov %eax, %ecx
add $4, %esp
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $789
# converting conststr to string (function call)
pushl $__STRING4__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_get_
# converting conststr to string (function call)
pushl $__STRING4__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_
mov %eax, %ecx
add $4, %esp
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $321
# converting conststr to string (function call)
pushl $__STRING5__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_get_
# converting conststr to string (function call)
pushl $__STRING5__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_
mov %eax, %ecx
add $4, %esp
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_set_
pushl $654
# converting conststr to string (function call)
pushl $__STRING6__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_set_
mov %eax, %ecx
add $8, %esp
mov -4(%ebp), %edx
mov %edx, __this__
# Calling function __operator_Map_index_get_
# converting conststr to string (function call)
pushl $__STRING6__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __operator_Map_index_get_
mov %eax, %ecx
add $4, %esp
push %ecx
pushl $__PRINT_TYPE_INT__
call printf
add $8, %esp
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# map: 4
