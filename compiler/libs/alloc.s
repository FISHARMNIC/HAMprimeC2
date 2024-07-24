.text

.macro __alloc_macro__
    push %ebp 
    mov $192, %eax    # mmap2
    xor %ebx, %ebx    # find own spot
    mov $0x7, %edx    # protection: PROT_READ|PROT_WRITE|PROT_EXEC
    mov $0x22, %esi   # flags: MAP_PRIVATE|MAP_ANONYMOUS
    mov $-1, %edi     # fd
    xor %ebp, %ebp    # offset
    int $0x80
    pop %ebp
.endm

__allocate__:
    push %ebp
    mov %esp, %ebp
    mov 8(%ebp), %ecx # length
    
    __alloc_macro__
    
    mov %ebp, %esp
    pop %ebp
    ret
    
__allocate_wsize__:
    push %ebp
    mov %esp, %ebp
    addl $4, 8(%ebp)  # size + 4, save in stack

    mov 8(%ebp), %ecx
    __alloc_macro__
    
    mov 8(%ebp), %ebx
    mov %ebx, (%eax) # mov size -> addr
    add $4, %eax      # addr + 4 <- header

    mov %ebp, %esp
    pop %ebp
    ret

// free, just called something else so it doesn't collide with C "free" and "malloc"
dispose:
    push %ebp
    mov %esp, %ebp

    movl 8(%esp), %ebx   # address
    mov -4(%ebx), %ecx # data header -> size
    mov $91, %eax      # munmap
    int $0x80          # free
    
    mov %ebp, %esp
    pop %ebp
    ret
