package main

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func preorderTraversal(root *TreeNode) []int {
	return helper(root, []int{})
}

func helper(node *TreeNode, result []int) []int {
	if node == nil {
		return result
	}

	result = append(result, node.Val)
	result = helper(node.Left, result)
	result = helper(node.Right, result)

	return result
}
