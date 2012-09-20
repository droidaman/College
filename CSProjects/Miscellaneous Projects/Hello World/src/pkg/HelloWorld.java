package pkg;

import java.util.*;

public class HelloWorld {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name = "";
		Scanner reader = new Scanner(System.in);
		
		System.out.print("What is your name? ");
		name = reader.nextLine();
		
		if(name.contains("trent") || name.contains("Trent"))
		{
			System.out.println("\nGoodbye");
		}else
		System.out.println("\nHello, " + name + "!");
	}
}
