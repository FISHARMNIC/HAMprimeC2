.data

__rc_transfer_error__: .asciz "** [Roll-Call Error] Could not transfer reference %p\n"
__rc_transfer_nullOwnership__: .asciz "** [Roll-Call Warning] Attempting to own null pointer\n   ** Most likely attempting to set a dynamic to value 0\n"

//_e_: .asciz "Setting ownership @%p: %i\n"
.globl __rc_requestOwnership__
.text

/*
entry_reference struct
{
    void *owner
    int restricted
    int size
    void *pointer
}
*/


__rc_requestOwnership__:
    push %ebp
    mov %esp, %ebp
    pusha
    /*
    @8:  buffer
    @12: address of owner
    */

    mov 8(%ebp), %ebx         # buffer pointer

    cmp $0, %ebx              # requesting null ownership
    jne 2f
        mov 12(%ebp), %ecx           # get address of owner
        mov %ebx, (%ecx)             # load owner with data

        cmpb $1, __rc_triggerSegfaultOnNullOwnership__
        jne 3f
                push $__rc_transfer_nullOwnership__
                call printf
                movb $0, 0 # trigger segfault when __rc_triggerSegfaultOnNullOwnership__ is enabled
    2:

    mov -4(%ebx), %eax        # get entry reference pointer

    cmpl $0, (%eax)           # if owner yet (0 = no owner)
    je 0f
        cmpl $0, 4(%eax)   
        je 1f                   # if restricted throw error (0 = no restriction)
            push %ebx
            push $__rc_transfer_error__
            call printf
            add $8, %esp
            movl $0, 0 # segfault for tracing
            //push $1
            //call exit            # force exit
        1:
    0:

    mov 12(%ebp), %ecx           # get address of owner
    mov %ebx, (%ecx)             # load owner with data
    mov %ecx, (%eax)             # set .owner

    // pusha
    // push %eax
    // pushl (%eax)
    // pushl $_e_
    // call printf
    // add $12, %esp
    // popa

    3:
    popa
    mov %ebp, %esp
    pop %ebp

    ret


