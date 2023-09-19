#include <stdio.h>
#include "hello.h"

void greetings(s_greet_t input, char* output)
{
    sprintf(output, "Hello %s %s", input.s1, input.s2);
}
