package source;

import java.util.*;

public class MagicRunner {
	public static void main(String[] args) {
		MagicChecker mc = new MagicChecker();
		Scanner reader = new Scanner(System.in);

		System.out
				.print("Please choose an option fron the menu below...\n    1   Run the solver using magic squares.\n    2   Run in bypass mode (only tests logic).\nOption: ");
		int asdf = reader.nextInt();
		System.out.println("\n\n");

		if (asdf == 1) {
			System.out.println("Yay it does nothing!");
		} else if (asdf == 2) {
			int[] a = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
			for (int z : a) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(a) + "\n\n");

			int[] q = { 2, 4, 6, 8, 1, 3, 5, 7, 9 };
			for (int z : q) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(q) + "\n\n");

			int[] w = { 1, 6, 3, 7, 2, 8, 9, 4, 5 };
			for (int z : w) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(w) + "\n\n");

			int[] e = { 6, 1, 8, 7, 5, 3, 2, 9, 4 };
			for (int z : e) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(e) + "\n\n");

			int[] r = { 8, 2, 5, 3, 1, 6, 4, 9, 7 };
			for (int z : r) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(r) + "\n\n");

			int[] t = { 2, 7, 3, 6, 9, 5, 4, 8, 1 };
			for (int z : t) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(t) + "\n\n");

			int[] y = { 9, 2, 3, 8, 1, 4, 7, 6, 5 };
			for (int z : y) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(y) + "\n\n");

			int[] u = { 2, 7, 6, 9, 5, 1, 4, 3, 8 };
			for (int z : u) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(u) + "\n\n");

			int[] i = { 4, 9, 2, 3, 5, 7, 8, 1, 6 };
			for (int z : i) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(i) + "\n\n");

			int[] o = { 4, 3, 8, 9, 5, 1, 2, 7, 6 };
			for (int z : o) {
				System.out.print(z + " ");
			}
			System.out.println("\n" + mc.checkTestVals(o) + "\n\n");
		} else {
			System.out
					.println("You have chosen an incorrect menu option. The program will now terminate.");
		}
	}
}