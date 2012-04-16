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


// Introduced in Chapter 11
/** A hash table of Comparables, using double hashing. */
public class HashTable<E> implements Set<E> {

  /**
   * Special object to indicate a slot previously occupied by a
   * Comparable.
   */
  private E deleted;

  /** Comparables stored in this table. */
  private E[] data;

  /** Number of occupied slots (including deleteds). */
  private int fullness;

  /**
   * A HashTable is initially empty, but an initial capacity may
   * be specified.
   */
  public HashTable(E deleted) {
    data = (E[])(new Object[1]); // All null; compiler warning
    fullness = 0;
    this.deleted = deleted;
  }

  public void add(E target) {
    if (fullness >= data.length / 2) {
      rehash();
    }
    int start = hash1(target);
    int i = start;
    while (data[i] != null) {
      if (target.equals(data[i])) {
        return;
      }
      i = (i + hash2(target)) % data.length;
      if (i == start) {
        return;
      }
    }
    data[i] = target;
    fullness++;
  }
  
  public boolean contains(E target) {
    int start = hash1(target);
    int i = start;
    while (data[i] != null) {
      if (target.equals(data[i])) {
        return true;
      }
      i = (i + hash2(target)) % data.length;
      if (i == start) {
        return false;
      }
    }
    return false;
  }

  /** First hash function. */
  protected int hash1(E target) {
    return Math.abs(target.hashCode()) % data.length;
  }

  /** Second hash function. */
  protected int hash2(E target) {
    int result = Math.abs(target.hashCode()) % (data.length - 1);
    if (result % 2 == 0) { return result + 1; }
    return result;
  }

  /**
   * Copy all of the elements into a new array twice as large.
   */
  public void rehash() {
    HashTable<E> newTable = new HashTable<E>(deleted);
    newTable.data = (E[])(new Object[data.length * 2]); // Warning
    for (int i = 0; i < data.length; i++) {
      if ((data[i] != null) && (data[i] != deleted)) {
        newTable.add(data[i]);
      }
    }
    data = newTable.data;
    fullness = newTable.fullness;
  }
  
  public void remove(E target) {
    int start = hash1(target);
    int i = start;
    while (data[i] != null) {
      if (target.equals(data[i])) {
        data[i] = deleted;
        return;
      }
      i = (i + hash2(target)) % data.length;
      if (i == start) {
        return;
      }
    }
  }

  public int size() {
    int tally = 0;
    for (E item : data) {
      if ((item != null) && (item != deleted)) {
        tally++;
      }
    }
    return tally;
  }

}
