/* Assemble with scripts/lima_x11.sh */

#include sys x11

create size <- 20;
__ccalled__ render function<u32 event> -> u32
{
    gfx_clear();
    if(event == ButtonPress)
    {
        size <- (size + 10);
        gfx_mouse_x <- (gfx_mouse_x - 5);
        gfx_mouse_y <- (gfx_mouse_y - 5);
    } 
    elif(event == ButtonRelease)
    {
        size <- (size - 10);
        
    }
    gfx_draw_rect((gfx_mouse_x - 10),(gfx_mouse_y - 10),size,size);
}

entry function<> -> u32
{
    gfx_setup(500, 360);
    gfx_begin($render);
}