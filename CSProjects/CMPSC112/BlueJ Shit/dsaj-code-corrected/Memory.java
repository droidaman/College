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
public class Memory {

  /** Number of cells in memory. */
  public static final int MEMORY_SIZE = 1000;
  
  /** The null reference. */
  public static final int NULL = -1;
  
  /** Address of the beginning of the free list. */
  private int free;
  
  /** Data are stored in these locations. */
  private int[] heap;

  /** Create the heap. */
  public Memory() {
    heap = new int[MEMORY_SIZE];
    for (int i = 0; i < heap.length; i += 2) {
      set(i + 1, i + 2);
    }
    set(heap.length - 1, NULL);
    free = 0;
  }

  /**
   * Return the address of an available object, which is remove from
   * the free list.
   */
  public int allocate() {
    int result = free;
    free = get(free + 1);
    return result;
  }

  /** Put the object at address back on the free list. */
  public void free(int address) {
    set(address + 1, free);
    free = address;
  }

  /** Free the linked list starting at address. */
  public void freeList(int address) {
    while (address != NULL) {
      int next = get(address + 1);
      free(address);
      address = next;
    }
  }

  /** Free the tree rooted at address. */
  public void freeTree(int address) {
    if (address > NULL) {
      freeTree(get(address));
      freeTree(get(address + 1));
      free(address);
    }
  }

  public void garbageCollect() {
  }
  
  /** Return the contents of address. */
  public int get(int address) {
    return heap[address];
  }

  /** Set the contents of address to value. */
  public void set(int address, int value) {
    heap[address] = value;
  }

  /** Swap the data at addresses x and y. */
  public void swap(int x, int y) {
    int temp = get(x);
    set(x, y);
    set(y, temp);
  }
  
}
