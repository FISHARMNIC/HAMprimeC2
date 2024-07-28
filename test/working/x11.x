forward gfx_begin function<u32 a, u32 b, p32 fn> -> u32;
forward gfx_rect function<u32 x, u32 y, u32 w, u32 h> -> u32;

__ccalled__ render function<> -> u32
{
    gfx_rect(20,20,30,30);
}

entry function<> -> u32
{
    gfx_begin(100, 100, $render);
}