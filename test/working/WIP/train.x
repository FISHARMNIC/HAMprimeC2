#include sys x11

__define NULL 0;

create clicked <- 0;
create clickX <- 0;
create clickY <- 0;

create drawMode <- 1;

Rail format
{
    .startX;
    .startY;
    
    .endX;
    .endY;

    .next Rail;
    
    .endXSw u32;
    .endYSw u32;

    .nextSw Rail;
    
    .Rail constructor<u32 sx, u32 sy, u32 ex, u32 ey>
    {
        this.startX <- sx;
        this.startY <- sy;
    
        this.endX <- ex;
        this.endY <- ey;

        this.next <- Rail:(0);
        this.nextSw <- Rail:(0);
    }
}

Train format
{
    .x u32;
    .y u32;

    .step u32;
    
    .rail Rail:borrowed;
}


create Rail:borrowed lastRail;
create Rail StartRail;

create Train train;

drawCurrent function<> 
{
    if(clicked == 1)
    {
        gfx_draw_line(clickX, clickY, gfx_mouse_x, gfx_mouse_y);
    }
}

drawAll function<>
{
    create current <- borrow StartRail;

    gfx_draw_line(current.startX, current.startY, current.endX, current.endY);

    current <- borrow current.next;

    while((current != 0) && (current != StartRail))
    {
        gfx_draw_line(current.startX, current.startY, current.endX, current.endY);
        current <- borrow current.next;
    }
}

drawTrain function<>
{
    if(train.step == 10)
    {
        /*
        note that if there is no borrow this takes ownership
        but it shouldn't since type is :borrowed, so fix that
        maybe other similar problems like this, check carefully
        */

        train.rail <- borrow train.rail.next;
        train.step <- 0;
    }
    else
    {
        create sx <- train.rail.startX;
        create sy <- train.rail.startY;

        create dx <- train.rail.endX - sx;
        create dy <- train.rail.endY - sy;

        create divx <- dx / 10;
        create divy <- dy / 10;
        
        gfx_draw_rect((sx + divx * train.step - 5), (sy + divy * train.step - 5), 10, 10);

        train.step <- train.step + 1;

        usleep(50000);

    }

    gfx_redraw();


}

__ccalled__ render function<u32 event>
{
    gfx_clear();

    gfx_mouse_x <- gfx_mouse_x / 10 * 10;
    gfx_mouse_y <- gfx_mouse_y / 10 * 10;

    if(drawMode == 0)
    {
        if(event == ButtonPress)
        {
            clicked <- 1;
            clickX <- gfx_mouse_x;
            clickY <- gfx_mouse_y;
        }
        elif(event == ButtonRelease)
        {
            clicked <- 0;
            lastRail.next <- Rail(clickX, clickY, gfx_mouse_x, gfx_mouse_y);
            lastRail <- borrow lastRail.next;
            lastRail.next <- borrow StartRail;
        }
    }
    elif(drawMode == 1)
    {
        clicked <- 1;

        clickX <- lastRail.endX;
        clickY <- lastRail.endY;

        if(event == ButtonPress)
        {
            lastRail.next <- Rail(clickX, clickY, gfx_mouse_x, gfx_mouse_y);
            lastRail <- borrow lastRail.next;

            if((gfx_mouse_x == StartRail.startX) && (gfx_mouse_y == StartRail.startY))
            {
                drawMode <- 2;
                clicked <- 0;
            }
        }
    }
    else
    {
        drawTrain();
    }

    drawAll();
    drawCurrent();
}

entry function<> -> u32
{
    StartRail <- Rail(100, 100, 200, 100);
    train <- Train<x:100,y:100,rail:StartRail,step:0>; // make sure gc borrows

    lastRail <- borrow StartRail;

    gfx_setup(500, 360);
    gfx_begin($render);
}