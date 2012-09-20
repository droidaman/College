package llcode;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LinkedListTest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAdd() {
		LinkedList<Integer> linkedLi3 = new LinkedList<Integer>();
		linkedLi3.add(4);
		linkedLi3.add(69);
		linkedLi3.add(96);
	}

	@Test
	public void testContains() {
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

	@Test
	public void testGet() {
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals("4", linkedLi1.get(0).toString());
		assertEquals(new Integer(69), linkedLi1.get(1));
		assertEquals("96", linkedLi1.get(2).toString());
		assertEquals(null, linkedLi1.get(3));
	}

	@Test
	public void testIsEmpty() {
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		assertEquals(true, linkedLi1.isEmpty());
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals(false, linkedLi1.isEmpty());
	}

	@Test
	public void testRemove() {
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals("4", linkedLi1.get(0).toString());
		assertEquals("4", linkedLi1.remove(0).toString());
		assertEquals("69", linkedLi1.get(0).toString());
	}

	@Test
	public void testSet() {
		LinkedList<Integer> linkedLi1 = new LinkedList<Integer>();
		linkedLi1.add(4);
		linkedLi1.add(69);
		linkedLi1.add(96);
		assertEquals("4", linkedLi1.get(0).toString());
		linkedLi1.set(0, 8675309);
		assertEquals("8675309", linkedLi1.get(0).toString());
	}

	@Test
	public void testSize() {
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
