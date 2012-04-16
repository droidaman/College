// Disclaimer: The program code is made available under the
// following copyright notice: Copyright 2006, by Pearson
// Education, Inc. by Drake; all rights reserved. Permission
// is granted for use in non-commercial applications provided
// this copyright notice remains intact and unchanged. The
// author and publisher make no warranty of any kind, expressed
// or implied, with regard to these programs. The author and
// publisher shall not be liable in any event for incidental or
// consequential damages in connection with, or arising out of
// the furnishing, performance of use of this program code.


// Introduced in Chapter 16
/**
 * A simulated memory for illustrating memory management.  Each
 * object takes up two cells.
 */
public class MemoryWithGarbageCollection {

  /** Number of cells in each half of memory. */
  public static final int MEMORY_SIZE = 8;
  
  /** The null reference. */
  public static final int NULL = -1;
  
  /** Address of the beginning of the free region. */
  private int free;

  /** One more than the address of the last free cell. */
  private int end;
  
  /** Data are stored in these locations. */
  private int[] heap;

  /** Create the heap. */
  public MemoryWithGarbageCollection() {
    heap = new int[MEMORY_SIZE * 2];
    free = 0;
    end = MEMORY_SIZE;
  }

  /**
   * Return the address of an available object, which is
   * removed from the free list.
   */
  public int allocate() {
    int result = free;
    free += 2;
    return result;
  }

  /** Forward the two cells at address to destination. */
  protected void forward(int address, int destination) {
    set(destination, get(address));
    set(destination + 1, get(address + 1));
    set(address, destination);
  }
  
  /**
   * Perform a copying garbage collection, keeping only the objects
   * reachable from root.  Return the new address of the root object.
   */
  public int garbageCollect(int root) {
    int head; // Beginning of unexamined region of to-space
    if (end == MEMORY_SIZE) {
      head = MEMORY_SIZE;
    } else {
      head = 0;
    }
    int tail = head; // Beginning of unused region of to-space
    int result = head;
    forward(root, tail);
    tail += 2;
    while (head < tail) {
      int referent = get(head);
      if (referent > NULL) {
        if (!isForwarded(referent)) {
          forward(referent, tail);
          tail += 2;
        }
        set(head, get(referent));
      }
      head++;
    }
    free = tail;
    end = (MEMORY_SIZE * 3) - end;
    return result;
  }
  
  /** Return the contents of address. */
  public int get(int address) {
    return heap[address];
  }

  /** Return true if address contains a forwarding address. */
  protected boolean isForwarded(int address) {
    return (get(address) > NULL)
      && ((get(address) >= MEMORY_SIZE) == (end == MEMORY_SIZE));
  }
  
  /** Set the contents of address to value. */
  public void set(int address, int value) {
    heap[address] = value;
  }

  public String toString() {
    StringBuilder result = new StringBuilder();
    for (int i = 0; i < heap.length; i++) {
      if ((i >= MEMORY_SIZE) == (end == MEMORY_SIZE)) {
        result.append("X ");
      } else {
        result.append(heap[i] + " ");
      }
    }
    return result.toString();
  }
  
  /** Test the garbage collector. */
  public static void main(String[] args) {
    MemoryWithGarbageCollection mem
      = new MemoryWithGarbageCollection();
    int a = mem.allocate();
    mem.set(a, -2);
    int d = mem.allocate();
    mem.set(d, -3);
    mem.set(d + 1, -4);
    int b = mem.allocate();
    mem.set(a + 1, b);
    mem.set(b, -5);
    int c = mem.allocate();
    mem.set(b + 1, c);
    mem.set(c, -5);
    mem.set(c + 1, b);
    System.out.println(mem);
    System.out.println("Moving " + a + " to "
			          + mem.garbageCollect(a));
    System.out.println(mem);
  }
  
}
