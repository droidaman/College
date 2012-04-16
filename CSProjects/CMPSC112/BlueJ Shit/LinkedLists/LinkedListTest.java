

/**
 * The test class LinkedListTest.
 *
 * @author (Braden Licastro and Trent Dale) 
 * @version (20110301)
 */
public class LinkedListTest extends junit.framework.TestCase
{
    /**
     * Default constructor for test class LinkedListTest
     */
    public LinkedListTest()
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

	public void testAdd()
	{
		LinkedList<Integer> linkedLi3 = new LinkedList<Integer>();
		linkedLi3.add(4);
		linkedLi3.add(69);
		linkedLi3.add(96);
	}

	public void testContains()
	{
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals(true, linkedLi1.contains(96));
		assertEquals(false, linkedLi1.contains(87));
		assertEquals(true, linkedLi1.contains(69));
		assertEquals(false, linkedLi1.contains(123));
		assertEquals(true, linkedLi1.contains(4));
	}

	public void testGet()
	{
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals("4", linkedLi1.get(0).toString());
		assertEquals("69", linkedLi1.get(1).toString());
		assertEquals("96", linkedLi1.get(2).toString());
		assertEquals(null, linkedLi1.get(3));
	}

	public void testIsEmpty()
	{
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		assertEquals(true, linkedLi1.isEmpty());
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals(false, linkedLi1.isEmpty());
	}

	public void testRemove()
	{
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals("4", linkedLi1.get(0).toString());
		assertEquals("4", linkedLi1.remove(0).toString());
		assertEquals("69", linkedLi1.get(0).toString());
	}

	public void testSet()
	{
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals("4", linkedLi1.get(0).toString());
		linkedLi1.set(0, 8675309);
		assertEquals("8675309", linkedLi1.get(0).toString());
	}

	public void testSize()
	{
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		assertTrue(0 == linkedLi1.size());
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertTrue(3 == linkedLi1.size());
		assertEquals("4", linkedLi1.remove(0).toString());
		assertTrue(2 == linkedLi1.size());
	}
}