
function:
    push %ebp
    mov %esp, %ebp

    // stuff

    mov %ebp, %esp
    pop %ebp
    ret


main:
    call function
    ret

/*
* call pushes instruction pointer to stack, jumps to function
* function pushes current frame to stack 
* moves new frame
* restores old frame

Accessing the frame bounds of MAIN from FUNCTION:
    (%ebp) = old frame start

    old frame end is at the old esp 

    %ebp + 8  = old frame end
    
    note that: (%ebp) > %ebp + 8
    so: start > end
    
*/