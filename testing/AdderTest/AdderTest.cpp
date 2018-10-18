#include <cstdlib>

#include "Adder.h"

int main()
{
  Adder adder;
  int three = adder.Add(1, 2);
  
  return (three == 3) ? EXIT_SUCCESS : EXIT_FAILURE;
}