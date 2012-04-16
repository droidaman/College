/*
 *Braden Licastro
 *Computer Science 210
 *Lab 2
 *Problem 1
 */

/*
 *LOWER -> Marks the lowest bounds of the table to be converted.
 *UPPER -> Marks the highest bounds of the table to be converted.
 *STEP  -> The interval to increase the celsius temp to convert.
 *
 *celsius -> The current celsius temperature to be converted.
 */

#include <stdio.h>

//Lets define our constants
#define LOWER 0
#define UPPER 300
#define STEP 20

main()
{
  //Define our variables
  int celsius;

  //Print out the heading and column headers.
  printf("Celsius -> Farenheit Converter\n    Celsius\tFarenheit\n");
  //Convert between units and print out the results.   
  for (celsius = LOWER; celsius <= UPPER; celsius += STEP)
    {
      printf ("      %3d\t%6.1f\n", celsius, (9.0/5.0)*celsius+32);
    }
}
