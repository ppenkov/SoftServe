using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TreeAlgorithm
{
    class Program
    {
        static void Main(string[] args)
        {
            Tree root = new Tree(33);
            root.left = new Tree(15);
            root.right = new Tree(12);
            root.left.left = new Tree(20);
            root.left.right = new Tree(3);
            root.right.left = new Tree(14);
            root.right.right = new Tree(7);

            Console.WriteLine("    {0}" + Environment.NewLine + " {1}    {2}" + Environment.NewLine + "{3} {4}  {5} {6}", root.node, root.left.node, root.right.node,
               root.left.left.node, root.left.right.node, root.right.left.node, root.right.right.node);

            Tree firstNode = root.left.left;
            Tree secondNode = root.right.right;

            Console.WriteLine();
            Tree commonAncestor = FindLowestCommonAncestor(root, firstNode, secondNode);
            Console.WriteLine("The Lowest Common Ancestor of {0} and {1} is: {2}", root.left.left.node, root.right.right.node, commonAncestor.node);
        }


        public static Tree FindLowestCommonAncestor(Tree root, Tree firstNode, Tree secondNode)
        {
            if (root == null)
            {
                return null;
            }

            if (root == firstNode || root == secondNode)
            {
                return root;
            }

            Tree left = FindLowestCommonAncestor(root.left, firstNode, secondNode);
            Tree right = FindLowestCommonAncestor(root.right, firstNode, secondNode);

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
    }
}
