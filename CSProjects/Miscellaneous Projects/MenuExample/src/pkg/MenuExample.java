package pkg;

import java.util.*;

public class MenuExample
{

	public static void main (String args[])
	{
		//Initialize a scanner and two types of menu variables
		Scanner reader = new Scanner(System.in);
		int option = -1;
		String resp = "";
		
		// Three Menu Examples
		
		// Example 1:
		while(true)
		{
			System.out.println("Type the option you would like to perform:\n" +
								"say hi\n" +
								"break\n" +
								"laugh\n" +
								"sneeze\n" +
								"quit");
			resp = reader.nextLine().toLowerCase();
		
			if (resp.contains("say hi"))
			{
				System.out.println("\nHey there sexy guy/lady!\n\n");
			}
			else if (resp.contains("break"))
			{
				System.out.println("\nYou broke me, HELPPPPPPP\n\n");
			}
			else if (resp.contains("laugh"))
			{
				System.out.println("\nlol, good enough?\n\n");
			}
			else if (resp.contains("sneeze"))
			{
				System.out.println("\nAAAAAAAAAAAAAAAAACHHHHHHHHHHHHHHEWWWWWWW\n\n");
			}
			else if (resp.contains("quit"))
			{
				System.out.println("\nExiting to next menu type\n\n");
				break;
			}
			else
			{
				System.out.println("\nInvalid option, try again.\n\n");
			}
		}
		
		
		// Example 2:
		boolean cycle = true;
		
		while(cycle)
		{
			System.out.println("Type the option you would like to have answered:\n" +
								"1. The meaning of life\n" +
								"2. Whose your daddy?\n" +
								"3. How are you feeling?\n" +
								"4. Is it sunny?\n" +
								"5. quit");
			option = reader.nextInt();
		
			switch(option)
			{
				case 1:
					System.out.println("\nThe meaning of life is 43!\n\n");
					break;
				case 2:
					System.out.println("\nI'm definitely not...\n\n");
					break;
				case 3:
					System.out.println(feels());
					break;
				case 4:
					System.out.println("\nDo you want it to be sunny? It is!\n\n");
					break;
				case 5:
					System.out.println("\nExiting\n\n");
					cycle = false;
					break;
				default:
					System.out.println("\nInvalid option, try again.\n\n");
			}
		}
	}
	
	// Returns how the computer is feeling this second.
	public static String feels()
	{
		String response = "";
		Random r = new Random();
		int feels = r.nextInt(3) + 1;
		
		if(feels == 1)
		{
			response = "\nIM PISSED OFF.\n\n";
		}
		else if(feels == 2)
		{
			response = "\nI'm not mad. You?\n\n";
		}
		else if(feels == 3)
		{
			response = "\nSuper duper happy!\n\n";
		}
		
		return response;
	}
}
