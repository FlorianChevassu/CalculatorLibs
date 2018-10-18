#include <cstdlib>

#include "Substractor.h"

int main()
{
  Substractor substractor;
  int one = substractor.Substract(2, 1);

  return (one == 1) ? EXIT_SUCCESS : EXIT_FAILURE;
}