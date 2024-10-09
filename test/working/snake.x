/* Assemble with scripts/lima_x11.sh */

#include sys x11

exit_game function<conststr message, u32 score> -> u32
{
    print_(message + " Your final score was " + score);
    exit(0);
}

Position format
{
    .x u32;
    .y u32;
}

Food format
{
    .pos Position;
    
    .move method<> -> Position
    {
        /* Generate in multiples of 4, 480 / 5 = 96 */
        create rx <- rand() % 96 * 5;
        create ry <- rand() % 72 * 5;

        /* same issue as above. I shouldn't have to allocate here. Should just be able to use this.pos.x */
        this.pos <- Position<x: rx, y: ry>;
    }

    .Food constructor<>
    {
        this.move();
    }

    .render method<> -> u32
    {
        gfx_draw_rect(this.pos.x, this.pos.y, 5, 5);
    }
}

Snake format
{
    .vx u32;
    .vy u32;

    .length u32;

    .head Position;
    .nodes Position:array;

    .Snake constructor<u32 startingSz> -> u32
    {
        this.vx <- 5;
        this.vy <- 0;

        this.length <- startingSz;

        this.nodes <- Position[100];

        create i <- 0;

        this.head <- Position<x: 240, y: 180>;

        while(i <: startingSz)
        {
            this.nodes[i] <- Position<x:(235 - (i * 5)), y: 180>;
            i <- i + 1;
        }
    }

    .grow method<> -> u32
    {
        if(this.length == 100)
        {
            exit_game("Win!", this.length);
        }

        /* Issue, can't do this all on one line */
        create x <- (this.nodes[this.length - 1].x - this.vx);
        create y <- (this.nodes[this.length - 1].y - this.vy);

        this.nodes[this.length] <- Position<x: x, y: y>;
        this.length <- this.length + 1;
    }

    .setVelocity method<u32 x, u32 y> -> u32
    {
        this.vx <- x;
        this.vy <- y;
    }

    .checkEat method<Food cfood> -> u32
    {
        if((this.head.x == cfood.pos.x) && (this.head.y == cfood.pos.y))
        {
            this.grow();
            cfood.move();
        }
    }

    .moveAndRender method<> -> u32
    {
        gfx_draw_rect(this.head.x, this.head.y, 5, 5);

        this.nodes[0].x <- this.head.x;
        this.nodes[0].y <- this.head.y;

        create i <- this.length - 1;
        while(i :> 0)
        {

            if((this.nodes[i].x == this.head.x) && (this.nodes[i].y == this.head.y))
            {
                exit_game("Fail!", this.length);
            }

            gfx_draw_rect(this.nodes[i].x, this.nodes[i].y, 5, 5);
            this.nodes[i].x <- this.nodes[i - 1].x;
            this.nodes[i].y <- this.nodes[i - 1].y;

            i <- i - 1;
        }

        this.head.x <- this.head.x + this.vx;
        this.head.y <- this.head.y + this.vy;

        if((this.head.x <: 0) || (this.head.x :> 480) || (this.head.y <: 0) || (this.head.y :> 360))
        {
            exit_game("Fail!", this.length);
        }
    }
}

create snake <- Snake:(0);
create food  <- Food:(0);

__ccalled__ render function<u32 event> -> u32
{
    gfx_clear();

    snake.checkEat(food);
    
    snake.moveAndRender();
    food.render();

    gfx_draw_text(5, 15, ("Score: " + snake.length));

    if(event == KeyPress)
    {
        if((gfx_keypress_key == 'a') && (snake.vx != 5))
        {
            snake.setVelocity(-5, 0);
        }
        elif((gfx_keypress_key == 'd') && (snake.vx != -5))
        {
            snake.setVelocity(5, 0);
        }
        elif((gfx_keypress_key == 'w') && (snake.vy != 5))
        {
            snake.setVelocity(0, -5);
        }
        elif((gfx_keypress_key == 's') && (snake.vy != -5))
        {
            snake.setVelocity(0, 5);
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
    snake <- Snake(10);
    food <- Food();

    gfx_setup(480, 360);
    gfx_begin($render);
}