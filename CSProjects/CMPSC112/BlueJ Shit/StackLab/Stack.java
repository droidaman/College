import java.util.ArrayList;
/**
 * Write a description of class Stack here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Stack implements StackInterface
{
    // instance variables - replace the example below with your own
     ArrayList list;
    /**
     * Constructor for objects of class Stack
     */
    public Stack()
    {
       list = new ArrayList();
    }

    /**
     * 
     */
    public void push (Object o) 
    {
        list.add(o);
    }
    
    /**
     * 
     */
    public Object pop()
    {
       Object o = list.remove(list.size() - 1);
       return o;
    }

    /**
     * 
     */
    public Object peek()
    {
        Object o = list.remove(list.size() - 1);
        list.add(0, o);
        return o;
    }
    
    /**
     * 
     */
    public boolean isEmpty()
    {
        return list.isEmpty();
    }
}
