/*
 *Braden Licastro
 *Computer Science 210
 *Lab 3 - Fall Semester 2011-12
 *Problem 2
 */

/*
 * i : universal counter
 * j : universal counter
 * k : universal counter
 * found : keeps history of whether a match has been found during that session
 * s1 : position when inserting into string 1
 * s2 : position when inserting into string 2
 * string1 : sentence to have characters removed
 * string2 : sentence for characters to be compared from
 */

#include <stdio.h>

#define CERO 0
#define UNO 1
#define UNMIL 1000

main()
{

  int j, k, s1, s2;
  j = k = s1 = s2 = CERO;

  char string1[UNMIL];
  char string2[UNMIL];

  printf("Input: \n");

  while((k=getchar()) != EOF)
    {
      if(j == 0 && k != '\n')
	{
	  string1[s1++] = k;
	  putchar(k);
	}
      else if(j == 1 && k != '\n')
	{
	  string2[s2++] = k;
	  putchar(k);
	}
      else
	{
	  j++;
	  putchar('\n');
	}
    }

  string1[s1] = '\0';
  string2[s2] = '\0';

  printf("\n\nOutput:\n");

  squeeze(string1, string2);

  printf("%s", string1);

}


//Removes characters from the first sentence that match between the two sentences.
squeeze(char string1[], char string2[])
{
  //Create and initialize the variables.
  int i, j, k, found;
  i = j = found = CERO;
  
  //While we aren't at the end of the first sentence.
  while(string1[i] != '\0')
  {
    //We haven't found anything.
    found = CERO;
    //Nothing has been found and we aren't at the end of the second sentence.
    for(k = CERO; string2[k] != '\0' && !found; k++)
    {
      //Whoa, there are matching characters.
      if(string2[k] == string1[i])
      {
        found = 1;
      }
    } 

    //Nothing was found so we can keep that character in the array.
    if(!found)
    {
      string1[j++] = string1[i];
    }
    i++;
  }
  
  //Now we are at the end of the check for matching characters, lets escape the array.
  string1[j] = '\0';
}
