---
You have one hour to complete this problem. 

Note your starting time as the time you finish reading
these instructions.

As stated before, you are discouraged from using any outside
resources to complete this problem. Doing so will be considered
a violation of the Allegheny honor code.
---

Your assignment is to implement "justEvens", a method in
the "RemoveEvens" class. Your code should, in a naturally
recursive manner, walk through the list given and return
a new list containing only those values that are even. 

Note that the LinkedList that you are working with only
implements the interface OEL.

public interface OEL<E>
{
   boolean isEmpty();
   E first();
   LinkedList<E> rest();
   LinkedList<E> add(E item);
}
      
This is a smaller interface than we have seen before. 
If you recall, the full List interface includes methods
like "get" and "remove"; this interface only includes four
methods: isEmpty, first, rest, and add. Your solution should
only use those methods.

A working implementation of a linked list is provided for you
as a library of code (hence the "import" statement at the 
top of RemoveEvens.java). You should not need to implement
a linked list, a node, or any code other than the single 
method "justEvens".

Good luck,
Matt