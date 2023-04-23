package main

type ListNode struct {
	Val  int
	Next *ListNode
}

// Version 1

func removeNthFromEnd(head *ListNode, n int) *ListNode {
	dummyHead := new(ListNode)
	dummyHead.Next = head
	displace := dummyHead
	end := dummyHead

	for i := 1; i <= n; i++ {
		end = end.Next
	}

	for end.Next != nil {
		displace = displace.Next
		end = end.Next
	}

	if displace == dummyHead {
		return displace.Next.Next
	}

	displace.Next = displace.Next.Next
	return head
}

// Version 2

// func removeNthFromEnd(head *ListNode, n int) *ListNode {
// 	// var dummyHead *ListNode
// 	// dummyHead.Next = head
// 	displace := head
// 	end := head

// 	for i := 1; i <= n; i++ {
// 		end = end.Next
// 	}

//     if end == nil {
//         return head.Next
//     }

// 	for end.Next != nil {
// 		displace = displace.Next
// 		end = end.Next
// 	}

// 	// if displace == dummyHead {
// 	// 	return displace.Next.Next
// 	// }

// 	displace.Next = displace.Next.Next
// 	return head
// }
