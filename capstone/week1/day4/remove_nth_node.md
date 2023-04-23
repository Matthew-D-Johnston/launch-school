## Remove Nth Node From End of List

#### Problem

##### Instructions:

Given the `head` of a linked list, remove the `nth` node from the end of the list and return its head.

##### Definitions / Rules (explicit and implicit):







---

#### Algorithm

- create a dummy head variable and initialize it as a Node
- set the dummy head's Next value to head
- create two pointers: displace and end
- initialize both displace and end to equal the dummy head
- initiate a for loop that loops n times
  - within the for loop reset end = end.Next
- initiate a for loop conditional on end.Next != nil
  - within that loop set:
    - displace = displace.Next
    - end = end.Next
- Once we break out of the loop:
- if displace == the dummy head:
    - return displace.next.next
- else:
    - displace.next = displace.next.next
    - return head

  0  1 2 3 4 5    n = 2
   dh
         d
              e