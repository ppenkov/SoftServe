using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TreeAlgorithm
{
    public class Tree
    {
        public int node;
        public Tree left;
        public Tree right;

        public Tree(int val)
        {
            node = val;
            left = null;
            right = null;
        }
    }
}
