package libTracker;

import libTracker.Book;

public class Patron
{
	private String name;
	private String book1;
	private String book2;
	private String book3;
	private String book4;
	
		public Patron ()
		{
			name = "";
			book1 = "";
			book2 = "";
			book3 = "";
			book4 = "";
		}
		
		public Patron (String nm, String b1, String b2, String b3, String b4)
		{
			name = nm;
			book1 = b1;
			book2 = b2;
			book3 = b3;
			book4 = b4;
		}
		
		public Patron (Patron p)
		{
			name = p.name;
			book1 = p.book1;
			book2 = p.book2;
			book3 = p.book3;
			book4 = p.book4;
		}
		
		public void borrowBook(Book b1)
		{
			
		}
}
