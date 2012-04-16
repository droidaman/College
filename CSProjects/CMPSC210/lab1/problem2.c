/*
 *Braden Licastro
 *Computer Science 210
 *Lab 1
 *Problem 2
 */

/*
 *LOWER - The starting point (used as the exponent throughout the program).
 *UPPER - The upper limit to calculate the powers of two, and the stopping point for the program.
 *TWO - The number to add to the exponent after each run.
 *trace - Keeps track of the final number that was processed in the for loop.
 */

#include <stdio.h>
#include <math.h>

//Define the constants.
#define LOWER 1
#define UPPER 1000000
#define TWO 2

main()
{
  //Print out the headers for the chart.
  printf("Exponent   Corresponding Power\n");
  int trace;

  //Calculate the nubers and print them out right aligned.
  for (trace = LOWER; pow(TWO,trace) <= UPPER; trace = trace + TWO)
    {
      printf("%5d\t\t%7.0f\n", trace, pow(TWO, trace));
    }
}
