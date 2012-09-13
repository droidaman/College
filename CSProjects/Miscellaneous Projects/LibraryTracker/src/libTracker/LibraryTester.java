package libTracker;

import libTracker.Patron;

public class LibraryTester
{

	public static void main(String[] args)
	{
		Patron p = new Patron ("Ken Lambert");
		Book b1 = new Book ("Big n' Tasty", "Matt Elam");
		Book b2 = new Book ("Come n'side n' Geet Waaarrm", "Devin Boyer");
		Book b3 = new Book ("Return of Sasquatch", "Braden Licastro");
		Book b4 = new Book ("Enslave Your Buddies!", "William Snyder");
		
		System.out.println (p.borrowBook(b1));
		System.out.println (p.borrowBook(b2));
		System.out.println (p.borrowBook(b3));
		System.out.println (p.borrowBook(b4));

		System.out.println (p);
		
		System.out.println (p.returnBook("Big n'Tasty"));
		System.out.println (p.hasBook("Big n' Tasty"));
		System.out.println (p.hasbook("Come n'side n' Geet Waaarrm"));
		
		System.out.println (p);
	}
}