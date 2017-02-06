using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TreeAlgorithm
{
    public class Tree<T>
    {
        private T value;
        private List<Tree<T>> children;
        private Tree<int> firstNode;
        private Tree<int> secondNode;
        private Tree<int> commonAncestor;

        public T Value
        {
            get { return this.value; }
            set { this.value = value; }
        }

        public List<Tree<T>> Children
        {
            get { return children; }
            set { children = value; }
        }

        public Tree<int> FirstNode
        {
            get { return firstNode; }
            set { firstNode = value; }
        }

        public Tree<int> SecondNode
        {
            get { return secondNode; }
            set { secondNode = value; }
        }

        public Tree<int> CommonAncestor
        {
            get { return commonAncestor; }
            set { commonAncestor = value; }
        }

        public Tree(T value, params Tree<T>[] children)
        {
            this.Value = value;
            this.Children = new List<Tree<T>>();

            foreach (var child in children)
            {
                this.Children.Add(child);
            }
        }

        public Tree(Tree<int> firstNode, Tree<int> secondNode, Tree<int> commonAncestor)
        {
            this.firstNode = firstNode;
            this.secondNode = secondNode;
            this.commonAncestor = commonAncestor;
        }

        public void Print(int indent = 0)
        {
            Console.Write(new string(' ', 2 * indent));
            Console.WriteLine(this.Value);

            foreach (var child in this.Children)
            {
                child.Print(indent + 1);
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Tree<int> tree =
                new Tree<int>(7,
                    new Tree<int>(19,
                        new Tree<int>(1),
                        new Tree<int>(12),
                        new Tree<int>(31)),
                    new Tree<int>(21),
                    new Tree<int>(14,
                        new Tree<int>(23),
                        new Tree<int>(6)));

            Console.WriteLine("Tree (indented):");
            tree.Print();

            Console.WriteLine();
            Console.WriteLine("Finding the lowest ancestor:");

            Tree<int> firstNode = tree.FirstNode;
            Tree<int> secondNode = tree.SecondNode;
            Tree<int> commonAncestor = tree.CommonAncestor;

            Tree<int> ancestor = new Tree<int>(firstNode, secondNode, commonAncestor);

        }
    }
}
