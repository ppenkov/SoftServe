using System;

namespace TreeAlgorithm
{
    class Program
    {
        static void Main(string[] args)
        {
            BinaryTree tree = new BinaryTree(33);
            tree.Left = new BinaryTree(15);
            tree.Right = new BinaryTree(12);
            tree.Left.Left = new BinaryTree(20);
            tree.Left.Right = new BinaryTree(3);
            tree.Right.Left = new BinaryTree(14);
            tree.Right.Right = new BinaryTree(7);
            tree.Left.Left.Left = new BinaryTree(9);
            tree.Left.Left.Right = new BinaryTree(8);
            tree.Right.Right.Left = new BinaryTree(10);
            tree.Right.Right.Right = new BinaryTree(11);

            Console.WriteLine("BinaryTree structure:");
            Console.WriteLine();
            tree.PrintTree(tree);

            Console.WriteLine();
            BinaryTree firstNode = tree.InputNode();
            BinaryTree secondNode = tree.InputNode();

            firstNode = tree.FindNode(tree, firstNode);
            secondNode = tree.FindNode(tree, secondNode);
            Console.WriteLine();

            tree.PrintLowestCommonAncestor(tree, firstNode, secondNode);
            Console.WriteLine();
        }
    }
}
