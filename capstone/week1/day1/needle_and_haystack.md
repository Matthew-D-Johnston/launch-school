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

Iterate through each character of the haystack starting at index 0. At the same time iterate through the characters of the needle starting at 0. If the characters from the two strings match continue to increment each index by 1. If the characters ever do not match, then restart the needle's index at 0. If you get to the end of the needle string then subtract the length of the needle from the index of the haystack to retrieve the starting index and return that index. If you get to the end of the haystack and no needle was found then return -1.

---

### Examples / Test Code

```go
NeedleInTheHaystack("sadbutsad", "sad")
=> 0
NeedleInTheHaystack("leetcode", "leeto")
=> 0
NeedleInTheHaystack("mississippi", "issip")
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

* Create one variable:`needleIndex` and initialize with the value of `0`.
* Iterate over each character of `haystack`.
* Compare each character of `haystack` with each character of `needle`.
  * if they are equal:
    * check if `needleIndex + 1` equals the length of `needle`
      * if they are equal:
        * Subtract the length of `needle` minus `1` from the current index of the `haystack` and return that number.
      * if they are not equal:
        * increment `needleIndex` by `1`
  * if they are not equal:
    * reset `needleIndex` to `0`
* If we get to the end of the iteration of `haystack` without returning anything, then return `-1`

---

### Code

```go
```

