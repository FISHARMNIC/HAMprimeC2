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

create vx <- 5;
create vy <- 0;

create length <- 5;
create snake <- Position:array:(0);


addNew function<u32 x, u32 y> -> u32
{
    snake[length] <- Position<x: x, y: y>;
}


__ccalled__ render function<u32 event> -> u32
{
    gfx_clear();

    create i <- length - 1;
    while(i :> 0)
    {
        gfx_draw_rect(snake[i].x, snake[i].y, 5, 5);
        snake[i].x <- snake[i - 1].x;
        snake[i].y <- snake[i - 1].y;
        i <- i - 1;
    }

    snake[0].x <- snake[0].x + vx;
    snake[0].y <- snake[0].y + vy;
    
    if(event == KeyPress)
    {
        if(gfx_keypress_key == 'a')
        {
            vx <- -5;
            vy <- 0;
        }
        elif(gfx_keypress_key == 'd')
        {
            vx <- 5;
            vy <- 0;
        }
        elif(gfx_keypress_key == 'w')
        {
            vx <- 0;
            vy <- -5;
        }
        elif(gfx_keypress_key == 's')
        {
            vx <- 0;
            vy <- 5;
        }
    } 
    elif(event == Expose) 
    {
        usleep(50000);
        gfx_redraw();
    }

}


entry function<> -> u32
{   
    snake <- Position[100];

    /* See note in main, trying to get rid of having to do this can just do snake[0].x */

    create i <- 0;
    while(i <: length)
    {
        snake[i] <- Position<x:240, y: 180>;
        i <- i + 1;
    }

    gfx_setup(480, 360);
    gfx_begin($render);
}