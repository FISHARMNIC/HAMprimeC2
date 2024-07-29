forward gfx_begin function<u32 a, u32 b, p32 fn> -> u32;
forward gfx_rect function<u32 x, u32 y, u32 w, u32 h> -> u32;
forward gfx_clear function<> -> u32;

import u32 gfx_mouse_x;
import u32 gfx_mouse_y;
import u32 gfx_mouse_button;
import u32 gfx_keypress_keycode;
import u8 gfx_keypress_key;

__define MotionNotify 6;
__define Expose 12;
__define ButtonPress 4; 
__define ButtonRelease 5;

create sx <- 20;
__ccalled__ render function<u32 event> -> u32
{
    gfx_clear();
    /* ELIF DOESNT WORK */
    if(event == ButtonPress)
    {
        sx <- (sx + 10);
    } elif(event == ButtonRelease)
    {
        sx <- (sx - 10);
    }
    gfx_rect((gfx_mouse_x - 10),(gfx_mouse_y - 10),sx,20);
}

entry function<> -> u32
{
    gfx_begin(500, 360, $render);
}