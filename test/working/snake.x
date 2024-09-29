/* Assemble with scripts/lima_x11.sh */

/*
THIS PROGRAM IS NOT WORKING IT IS A WIP
*/

#include sys x11


Position format
{
    .x u32;
    .y u32;
}

create vx <- 1;
create vy <- 0;

create length <- 5;
create snake <- Position:borrowed:(0);

/*
__ccalled__ render function<u32 event> -> u32
{
    //gfx_clear();

    //snake[0].x <- snake[0].x + vx;
    //snake[0].y <- snake[0].y + vy;
    //gfx_draw_rect(snake[0].x, snake[0].y, 5, 5);

    if(event == KeyPress)
    {
        if(gfx_keypress_key == 'a')
        {
            vx <- -1;
            vy <- 0;
        }
        elif(gfx_keypress_key == 'd')
        {
            vx <- 1;
            vy <- 0;
        }
        elif(gfx_keypress_key == 'w')
        {
            vx <- 0;
            vy <- -1;
        }
        elif(gfx_keypress_key == 's')
        {
            vx <- 0;
            vy <- 1;
        }
    } 
    elif(event == Expose) 
    {
        gfx_redraw();
    }
}
*/

entry function<> -> u32
{   
    snake <- Position[length];
    // SEE NOTES IN MAIN WHY THIS IS SEGFAULTING
    snake[0].x <- 240;
    //snake[0].y <- 180;

    // gfx_setup(480, 360);
    // gfx_begin($render);
}