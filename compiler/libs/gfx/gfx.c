/*
Compatibility layer for using simple graphics in HAM`
*/

#include <X11/Xlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Display *_cx11_display_;
int _cx11_screen_;
Window _cx11_window_;
XEvent _cx11_event_;
GC _cx11_gc_;

int gfx_mouse_x;
int gfx_mouse_y;
int gfx_mouse_button;
int gfx_keypress_keycode;
char gfx_keypress_key;

typedef void fn_t(int);

extern int *__allocate_wsize__(int bytes); // declared in assembly by HAM

#define DWC _cx11_display_, _cx11_window_, _cx11_gc_

// todo, on mouse, keypress, etc just have different variables that store recent keys and stuff

void gfx_draw_rect(int x, int y, int w, int h)
{
    XFillRectangle(DWC, x, y, w, h);
}

void gfx_draw_point(int x, int y)
{
    XDrawPoint(DWC, x, y);
}

void gfx_draw_line(int x1, int y1, int x2, int y2)
{
    XDrawLine(DWC, x1, y1, x2, y2);
}

void gfx_draw_arc(int x, int y, int size, int a1, int a2)
{
    XDrawArc(DWC, x - (size / 2), y - (size / 2), size, size, a1, a2);
}

void gfx_draw_text(int x, int y, char *str)
{
    XDrawString(
        DWC,
        x,
        y,
        str,
        strlen(str));
}

void __qcolor(XColor *true_color, char *color)
{
    XColor fake;
    XAllocNamedColor(
        _cx11_display_,
        XDefaultColormap(_cx11_display_, _cx11_screen_), // colormap
        color,                                           // color name
        true_color,                                      // closest color possible
        &fake                                            // exact color, but we don't care about that
    );
}

GC *gfx_context_allocateColor(char *color)
{
    XColor true_color;
    __qcolor(&true_color, color);
    XGCValues gc_values = (XGCValues){.foreground = true_color.pixel};
    gc_values.fill_style = FillOpaqueStippled;
    GC *allocated = (GC *)__allocate_wsize__(sizeof(GC));
    *allocated = XCreateGC(_cx11_display_, _cx11_window_, GCForeground, &gc_values);
    return allocated;
}

void gfx_context_setContext(GC *ctx)
{
    _cx11_gc_ = *ctx;
}

int gfx_setup(int width, int height)
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

    _cx11_gc_ = DefaultGC(_cx11_display_, _cx11_screen_);
}

int gfx_begin(fn_t *onEvent)
{
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
        else if (_cx11_event_.type == MotionNotify)
        {
            XMotionEvent *mouse = (XMotionEvent *)&_cx11_event_;
            gfx_mouse_x = mouse->x;
            gfx_mouse_y = mouse->y;
        }
        else if (_cx11_event_.type == ButtonPress || _cx11_event_.type == ButtonRelease)
        {
            XButtonEvent *mouse = (XButtonEvent *)&_cx11_event_;
            gfx_mouse_x = mouse->x;
            gfx_mouse_y = mouse->y;
            gfx_mouse_button = mouse->button;
        }
        else
        {
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