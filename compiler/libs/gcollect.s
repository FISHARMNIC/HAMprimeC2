.data

__rc_transfer_error__: .asciz "[Roll-Call Error] Could not transfer reference %p\n"
//_e_: .asciz "Setting ownership @%p: %i\n"
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

    popa
    mov %ebp, %esp
    pop %ebp

    ret

__rc_transferOrCopyIfNoOwner__:
    push %ebp
    mov %esp, %ebp
    pusha

    /*
    8(%ebp)  : memory buffer
    12(%ebp) : owner
    */

    mov 8(%ebp), %ebx # buffer
    mov -4(%ebx), %eax # entry reference 

    cmpl $0, (%eax) # check if no owner

    /* 
        if there is already an owner, duplicate the data 
        if there is no owner, then simply transfer ownership
    */
    jne 0f 
        /* if yes owner */
        mov %ebx, %esi
        mov (%esi), %ecx
        mov -4(%ecx), %ecx
        pushl 8(%ecx)
        call __rc_allocate__
        pop %ecx
        mov %eax, %edi
        rep movsb
        mov %eax, 8(%ebp) # load buffer param
    
    0:      

    call __rc_requestOwnership__ # params already in stack, just own the data     

    popa
    mov %ebp, %esp
    pop %ebp
