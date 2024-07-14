// from rosetta. 

#include <X11/Xlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
    Display *d = XOpenDisplay(NULL);
    if (d == NULL)
    {
        write(1, "X11 Display Error\n", 21);
        exit(1);
    }
    int s = DefaultScreen(d);
    printf("%i\n", s);

    Window w = XCreateSimpleWindow(d, RootWindow(d, s), 10, 10, 100, 100, 1, BlackPixel(d, s), WhitePixel(d, s));
    XSelectInput(d, w, ExposureMask | KeyPressMask);
    XMapWindow(d, w);

    XEvent e;
    while (1)
    {
        XNextEvent(d, &e);
        if (e.type == Expose)
        {
            XFillRectangle(d, w, DefaultGC(d, s), 20, 20, 10, 10);
        }
        if (e.type == KeyPress)
            break;
    }

    XCloseDisplay(d);
    return 0;
}