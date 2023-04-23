package main

/*
Given a binary tree, determine if it is height-balanced.

Height balanced definition: A height-balanced binary tree
is a binary tree in which the depth of the two subtrees of
every node never differs by more than one.

Base Case:
- root == nil
- return true

Recursive Definition:
1. Something needs to be true
2. isBalanced(leftside)
3. isBalanced(rightside)


*/

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func isBalanced(root *TreeNode) bool {
	if root == nil {
		return true
	}

	leftCount := maxDepth(root.Left)
	rightCount := maxDepth(root.Right)
	difference := leftCount - rightCount

	return (difference >= -1 && difference <= 1) && isBalanced(root.Left) && isBalanced(root.Right)

}

func maxDepth(root *TreeNode) int {
	if root == nil {
		return 0
	}

	return 1 + max(maxDepth(root.Left), maxDepth(root.Right))
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
