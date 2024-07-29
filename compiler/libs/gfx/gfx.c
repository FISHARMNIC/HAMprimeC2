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

int gfx_mouse_x;
int gfx_mouse_y;
int gfx_mouse_button;
int gfx_keypress_keycode;
char gfx_keypress_key;

typedef void fn_t(int);

// todo, on mouse, keypress, etc just have different variables that store recent keys and stuff

void gfx_rect(int x, int y, int w, int h)
{
    XFillRectangle(_cx11_display_, _cx11_window_, DefaultGC(_cx11_display_, _cx11_screen_), x,y,w,h);
}

int gfx_begin(int width, int height, int onEvent)
{
    _cx11_display_ = XOpenDisplay(NULL);
    if (_cx11_display_ == NULL)
    {
        return 1;
    }
    _cx11_screen_ = DefaultScreen(_cx11_display_);

    _cx11_window_ = XCreateSimpleWindow(_cx11_display_, RootWindow(_cx11_display_, _cx11_screen_), 10, 10, width, height, 1, BlackPixel(_cx11_display_, _cx11_screen_), WhitePixel(_cx11_display_, _cx11_screen_));
    XSelectInput(_cx11_display_, _cx11_window_, ExposureMask | KeyPressMask | PointerMotionMask | ButtonPressMask | ButtonReleaseMask);
    XMapWindow(_cx11_display_, _cx11_window_);

    while (1)
    {
        XNextEvent(_cx11_display_, &_cx11_event_);
        
        if (_cx11_event_.type == Expose)
        {
        }
        else if (_cx11_event_.type == KeyPress)
        {
            XKeyPressedEvent *kb = (XKeyPressedEvent *)&_cx11_event_;
            gfx_keypress_keycode = XLookupKeysym(kb, 0);
            int keycodeShort = (unsigned char)gfx_keypress_keycode;
            gfx_keypress_key = XKeysymToString(gfx_keypress_keycode)[0]; // convert key press to char
        }
        else if(_cx11_event_.type == MotionNotify)
        {
            XMotionEvent *mouse = (XMotionEvent *)&_cx11_event_;
            gfx_mouse_x = mouse->x;
            gfx_mouse_y = mouse->y;
        }
        else if(_cx11_event_.type == ButtonPress || _cx11_event_.type == ButtonRelease)
        {
            XButtonEvent *mouse = (XButtonEvent *)&_cx11_event_;
            gfx_mouse_x = mouse->x;
            gfx_mouse_y = mouse->y;
            gfx_mouse_button = mouse->button;
        } else {
            continue;
        }
        ((fn_t *)onEvent)(_cx11_event_.type);
    }
}

void gfx_clear()
{
    XClearWindow(_cx11_display_, _cx11_window_);
}

void gfx_redraw()
{
    XEvent event = (XEvent){.type = Expose};
    XSendEvent(_cx11_display_, _cx11_window_, False, ExposureMask, &event);
}

int gfx_end()
{
    XCloseDisplay(_cx11_display_);
}