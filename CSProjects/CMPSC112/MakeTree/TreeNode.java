
// @author (your name) 
// @version (a version number or a date)
public class TreeNode<E>
{
   E value;
   TreeNode<E> leftChild;
   TreeNode<E> rightChild;
   
   public TreeNode (E value, TreeNode<E> left, TreeNode<E> right)
   {
       this.value = value;
       this.leftChild = left;
       this.rightChild = right;
    }
    
    public E getValue ()
    {
        return value;
    }
    
    public TreeNode<E> getLeftChild () 
    {
        return leftChild;
    }
    
    public TreeNode<E> getRightChild()
    {
        return rightChild;
    }
    
    public void setLeftChild(TreeNode<E> ch) 
    {
        this.leftChild = ch;
    }
    
    public void setRightChild(TreeNode<E> ch) 
    {
        this.rightChild = ch;
    }
    
}
