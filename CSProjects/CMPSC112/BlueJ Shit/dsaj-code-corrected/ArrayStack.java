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
/** An array-based Stack. */
public class ArrayStack<E> implements Stack<E> {

  /** Array of items in this Stack. */
  private E[] data;

  /** Number of items currently in this Stack. */
  private int size;

  /** The Stack is initally empty. */
  public ArrayStack() {
    data = (E[])(new Object[1]); // This causes a compiler warning
    size = 0;
  }

  public boolean isEmpty() {
    return size == 0;
  }

  /** Return true if data is full. */
  protected boolean isFull() {
    return size == data.length;
  }

  public E peek() {
    if (isEmpty()) {
      throw new EmptyStructureException();
    }
    return data[size - 1];
  }

  public E pop() {
    if (isEmpty()) {
      throw new EmptyStructureException();
    }
    size--;
    return data[size];
  }

  public void push(E target) {
    if (isFull()) {
      stretch();
    }
    data[size] = target;
    size++;
  }

  /** Double the length of data. */
  protected void stretch() {
    E[] newData = (E[])(new Object[data.length * 2]); // Warning
    for (int i = 0; i < data.length; i++) {
      newData[i] = data[i];
    }
    data = newData;
  }

}
