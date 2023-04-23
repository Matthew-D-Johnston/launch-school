## Valid Palindrome II

#### Problem

##### Instructions

Given a string `s`, return `true` *if the* `s` *can be palindrome after deleting **at most one** character from it*.

##### Definitions / Rules (explicit and implicit):

* Palindrome: a string of characters that is the same backwards and forwards (i.e. if the string is reversed it will be the exact same string of characters).
* We can delete at most one character. We can then check if the string is a palindrome after deleting that character.

##### Input / Output:

* Input: a string of characters.
* Output: `true` if the string is a palindrome after deleting at most one character; `false` otherwise.

##### Mental Model

Use two pointers, one at the start of the string and one at the end. Check the characters at each index referenced by the pointers. If they are equal then increase the start pointer by one and decrement the left pointer by one. Keep repeating this comparison and increment/decrement until you reach a comparison where the two characters are not equal. If this is the first unequal comparison, we need to check if by incrementing the start pointer by one we get an equality. If so, we can increment the start pointer to skip over the unequal character. If it's not equal, then we can check by taking the end pointer and skipping to the next character and see if it is equal to the character that start is pointing to. If it is, then we can decrement the end pointer again. We then continue checking the rest of the string. Note that we can only perform this "deletion" at most once. When the start and end pointer have met or passed each other, we are done.

---

#### Examples / Test Cases

**Example 1:**

```
Input: s = "aba"
Output: true
```

**Example 2:**

```
Input: s = "abca"
Output: true
Explanation: You could delete the character 'c'.
```

**Example 3:**

```
Input: s = "abc"
Output: false
```

**Example 4:**

```
Input: s = "abecba"
Output: true
```

---

#### Data Structures

##### Input:

* A string.

##### Output:

* A boolean.

---

#### Algorithm

* Initialize two pointer variables, `start` and `end`. Set `start := 0` and `end := len(str) - 1`
* Initialize a `deletionRemaining` variable and set it equal to `true`
* Then initiate a `for` loop that will run while `start < end`.
  * Inside the `for` loop we need to initiate an `if / else` conditional statement:
  * `if` the characters at the `start` and `end` positions of the string are equal:
    * increment `start` by 1
    * decrement `end` by 1
  * `else` if they are not equal
    * Check to see `if` `deletionRemaining` is equal to `true`.
      * if it is then we have three cases to consider:
      * `if` the character at the next position to the `start` position is equal to the character at the current `end` position: `str[start + 1] == str[end]`
        * increment `start` by 1
        * set `deletionRemaining` to `false`
      * `else if` the character before the currend `end` position is equal to the character at the current `start` position: `str[end - 1] == str[start]`
        * decrement `end` by 1
          * set `deletionRemaining` to `false`
      * `else` if none of these conditions return an equality:
        * return `false`
    * `else` if `deletionRemaining` is equal to `false`:
      * return `false`
    * Increment `start` by 1
    * Decrement `end` by 1
* If we successfully break out of the `for` loop without returning `false` then we can return `true`.

---

#### Code

```go
func validPalindrome(s string) bool {
	start := 0
	end := len(s) - 1
	deletionRemaining := true

	for start <= end {
		if s[start] == s[end] {
			start++
			end--
		} else {
			if deletionRemaining {
				if checkPalindrome(s[start+1 : end+1]) {
					return checkPalindrome(s[start+1 : end+1])
				} else if checkPalindrome(s[start:end]) {
					return checkPalindrome(s[start:end])
				} else {
					return false
				}
			} else {
				return false
			}
		}
	}

	return true
}

func checkPalindrome(s string) bool {
	start := 0
	end := len(s) - 1

	for start < end {
		if s[start] == s[end] {
			start++
			end--
		} else {
			return false
		}
	}

	return true
}
```

