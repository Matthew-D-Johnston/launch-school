package main

/*
Given the root node of a binary search tree and two integers
low and high, return the sum of values of all nodes with a value
in the inclusive range [low, high].

Base Case:
- root == nil
- return 0

Recursive Definition:
1. Something needs to be true: if Node.Val >= low && Node.Val <= high
2. rangeSumBST(leftside)
3. rangeSumBST(rightside)

*/

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func rangeSumBST(root *TreeNode, low int, high int) int {
	if root == nil {
		return 0
	}

	if root.Val >= low && root.Val <= high {
		return root.Val + rangeSumBST(root.Left, low, high) + rangeSumBST(root.Right, low, high)
	} else {
		return rangeSumBST(root.Left, low, high) + rangeSumBST(root.Right, low, high)
	}
}
