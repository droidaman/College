/*
Braden Licastro
Pd: 7/8
AP Computer Science
Mrs. Fennel
 */

package mainApp;
import java.util.Scanner;
public class SrcCode {

	public static void main(String[] args) {
		
		//Define variables
		int testNumber = 0, testScore = 0, tallyScore = 0, averageScore, highestScore = 0, lowestScore = 99999;
				
		//Start the reader...
		Scanner reader = new Scanner(System.in);

		//Start accepting input...
		System.out.println("Please input the test grades, when finished type -1 to calculate.");
		testScore = reader.nextInt();
		
		
		//Enter into the calculation loop right NOW!
		while (testScore != -1)
		{
		//Up the number of tests by one every time.
		testNumber++;
		
		//Up the total score...
		tallyScore += testScore;
		
		//Lowest score?
		if (testScore < lowestScore)
		lowestScore = testScore;
		
		//Highest score?
		if (testScore > highestScore)
		highestScore = testScore;
		
		//Accept test scores.
		testScore = reader.nextInt();
		}
		
		//Left the loop, now lets calculate the output and display it to the user.
		averageScore = tallyScore / testNumber;
		System.out.println ("\nThe average of all of the tests is " + averageScore + " points.");
		System.out.println ("The lowest score is: " + lowestScore + "\nThe highest score is: " + highestScore);
		}
	}