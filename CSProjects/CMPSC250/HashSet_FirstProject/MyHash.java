/* Braden Licastro
 * CMPSC250
 * Professor Roos
 * HashSet Practice
 */

import java.lang.*;
import java.util.*;

public class MyHash
{
    public static void main(String args[]) 
    {
		Set<String> myHashSet = new HashSet<String>(500);
		myHashSet.add ("this is a test");
		myHashSet.add ("geronimo");
		myHashSet.add ("might be a string");
		myHashSet.add ("probably isn't though");
		
		// Does the HashSet contain our magical strings?
		if (myHashSet.contains("this is a test"))
			System.out.println("yes, it is a test");
		else
			System.out.println("no");
			
		if (myHashSet.contains("geronimo"))
			System.out.println("yes, but don't jump!");
		else
			System.out.println("no");
			
		if (myHashSet.contains("gator"))
			System.out.println("yes, I am an Alleghenian");
		else
			System.out.println("no");
	}
}
