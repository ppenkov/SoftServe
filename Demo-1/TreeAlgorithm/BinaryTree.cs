using System;

namespace TreeAlgorithm
{
    public class BinaryTree
    {
        private string value;
        private BinaryTree root;
        private BinaryTree left;
        private BinaryTree right;

        public string Value
        {
            get { return value; }
            set { this.value = value; }
        }

        public BinaryTree Root
        {
            get { return root; }
            set { root = value; }
        }

        public BinaryTree Left
        {
            get { return left; }
            set { left = value; }
        }

        public BinaryTree Right
        {
            get { return right; }
            set { right = value; }
        }

        // Contructor that constructs the Tree, getting the value of each node of the BinaryTree.
        public BinaryTree(string value)
        {
            this.value = value;
        }

        // Method that prints the BinaryTree in a Preorder manner.
        public void PrintTree(BinaryTree root, int indent = 0)
        {
            if (root == null)
            {
                return;
            }

            Console.Write(new string(' ', 2 * indent));
            Console.WriteLine(root.value);
            PrintTree(root.left, indent + 1);
            PrintTree(root.right, indent + 1);
        }

        // Method where the user inputs the nodes that will be search.
        // This method catches a format exceptions.
        public BinaryTree InputNode()
        {
                BinaryTree node;
                Console.Write("Enter a node from the tree to find the LCA: ");
                node = new BinaryTree(Console.ReadLine());
                return node;
        }

        // Method that finds the current node we search in the BinaryTree.
        public BinaryTree FindNode(BinaryTree root, BinaryTree node)
        {
            if (root == null)
            {
                return null;
            }
            else if (object.Equals(root.value, node.value))
            {
                node = root;
                return node;
            }
            else
            {
                BinaryTree first = FindNode(root.left, node);

                if (first != null)
                {
                    return first;
                }

                BinaryTree second = FindNode(root.right, node);

                if (second != null)
                {
                    return second;
                }
                return null;
            }
        }

        // Method that finds the lowest common ancestor of two current nodes in the BinaryTree.
        private BinaryTree findLowestCommonAncestor(BinaryTree root, BinaryTree firstNode, BinaryTree secondNode)
        {
            if (root == null)
            {
                return null;
            }

            if (root == firstNode || root == secondNode)
            {
                return root;
            }

            BinaryTree left = findLowestCommonAncestor(root.left, firstNode, secondNode);
            BinaryTree right = findLowestCommonAncestor(root.right, firstNode, secondNode);

            if (left != null && right != null)
            {
                return root;
            }

            if (left != null)
            {
                return left;
            }
            else
            {
                return right;
            }
        }

        // Method that prints the lowest common ancestor of two current nodes in the BinaryTree.
        // We also check if the two nodes, selected by the user, are found in the BinaryTree.
        public void PrintLowestCommonAncestor(BinaryTree root, BinaryTree firstNode, BinaryTree secondNode)
        {
            if (firstNode == null && secondNode == null)
            {
                Console.WriteLine("Both elements are not found in the tree.");
                return;
            }

            if (firstNode == null)
            {
                Console.WriteLine("The first element is not found in the tree.");
                return;
            }

            if (secondNode == null)
            {
                Console.WriteLine("The second element is not found in the tree.");
                return;
            }

            BinaryTree ancestor = findLowestCommonAncestor(root, firstNode, secondNode);
            Console.WriteLine("The Lowest Common Ancestor of the {0} and the {1} is the {2}.", firstNode.Value, secondNode.Value, ancestor.Value);
        }
    }
}