
public class MakeTree
{
    public TreeNode<Integer> buildTree (int val) {
        if (val == 1) {
            return new TreeNode<Integer>(val, null, null);
        } else {
            /* The Long Version
            TreeNode<Integer> anode;
            TreeNode<Integer> left;
            TreeNode<Integer> right;
            
            left = buildTree(val - 1);
            right = buildTree(val - 1);
            
            anode = new TreeNode<Integer>(val, left, right);
            
            return anode;
            */
           
           // The Short Version
           return new TreeNode<Integer>(val, 
                                        buildTree(val - 1),
                                        buildTree(val - 1));
        }
    }
}
