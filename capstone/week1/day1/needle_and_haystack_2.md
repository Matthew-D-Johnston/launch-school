## Find the Index of the First Occurrence in a String (Needle in the Haystack)

### Problem

##### Instructions

Given two strings `needle` and `haystack`, return the index of the first occurrence of `needle` in `haystack`, or `-1` if `needle` is not part of `haystack`.

##### Definitions/Rules (explicit and implicit):

* Two strings given.
* If more than one occurrence of needle, return the index of the first occurrence.
* Index is the starting index of the needle in the haystack.
* If the needle is not found in the haystack, return `-1`.

##### Input/Output

* Input: a string representing the haystack and a string representing the needle. Haystack is at least length of 1. Both haystack and needle consist of only lowercase English characters.
* Output: the index of the first occurrence of the needle or `-1` if the needle is not found.

##### Mental Model:

Iterate through each character of the haystack starting at index 0. Take a slice of the haystack string and compare it to the needle. If there is a match then return the current index of the haystack. Otherwise continue iterating. If you get to the end of the string and the needle is not found, then return `-1`.

---

### Examples / Test Code

```go
NeedleInTheHaystack("sadbutsad", "sad")
=> 0
NeedleInTheHaystack("leetcode", "leeto")
=> -1
NeedleInTheHaystack("mississippi", "issip")
=> 4
```

---

### Data Structures

##### Input:

* Strings

##### Output:

* Integer

##### Intermediate Data Structures

* Integers and Strings

---

### Algorithm

* Iterate over each character of `haystack` up until the index that is the length of `haystack` minus the length of the `needle`
* Take a slice from the current index of the `haystack` to the index of the `haystack` plus the length of the `needle`.
* Compare that slice to the needle. If they are the same, then return the current index of the `haystack`.
* If we get through iteration without returning anything, then return `-1`.

---

### Code

```go
func NeedleInTheHaystack(haystack string, needle string) int {

	for haystackIndex := 0; haystackIndex <= len(haystack)-len(needle); haystackIndex++ {
		startIndex := haystackIndex
		endIndex := haystackIndex + len(needle)
		slice := haystack[startIndex:endIndex]

		if slice == needle {
			return haystackIndex
		}
	}

	return -1
}
```

