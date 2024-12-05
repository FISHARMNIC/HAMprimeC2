.section .note.GNU-stack,"",@progbits
.data
__rc_triggerSegfaultOnNullOwnership__: .byte 0
__PRINT_TYPE_INT__: .asciz "%i\n"
__PRINT_TYPE_PTR__: .asciz "%p\n"
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 

.global __this__
.global __xmm_sse_temp__
.global ___TEMPORARY_OWNER___
.global __rc_triggerSegfaultOnNullOwnership__
.global __PRINT_TYPE_INT__
.global __PRINT_TYPE_PTR__
.global __gc_dontClear__
