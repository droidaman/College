/**
 * The interface for the Stack and Queue
 * 
 * @author (Braden Licastro) 
 * @version (2/15/11)
 */

package slcode;

public interface StackInterface
{
    public void push(Object o);
    public Object pop();
    public Object peek();
    public boolean isEmpty();
}