

/**
 * The test class QueueTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class QueueTest extends junit.framework.TestCase
{
    /**
     * Default constructor for test class QueueTest
     */
    public QueueTest()
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
		Queue queue1 = new Queue();
		Book book1 = new Book("This is a book");
		queue1.push(book1);
		Book book2 = new Book("This is another book");
		queue1.push(book2);
		Book book3 = new Book("This is YET another book");
		queue1.push(book3);
	}

	public void testPop()
	{
		Queue queue1 = new Queue();
		Book book1 = new Book("Yay! A book!");
		queue1.push(book1);
		Book book2 = new Book("Holy cow another book!");
		queue1.push(book2);
		Book book3 = new Book("OMGBBQ Im a book!");
		queue1.push(book3);
		assertEquals(book1, queue1.pop());
	}

	public void testPeek()
	{
		Queue queue1 = new Queue();
		Book book1 = new Book("Do you want to peek?");
		Book book2 = new Book("Im a book!");
		queue1.push(book1);
		queue1.push(book2);
		assertEquals(book1, queue1.peek());
	}

	public void testIsEmpty()
	{
		Queue queue1 = new Queue();
		assertEquals(true, queue1.isEmpty());
	}
}





