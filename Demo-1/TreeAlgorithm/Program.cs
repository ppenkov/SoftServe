using System;

namespace TreeAlgorithm
{
    class Program
    {
        static void Main(string[] args)
        {
            BinaryTree tree = new BinaryTree("President");
            tree.Left = new BinaryTree("First Vice President");
            tree.Right = new BinaryTree("Second Vice President");
            tree.Left.Left = new BinaryTree("Executive Director");
            tree.Left.Right = new BinaryTree("Director");
            tree.Right.Left = new BinaryTree("Manager");
            tree.Right.Right = new BinaryTree("Supervisor");
            tree.Left.Left.Left = new BinaryTree("Specialist");
            tree.Left.Left.Right = new BinaryTree("Senior Specialist");
            tree.Right.Right.Left = new BinaryTree("Expert");
            tree.Right.Right.Right = new BinaryTree("Senior Expert");

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
