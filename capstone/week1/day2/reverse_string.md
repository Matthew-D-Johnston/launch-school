## Reverse String

#### Problem

##### Instructions:

Write a function that reverses a string. The input string is given as an array of characters `s`.  

You must do this by modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm) with `O(1)` extra memory.  

##### Definitions/Rules (explicit and implicit)

* Reverse the string.
* Input string is given as an array of characters.
* Output is also an array of characters.
* Must modify the array in-place using O(1) extra memory.

##### Input/Output

* Input: an array of characters.
* Output: an array of characters.

##### Mental Model

Iterate through the given array starting with pointers at both ends. For each position, swap the characters corresponding to each pointer. Increment the pointer at the start and decrement the pointer at the end. Then swap again. Continue this process until the two pointers are at the same index.

---

#### Examples / Test Cases

```go
reverseString([]byte{"h", "e", "l", "l", "o"})
=> ["o", "l", "l", "e", "h"]
reverseString([]byte{"H", "a", "n", "n", "a", "h"})
=> ["h", "a", "n", "n", "a", "H"]
reverseString([]byte{"x"})
=> ["x"]
reverseString([]byte{"x", "o"})
=> ["o", "x"]
```

---

#### Data Structures

##### Input:

* An array of bytes.

##### Output:

* An array of bytes.

---

#### Algorithm

* Set two pointer variables: `startPointer := 0` and `endPointer := len(arr) - 1`
* Begin a `for` loop with the condition that `startPointer < endPointer`
* Swap the characters that the pointer indexes are pointing at.
* Increment `startPointer` by `1` and decrement `endPointer` by `1`.
* Once the loop is complete (i.e. `startPointer >= endPointer`), return the given input array.

