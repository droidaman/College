/*
 *Braden Licastro
 *Computer Science 210
 *Lab 1
 *Problem 3
 */

/*
 *RESET - No spaces have been found yet.
 *INTERMEDIATE - There was a space found.
 *SPACEMATCH - The number of words the program will break a sentence into a new line at.
 *c - The current character being looked at
 *space - The number of spaces we found since last reset.
 */

#include <stdio.h>

//Define the constants to be used
#define RESET 0
#define INTERMEDIATE 1
#define SPACEMATCH 2

main()
{
  int c;
  int space;

  //Ensure the program always starts with 0 spaces.
  space = RESET;

  //Loop until we reach the end of the file.
  while((c = getchar()) != EOF)
  {
    //Is the current character a space?
    if(c == ' ')
    {
      //Print a space and increment number found until we reach the desired number of words.
      if(space == RESET || space == INTERMEDIATE)
      {
        ++space;
	putchar(c);
      //If we have reached the desired number of words move to a new line!
      if(space == SPACEMATCH)
	  {
	    putchar('\n');
	    space = RESET;
	  }
      }
    }
    //The character is not a space, print it out.
    else
    {
      putchar(c);
    }
  }
}
