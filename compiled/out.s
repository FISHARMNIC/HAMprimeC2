
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
.type	__constructor_Person_0_, @function
__ALLOCFOR___constructor_Person_0___ = 0
__SIZEOF_Person__ = 12
# format "Person" includes:
#   - PROPERTY (u32) ssn
#   - PROPERTY (p8) name
#   - PROPERTY (u32) age
#   - CNSTRCTR __constructor_Person_0_ (2 parameters)
.type	entry, @function
.4byte 5
__STRING0__: .asciz "Nico"
.4byte 5
__STRING1__: .asciz " is "
.4byte 12
__STRING2__: .asciz " years old."
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
__constructor_Person_0_:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR___constructor_Person_0___, %esp

# Allocate for THIS
pushl $0
mov $__SIZEOF_Person__, %edx
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
# Reading property "name" in "__this__"
movl __this__, %eax
mov 8(%ebp), %edx
mov %edx, 4(%eax)
# requesting ownership for __this__ (property)
lea 4(%eax), %eax
push %eax
push 8(%ebp)
call __rc_requestOwnership__
add $8, %esp
# Reading property "age" in "__this__"
movl __this__, %eax
mov 12(%ebp), %edx
mov %edx, 8(%eax)
# Calling function rand
call rand
mov %eax, %ecx
mov %ecx, %eax
mov $100, %ebx
xor %edx, %edx
div %ebx
mov %edx, %eax
mov %eax, %esi
# Reading property "ssn" in "__this__"
movl __this__, %eax
mov %esi, 0(%eax)
movl __this__, %eax
call __rc_quick_check__

mov %ebp, %esp
pop %ebp
ret
entry:
push %ebp
mov %esp, %ebp
sub $__ALLOCFOR_entry__, %esp

# Calling function __constructor_Person_0_
pushl $18
# converting conststr to string (function call)
pushl $__STRING0__
call cptos
mov %eax, (%esp) # str is alr in stack just overwrite
call __constructor_Person_0_
mov %eax, %ecx
add $8, %esp
# Loading local variable "person" @-4(%ebp)
mov %ecx, -4(%ebp)
# requesting ownership for person (create)
lea -4(%ebp), %eax
push %eax
push %ecx
call __rc_requestOwnership__
add $8, %esp
# Reading property "name" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 4(%eax), %edx
mov %edx, %ecx
# Reading property "age" in "-4(%ebp)"
movl -4(%ebp), %eax
mov 8(%eax), %edx
mov %edx, %esi
pushw __disable_gc__; movw $1, __disable_gc__
pushl $__STRING2__
push %esi
call itos
add $4, %esp
push %eax
pushl $__STRING1__
push %ecx
pushl $4
call strjoinmany
add $20, %esp
mov %eax, %edi
popw __disable_gc__
push %edi
call puts
add $4, %esp
mov $0, %eax
push %eax
call __rc_free_all__
pop %eax

mov %ebp, %esp
pop %ebp
ret
call __rc_free_all__
mov  $0, %eax

mov %ebp, %esp
pop %ebp
ret
# person: 4
