package main

/*
Invert Binary Tree

Given the root of a binary tree, invert the tree, and return its
root.

Base Case:
- root == nil
- return root

Recursive Definition:
1. Something needs to be true
2. invertTree(leftside)
3. invertTree(rightside)

*/

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func invertTree(root *TreeNode) *TreeNode {
	if root == nil {
		return root
	}

	leftNode := root.Left
	rightNode := root.Right

	root.Left = rightNode
	root.Right = leftNode

	invertTree(root.Left)
	invertTree(root.Right)

	return root
}
