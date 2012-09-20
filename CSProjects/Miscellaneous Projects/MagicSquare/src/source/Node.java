package source;

import java.util.*;

public class Node<E> {
	// A node has two fields: a first, and a rest.
	private E data;
	private ArrayList<Node<E>> children;

	public Node (E data){
		this.data = data;
		children = new ArrayList<Node<E>>();
	}
	
	public ArrayList<Node<E>> getChildren(){
		return children;
	}
	
	public void addChild (E item){
		children.add(new Node<E>(item));
	}

	public E getData(){
		return data;
	}
	
	public void setData(E data){
		this.data = data;
	}
}