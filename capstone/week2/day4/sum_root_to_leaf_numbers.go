package main

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func sumNumbers(root *TreeNode) int {
	return helper(root, 0)
}

func helper(node *TreeNode, val int) int {
	if node == nil {
		return 0
	}

	newVal := val*10 + node.Val

	if node.Left == nil && node.Right == nil {
		return newVal
	}

	return helper(node.Left, newVal) + helper(node.Right, newVal)
}
