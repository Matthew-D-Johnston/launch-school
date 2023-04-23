package main

type ListNode struct {
	Val  int
	Next *ListNode
}

func hasCycle(head *ListNode) bool {
	if head == nil || head.Next == nil {
		return false
	}

	slowPtr := head
	fastPtr := head.Next

	for slowPtr != fastPtr {
		if fastPtr.Next == nil || fastPtr.Next.Next == nil {
			return false
		}

		slowPtr = slowPtr.Next
		fastPtr = fastPtr.Next.Next
	}

	return true
}
