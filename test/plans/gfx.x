using graphics;

renderFn function<> -> u32
{
    gfx_drawLine(0,0,100,100);
}

entry function<> -> u32
{
    gfx_begin(480,360);
    gfx_render(renderFn);
}