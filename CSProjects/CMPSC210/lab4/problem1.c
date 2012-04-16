/*
 *Braden Licastro
 *Computer Science 210
 *Lab 4 - Fall Semester 2011-12
 *Problem 1
 */

/*
 * 
 */
 

#include <stdio.h>

#define ZERO 0
#define UNMIL 1000

main()
{
  int c = 0,i = 0, input[UNMIL];

  printf("Please input hex value(s):\n");
  
  while((c = getchar()) != EOF)
    {
      input[i++] = c;
    }

  input[i] = '\0';
  
  int output[] = {htoi(input)};
  //int output[] = {'1','2','3','4','5','6','7','8','\0'};
  
  c = i = ZERO;

  printf("\n  HEX\n");
  printf("-----------------------\n");

  while(input[i] != '\0')
    {
      printf("%c", input[i]);
      i++;
    } 

  printf("\n\n  DECIMAL\n");
  printf("-----------------------\n");

  while(output[c] != '\0')
    {
      printf("%c", output[c]);
      c++;
    }
}

htoi(int input[])
{
  int i, j = 0, temp, ans, finalans[UNMIL];

  if(input[0] == '0' && (input[1] == 'x' || input[1] == 'X'))
    {
      for(i = 2; input[i] != '\0'; i++)
	{
	  if(input[i] != '\n')
	    {
	      putchar(input[i]);
	      if(input[i] >= 'a' && input[i] <= 'f')
		{
		  temp = input[i] - 'a' + 10;
		}
	      else if(input[i] >= 'A' && input[i] <= 'F')
		{
		  temp = input[i] - 'A' + 10;
		}
	      else if(input[i] >= '0' && input[i] <= '9')
		{
		  temp = input[i] - '0';
		}
	      else
		printf("Error, invalid input");
	  
	      ans = (ans*16) + temp;
	    }
	  else if (input[i] == '\n')
	    {
	      finalans[j] = ans;
	      j++;
	      finalans[j] = '\n';
	      j++;
	    }
	  else
	    {}
	}
    }
  else
    {
      for(i = 0; input[i] != '\0'; i++)
	{
	  if(input[i] != '\n')
	    {
	      putchar(input[i]);
	      if(input[i] >= 'a' && input[i] <= 'f')
		{
		  temp = input[i] - 'a' + 10;
		}
	      else if(input[i] >= 'A' && input[i] <= 'F')
		{
		  temp = input[i] - 'A' + 10;
		}
	      else if(input[i] >= '0' && input[i] <= '9')
		{
		  temp = input[i];
		}
	      else
		printf("Error, invalid input");
	  
	      ans = ((ans*16) + temp);
	    }
	  else if (input[i] == '\n')
	    {
	      finalans[j] = ans;
	      j++;
	      finalans[j] = '\n';
	      j++;
	    }
	  else
	    {}
	}
      finalans[j] = '\0';
    }
}
