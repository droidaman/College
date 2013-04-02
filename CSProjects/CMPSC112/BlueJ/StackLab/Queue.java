/**
 * Write a description of class Stack here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

import java.util.ArrayList;

public class Queue implements StackInterface
{
    // instance variables - replace the example below with your own
     ArrayList list;
    /**
     * Constructor for objects of class Stack
     */
    public Queue()
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
       Object o = list.remove(0);
       return o;
    }

    /**
     * 
     */
    public Object peek()
    {
        Object o = list.remove(0);
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