

/**
 * The test class StackTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class StackTest extends junit.framework.TestCase
{
    /**
     * Default constructor for test class StackTest
     */
    public StackTest()
    {
    }

    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    protected void setUp()
    {
    }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    protected void tearDown()
    {
    }

	public void testPush()
	{
		Stack stack1 = new Stack();
		Book book1 = new Book("This is a book");
		stack1.push(book1);
		Book book2 = new Book("This is another book");
		stack1.push(book2);
		Book book3 = new Book("Sigh, and another book");
		stack1.push(book3);
	}

	public void testPop()
	{
		Stack stack1 = new Stack();
		Book book1 = new Book("GAH I hate books now");
		stack1.push(book1);
		assertEquals(book1, stack1.pop());
	}

	public void testPeek()
	{
		Stack stack1 = new Stack();
		Book book1 = new Book("You peeked at me!");
		stack1.push(book1);
		assertEquals(book1, stack1.peek());
	}

	public void testIsEmpty()
	{
		Stack stack1 = new Stack();
		assertEquals(true, stack1.isEmpty());
	}
}






