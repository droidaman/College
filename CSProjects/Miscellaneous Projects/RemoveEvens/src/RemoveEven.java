import edu.allegheny.LinkedList;

/*
 * You are bound by the Allegheny honor code. You should use no
 * outside resources in completing this 1 hour programming task.
 * No texts, no notes, no Internet, no friends or colleagues.
 * It should represent your knowledge and understanding of Java
 * and of the material we have explored in class and lab.
 */
public class RemoveEven {
	// You can create a new RemoveEvens object and invoke the
	// testAll() method to see how your solution is working.
	public static void main(String[] args) {
		LinkedList<Integer> ls = new LinkedList<Integer>();
		System.out.println("Order of results does not matter.");
		System.out.println("Only that the correct values are in the list.");
		System.out.println();

		// Test 1
		System.out.println("Test 1");
		ls.add(1);
		ls.add(2);
		ls.add(3);
		ls.add(4);
		System.out.println("Input:    " + ls);
		System.out.println("Expected: 2, 4");
		System.out.println("Output:   " + justEvens(ls));
		System.out.println();

		// Test 2
		System.out.println("Test 2");
		LinkedList<Integer> ls2 = new LinkedList<Integer>();

		System.out.println("Input:    " + ls2);
		System.out.println("Expected: empty list");
		System.out.println("Output:   " + justEvens(ls2));
		System.out.println();

		// Test 3
		System.out.println("Test 3");
		LinkedList<Integer> ls3 = new LinkedList<Integer>();
		ls3.add(2);
		ls3.add(4);
		ls3.add(6);

		System.out.println("Input:    " + ls3);
		System.out.println("Expected: 2, 4, 6");
		System.out.println("Output:   " + justEvens(ls3));
		System.out.println();

		// Test 4
		System.out.println("Test 4");
		LinkedList<Integer> ls4 = new LinkedList<Integer>();
		ls4.add(1);
		ls4.add(3);
		ls4.add(5);

		System.out.println("Input:    " + ls4);
		System.out.println("Expected: empty list");
		System.out.println("Output:   " + justEvens(ls4));
		System.out.println();
	}

	// Your solution should go here.
	private LinkedList<Integer> justEvens(LinkedList<Integer> ls) {
		LinkedList<Integer> tls = new LinkedList<Integer>();
		if (ls.isEmpty()) {

		}
		return new LinkedList<Integer>();
	}
}
