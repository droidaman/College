// @author (your name) 
// @version (a version number or a date)
public class TreePlay
{
    public TreeNode<Integer> buildTree (int depth) 
    {
        TreeNode<Integer> rootNode = new TreeNode<Integer>(depth, null, null);
        
        return keepBuilding (rootNode, depth - 1);
    }
    
    public TreeNode<Integer> keepBuilding (TreeNode<Integer> node, int depth) 
    {
        if (depth == -1) {
            return null;
        } else {
            TreeNode<Integer> newLeft = new TreeNode<Integer> (depth, null, null);
            TreeNode<Integer> newRight = new TreeNode<Integer> (depth, null, null);
            
            node.setLeftChild(keepBuilding(newLeft, depth - 1));
            node.setRightChild(keepBuilding(newRight, depth - 1));
            return node;
        }
    }

    public int countNodes (TreeNode<Integer> node) {
        if (node == null) {
            return 0;
        } else {
            return 1 + countNodes(node.getLeftChild()) + countNodes(node.getRightChild());
        }
    }
}
