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


// Introduced in Chapter 5
/** An array-based Queue. */
public class ArrayQueue<E> implements Queue<E> {

  /** Array of items in this Queue. */
  private E[] data;

  /** Index of the frontmost element in this Queue. */
  private int front;

  /** Number of items currently in this Queue. */
  private int size;

  /** The Queue is initially empty. */
  public ArrayQueue() {
    data = (E[])(new Object[1]); // This causes a compiler warning
    size = 0;
    front = 0;
  }

  public void add(E target) {
    if (isFull()) {
      stretch();
    }
    data[(front + size) % data.length] = target;
    size++;
  }

  public boolean isEmpty() {
    return size == 0;
  }

  /** Return true if data is full. */
  protected boolean isFull() {
    return size == data.length;
  }

  public E remove() {
    if (isEmpty()) {
      throw new EmptyStructureException();
    }
    E result = data[front];
    front = (front + 1) % data.length;
    size--;
    return result;
  }

  /** Double the length of data. */
  protected void stretch() {
    E[] newData = (E[])(new Object[data.length * 2]); // Warning
    for (int i = 0; i < data.length; i++) {
      newData[i] = data[(front + i) % data.length];
    }
    data = newData;
    front = 0;
  }

}
