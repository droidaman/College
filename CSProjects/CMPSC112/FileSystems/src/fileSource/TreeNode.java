/* NOTE
 * When accessing the data in the nodes
 * you will need to cast the object as a 'file'.
 * This is because it sonly accepts the generic 'object'
 */

package fileSource;

import java.util.*;
public class TreeNode {
	
	private ArrayList<TreeNode> children;
	private Object data;
	
	public TreeNode(){
		children = new ArrayList<TreeNode>();
	}
	
	public ArrayList<TreeNode> getChildren(){
		return children;
	}

	public void addChild(TreeNode n){
		children.add(n);
	}
	
	public Object getData(){
		return data;
	}
	
	public void setData(Object newData){
		data = newData;
	}
	
}
