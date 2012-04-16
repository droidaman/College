/*
 *Braden Licastro
 *Computer Science 210
 *Lab 2
 *Problem 2
 */

/*
 *REST -> Used to reset counters back to 0.
 *REALLYLONG -> Used to set how many word lengths should be counted before they are lumped into a general category.
 *wordLength[] -> An array that holds the length of the words.
 *i -> Counter for the 'for' loops.
 *c -> Holds the current character being processed
 *tempCount -> Holds the number of letters in the current word.
 *longCount -> Holds the number of words which contained more than 10 characters.
 */

#include <stdio.h>

//Define the constants to be used
#define RESET 0
#define REALLYLONG 10

main()
{
  int wordLength[REALLYLONG];
  int i, c, tempCount, longCount;

  //Ensure the program always starts with values of 0.
  tempCount = longCount = RESET;
  for(i=RESET; i < REALLYLONG; ++i)
    wordLength[i] = RESET;

  //Ask the user for the input
  printf("Enter text followed by ^D\nThe input text is:\n");

  //Loop until we reach the end of the file.
  while((c = getchar()) != EOF)
  {
    //Is the current character a space, newline, or tab?
    if(c == ' ' || c == '\n' || c == '\t')
    {
      //Print the special character so it displays the input.
      putchar(c);
      //If it belongs in the array, do that and reset for the next word.
      if(tempCount <= REALLYLONG)
	{
	  wordLength[(tempCount - 1)]++;
	  tempCount = RESET;
	}
      //Too big to keep track of in the array, place in variable and reset the char counter.
      else if(tempCount > REALLYLONG)
	{
	  longCount++;
	  tempCount = RESET;
	}
    }
    //Not at the end of the word... count up, print it to show input.
    else
      {
	tempCount++;
	putchar(c);
      }
  }

  //Print out the results
  printf("\n%25s\n","Table of word sizes");
  printf("Word Length\t Number of Words\n");
  //Print the contents of the array.
  for(i = RESET; i < REALLYLONG; i)
    {
      printf("%6d\t\t%15d\n", (i+1), wordLength[i]);
    }
  //How many words were longer than what we were tracking?
  printf("The Number of words with length longer than 10 characters is : %d", longCount);
}
