package main

type ListNode struct {
	Val  int
	Next *ListNode
}

func mergeTwoLists(list1 *ListNode, list2 *ListNode) *ListNode {
	var head *ListNode
	var current *ListNode

	if list1 == nil {
		return list2
	}

	if list2 == nil {
		return list1
	}

	if list1.Val <= list2.Val {
		head = list1
		current = list1
		list1 = current.Next
	} else {
		head = list2
		current = list2
		list2 = current.Next
	}

	for list1 != nil && list2 != nil {
		if list1.Val <= list2.Val {
			current.Next = list1
			current = list1
			list1 = current.Next
		} else {
			current.Next = list2
			current = list2
			list2 = current.Next
		}
	}

	if list1 == nil {
		current.Next = list2
	} else if list2 == nil {
		current.Next = list1
	}

	return head
}
