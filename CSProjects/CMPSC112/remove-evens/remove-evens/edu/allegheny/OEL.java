package edu.allegheny;

// You may not modify this interface.
// Your LinkedList implementation only has
// access to the methods described below.
public interface OEL<E>
{
   boolean isEmpty();
   E first();
   LinkedList<E> rest();
   LinkedList<E> add(E item);
}
