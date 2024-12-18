/*
Credit to Fabian Quijosaca, original JS code from https://dev.to/foqc/mandelbrot-set-in-js-480o
Use this program for testing optimizations
*/

#include sys x11

__define MAXITER 80

__define SW 480
__define SH 360

create REAL_START <- -2.0;
create REAL_END <- 0.5;

create IMAG_START <- -1.0;
create IMAG_END <- 1.0;

// create zoom <- 0.1;

Complex format
{
    .x f32;
    .y f32;
}

create z <- Complex<x:0,y:0>;
create p <- Complex<x:0,y:0>;
create c <- Complex<x:0,y:0>;

brot function<Complex c> -> f32
{
    create n <- 0;
    create d <- 0.0;

    z.x <- 0;
    z.y <- 0;

    while(n <: MAXITER)
    {
        p.x <- z.x * z.x - z.y * z.y;
        p.y <- 2 * z.x * z.y;

        z.x <- p.x + c.x;
        z.y <- p.y + c.y;

        d <- root(z.x * z.x + z.y * z.y);
        n <- n + 1;
    }
    return(d);
}

create wait <- 0;

__ccalled__ render function<u32 e> -> u32
{
    if(wait == 0)
    {
        // x11 calls expose 2x on start
        wait <- 1;
        return;
    }

    //gfx_clear();

    /*
    // zoom WIP from https://dev.to/foqc/mandelbrot-set-in-js-zoom-in-2hmc
    if(e == ButtonPress)
    {
        REAL_END <- 10.0;
    }

    const zfw <- SW * zoom;
    const zfh <- SH * zoom;
    */

    create i <- 0;
    create j <- 0;

    while(i <: SW)
    {
        j <- 0;
        while(j <: SH)
        {
            c.x <- REAL_START + i / SW * (REAL_END - REAL_START);
            c.y <- IMAG_START + j / SH * (IMAG_END - IMAG_START);

            create l <- brot(c);

            if(l :> 2)
            {
                gfx_draw_rect(i,j,1,1);
            }

            j <- j + 1;
        }
        i <- i + 1;
    }
    //exit(0);
}

entry function<> -> u32
{
    gfx_setup_mask(SW, SH, 32768); /* mask for EXPOSE only */
    gfx_begin($render);
}