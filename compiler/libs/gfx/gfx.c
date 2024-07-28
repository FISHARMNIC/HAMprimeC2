/*
Compatibility layer for using simple graphics in HAM`
*/

#include <X11/Xlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Display *_cx11_display_;
int      _cx11_screen_;
Window   _cx11_window_;
XEvent   _cx11_event_;

typedef void fn_t(void);

// todo, on mouse, keypress, etc just have different variables that store recent keys and stuff

void gfx_rect(int x, int y, int w, int h)
{
    XFillRectangle(_cx11_display_, _cx11_window_, DefaultGC(_cx11_display_, _cx11_screen_), x,y,w,h);
}

int gfx_begin(int width, int height, int onRender)
{
    _cx11_display_ = XOpenDisplay(NULL);
    if (_cx11_display_ == NULL)
    {
        return 1;
    }
    _cx11_screen_ = DefaultScreen(_cx11_display_);

    _cx11_window_ = XCreateSimpleWindow(_cx11_display_, RootWindow(_cx11_display_, _cx11_screen_), 10, 10, width, height, 1, BlackPixel(_cx11_display_, _cx11_screen_), WhitePixel(_cx11_display_, _cx11_screen_));
    XSelectInput(_cx11_display_, _cx11_window_, ExposureMask | KeyPressMask);
    XMapWindow(_cx11_display_, _cx11_window_);

    while (1)
    {
        XNextEvent(_cx11_display_, &_cx11_event_);
        if (_cx11_event_.type == Expose)
        {
            ((fn_t *)onRender)();
            // gfx_rect();
        }
        if (_cx11_event_.type == KeyPress)
            break;
    }
}


int gfx_end()
{
    XCloseDisplay(_cx11_display_);
}