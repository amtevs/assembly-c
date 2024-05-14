#ifdef RUNTIME

#include <stdio.h>
#include <math.h>

void sam(int arg)
{
    printf("sam: you passed %d\n", arg);
}

void bill(char *arg)
{
    printf("bill: you passed %s\n", arg);
}

#endif

