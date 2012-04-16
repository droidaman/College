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


/** Test code from part 2. */
public class Test {

  public static void main(String[] args) {
    // Array stack
    {
      System.out.println("Array stack:");
      Stack<Integer> s = new ArrayStack<Integer>();
      for (int i = 1; i <= 5; i++) {
        s.push(i);
      }
      for (int i = 1; i <= 5; i++) {
        System.out.print(s.pop());
      }
      System.out.println();
    }
    // Array queue
    {
      System.out.println("Array queue:");
      Queue<Integer> q = new ArrayQueue<Integer>();
      for (int i = 1; i <= 5; i++) {
        q.add(i);
      }
      for (int i = 1; i <= 5; i++) {
        System.out.print(q.remove());
      }
      System.out.println();
    }
    // Array list
    {
      System.out.println("Array list:");
      List<Integer> ls = new ArrayList<Integer>();
      for (int i = 1; i <= 5; i++) {
        ls.add(i);
      }
      System.out.println(ls);
      ls.set(4, 99);
      System.out.println(ls);
      System.out.println(ls.contains(new Integer(3)));
      System.out.println(ls.get(0));
      System.out.println(ls.isEmpty());
      System.out.println(ls.size());
      for (int i = 1; i <= 5; i += 2) {
        ls.remove(new Integer(i));
      }
      System.out.println(ls);
      System.out.println(ls.contains(new Integer(3)));
      ls.remove(0);
    }
    // Linked stack
    {
      System.out.println("Linked stack:");
      Stack<Integer> s = new LinkedStack<Integer>();
      for (int i = 1; i <= 5; i++) {
        s.push(i);
      }
      for (int i = 1; i <= 5; i++) {
        System.out.print(s.pop());
      }
      System.out.println();
    }
    // Linked queue
    {
      System.out.println("Linked queue:");
      Queue<Integer> q = new LinkedQueue<Integer>();
      for (int i = 1; i <= 5; i++) {
        q.add(i);
      }
      for (int i = 1; i <= 5; i++) {
        System.out.print(q.remove());
      }
      System.out.println();
    }
    // Linked list
    {
      System.out.println("Linked list:");
      List<Integer> ls = new LinkedList<Integer>();
      for (int i = 1; i <= 5; i++) {
        ls.add(i);
      }
      System.out.println(ls);
      ls.set(4, 99);
      System.out.println(ls);
      System.out.println(ls.contains(new Integer(3)));
      System.out.println(ls.get(0));
      System.out.println(ls.isEmpty());
      System.out.println(ls.size());
      for (int i = 1; i <= 5; i += 2) {
        ls.remove(new Integer(i));
      }
      System.out.println(ls);
      System.out.println(ls.contains(new Integer(3)));
      ls.remove(0);
    }
  }

}
