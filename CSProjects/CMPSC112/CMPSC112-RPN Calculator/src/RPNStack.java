	import java.util.*;
public class RPNStack {
	
	    private ArrayList theStuff;    

	    public RPNStack()
	    {
	       theStuff = new ArrayList();
	    }

	    public void push(Object o)
	    {
	       theStuff.add(o);
	    }
	   
	    public Object pop()
	    {
	       Object topItem;
	       // FIXME: Just put something on the list; remove
	       // item zero and return it?
	       topItem = theStuff.remove(theStuff.size() - 1);
	       return topItem;
	    }
	   
	    public boolean isEmpty()
	    {
	       return theStuff.isEmpty();
	    }

	    public Object peek()
	    {
	       Object topItem;
	       // int indexOfTopOfStack = theStuff.size() - 1;
	       topItem = pop();
	       push(topItem);
	       return topItem;
	    }
	   
	}
