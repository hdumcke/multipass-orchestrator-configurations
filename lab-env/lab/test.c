#include <stdio.h>
#include "hello.h"

int main()
  {
      s_greet_t input;
      input.s1 = "dear";
      input.s2 = "Jane";
      char output[30];
      greetings(input, &output[0]);
      printf("%s\n", output);
  }
