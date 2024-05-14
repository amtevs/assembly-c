#ifdef LINKTIME

#include <stdio.h>
#include <math.h>

void __wrap_john(int arg)
{
    printf("john: you passed %d\n", arg);
}

void __wrap_fred(int arg)
{
    printf("fred: you passed %d\n", arg);
}

#endif

