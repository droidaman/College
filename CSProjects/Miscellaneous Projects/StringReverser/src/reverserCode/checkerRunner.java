package reverserCode;

import java.util.*;

public class checkerRunner {

	public static final Scanner READER = new Scanner(System.in);
	public static checkerRunner cr = new checkerRunner();
	public static reverser r = new reverser();

	public static void main(String[] args) {
		String string1, string2;
		
		System.out.print("What is the first string? ");
		string1 = READER.nextLine();
		System.out.print("What is the second string to compare? ");
		string2 = READER.nextLine();

		int result = cr.areReversed(string1, string2);

		switch (result) {
		case 0:
			System.out.print("The strings are the same after being reversed.");
			break;

		case 1:
			System.out.print("The strings are exactly the same.");
			break;

		case 2:
			System.out
					.print("The strings are not the same, even when reversed.");
			break;

		default:
			System.out
					.println("Something went horribly wrong, you have permision to blame the developer.");
			break;
		}
	}

	public int areReversed(String s1, String s2) {
		if (s1.equals(r.flipString(s2))) {
			return 0;
		} else if (s1.equals(s2)) {
			return 1;
		} else {
			return 2;
		}
	}

}