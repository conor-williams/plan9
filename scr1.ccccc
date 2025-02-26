/*this can be visualisezed in p9*/
/**********************************************
# Created 10/05/2003
# Conor Williams - will551@iol.ie
# Button to print "Hello World!"
***********************************************/

#include <u.h>
#include <libc.h>
#include <thread.h>
#include <draw.h>
#include <mouse.h>
#include <keyboard.h>
#include <control.h>

Controlset *cs;
int ctldeletequits = 1;

void resizecontrolset(Controlset *)
{
    Rectangle r, r1;
        
    if (getwindow(display, Refnone) < 0)
    {
        sysfatal("resize failed: %r");        
    }

    r = insetrect(screen->r, 30);
    r1 = r;
    r1.max.y = r1.min.y + 50;           
    chanprint(cs->ctl, "myb rect %R", r1);
    chanprint(cs->ctl, "myb show");
}
   
void threadmain(int argc, char *argv[])
{
    char *s, *args[3];
    Channel *c;
    Control *myb;
    int n;

    initdraw(0, 0, "example");
    initcontrols();
    cs = newcontrolset(screen, nil, nil, nil);
    cs->clicktotype = 1;

    myb = createtextbutton(cs, "myb");
    chanprint(cs->ctl, "myb image green");
    chanprint(cs->ctl, "myb border 4");
    chanprint(cs->ctl, "myb show");
    chanprint(cs->ctl, "myb text Press!");
    c = chancreate(sizeof(char*), 0);

    controlwire(myb, "event", c);

    activate(myb);
    resizecontrolset(cs);
    for(;;)
    {
        s = recvp(c);
        n = tokenize(s, args, nelem(args));
        if (n == 3 && strcmp(args[1], "value") == 0)
        {
            if (strcmp(args[0], "myb:") == 0)
            {
                if (strcmp(args[1], "value") == 0)
                {
                    if (strcmp(args[2], "0") != 0)
                    {
                        print("hello world!");
			/***********************
			# Change the button state back to unpressed
                        ************************/
                        chanprint(cs->ctl, "myb value 0");
                    }
                }
            }          
        }
    }
    threadexitsall(nil);
}
/*************************************************
#EOF
**************************************************/
