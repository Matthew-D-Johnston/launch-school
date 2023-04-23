package main

type ListNode struct {
	Val  int
	Next *ListNode
}

func reverseList(head *ListNode) *ListNode {
	if head == nil || head.Next == nil {
		return head
	}

	var previous *ListNode = nil
	current := head
	next := head.Next

	for next != nil {
		current.Next = previous
		previous = current
		current = next
		next = current.Next
	}

	current.Next = previous
	return current
}
