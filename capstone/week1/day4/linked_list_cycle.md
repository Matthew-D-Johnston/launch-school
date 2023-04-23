## Linked List Cycle

#### Problem

##### Instructions:

Given `head`, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Internally, `pos` is used to denote the index of the node that tail's `next` pointer is connected to. **Note that `pos` is not passed as a parameter**.

Return `true` *if there is a cycle in the linked list*. Otherwise, return `false`.

**Constraints:**

- The number of the nodes in the list is in the range `[0, 104]`.
- `-105 <= Node.val <= 105`
- `pos` is `-1` or a **valid index** in the linked-list.

 

**Follow up:** Can you solve it using `O(1)` (i.e. constant) memory?

---

##### Definitions / Rules (explicit and implicit):

* Cycle: there is a node in the list that can be reached again by continuously following the `next` pointer. Essentially, the tail of the linked list does not point to `nil` but instead points to a previous node in the list.
* Return `true` if there is a cycle; `false` otherwise.

##### Input / Output:

* Input: a `head` of a linked list.
* Output: `true` if there is a cycle; `false` otherwise.

##### Mental Model:

Use two pointers to cycle through the nodes, a fast one and a slow one. The slow pointer will move one node at a time while the fast one will move two nodes at a time. If there is just a single node in the list, then we return `false`. Otherwise, start the slow pointer at the first node and the fast pointer at the second node. If ever the next node to the node the fast pointer is currently on is equal to `nil`, then return `false`. Otherwise continue to loop over the nodes until the fast pointer and slow pointer are both currently on the same node.

---

#### Examples / Test Cases

 

**Example 1:**

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)

```
Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
```

**Example 2:**

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test2.png)

```
Input: head = [1,2], pos = 0
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
```

**Example 3:**

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist_test3.png)

```
Input: head = [1], pos = -1
Output: false
Explanation: There is no cycle in the linked list.
```

---

#### Data Structures

##### Input:

* A head `*ListNode` implemented as...

  ```go
  type ListNode struct {
    Val int
    Next *ListNode
  }
  ```

##### Output:

* A boolean

---

#### Algorithm

* Check to see if the given `head` node is equal to `nil` or if the next node of the given head node is equal to `nil`.

* If it is, return `false`

* Initialize a `slowPtr` variable and assign it to the given `head` node.

* Initialize a `fastPtr` variable and assign it to `head.Next`.

* Initiate a `for` loop on the condition that while `slowPtr != fastPtr`.

  * Inside the `for` loop check to see if either `fastPtr.Next == nil` or `fastPtr.Next.Next == nil`

    * If it is, return `false`.

    * If not, then change `slowPtr = slowPtr.next` and `fastPtr = fastPtr.next.next`

* If we break out of the loop without returning `false`, then we know that somehow the `fastPtr` is basically lapping the `slowPtr`, which implies that there is a cycle, so we return `true`.

---

#### Code

```go
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
```

