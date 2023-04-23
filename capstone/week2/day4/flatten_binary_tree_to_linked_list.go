package main

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func flatten(root *TreeNode) {
	result := helper(root, []*TreeNode{})

	for idx, node := range result {
		if idx == len(result)-1 {
			node.Right = nil
		} else {
			node.Right = result[idx+1]
		}
		node.Left = nil
	}
}

func helper(node *TreeNode, result []*TreeNode) []*TreeNode {
	if node == nil {
		return result
	}

	result = append(result, node)
	result = helper(node.Left, result)
	result = helper(node.Right, result)

	return result
}
