## Find Peak Element

#### Problem

##### Instructions:

A peak element is an element that is strictly greater than its neighbors.

Given a **0-indexed** integer array `nums`, find a peak element, and return its index. If the array contains multiple peaks, return the index to **any of the peaks**.

You may imagine that `nums[-1] = nums[n] = -∞`. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.

You must write an algorithm that runs in `O(log n)` time.

##### Definitions / Rules (explicit and implicit):

* Peak element: element that is strictly greater than its neighbours (i.e. both neighbours are strictly lower than the peak element).
* Return the index of a single peak element. There may be multiple peak elements, but you are only required to find one.
* An element at either end of the array is always greater than a neighbour that is outside the array.
* The algorithm must have a time complexity of `O(log n)`.

##### Input / Output:

Input: an array of integers.

Output: the index of a single peak element.

##### Mental Model

The brute force approach would be to iterate through the entire array and look for a single element whose neighbours were both strictly lower than it. However, this would have a time complexity of `O(N)`. To obtain an algorithm with a time complexity of `O(log N)` we will need to use binary search.  

To perform binary search, we must use the endpoints of the array to obtain a midpoint. We can then take that midpoint and check to see whether it is larger than either of its neighbours. If it is, then we have found a peak and we can return the index at the midpoint. However, if only one of the neighbours is lower and the other is higher, then we are not at a peak. But we know which way to begin searching to find the peak. We must begin searching the other half of the array where the neighbour element is greater. If in the case that both neighbours are greater, then it doesn't matter which way we go. Once we know which direction to go, we then adjust either the upper or lower bound and then recalculate the midpoint of the new smaller subarray of our original array. We once again check to see if we are at a peak or if we need to keep searching another half of the array.

![image-20230104164136189](/Users/matthewjohnston/Library/Application Support/typora-user-images/image-20230104164136189.png)

---

#### Examples / Test Cases

```go
findPeakElement([]int{1, 2, 3, 1})
=> 2
findPeakElement([]int{1, 2, 1, 3, 5, 6, 4})
=> 1 or 5
findPeakElement([]int{1, 2, 3, 4, 5, 6})
=> 5
findPeakElement([]int{1, 2, 3, 4, 7, 6})
=> 4
```

---

#### Data Structures

##### Input

* An array of integers.

##### Output:

* An integer.

---

#### Algorithm

* Suppose the input array is `nums`.
* Create two variables that represent the endpoints of the array: `left := 0` and `right := len(nums)-1`
* Then we want to initiate a `for` loop that will continue to loop while `left <= right`.
  * Within the loop, we must initialize a `midpoint` value and assign it the value of `(left + right) / 2`. This will give us the middle index of the array.
  * Next we initialize a `valueAtMidpoint` variable and assign it to the value found at `nums[midpoint]`.
  * We then initiate an `if` conditional that checks to see if `valueAtMidpoint` is greater than both of its neighbours. Hence, `valueAtMidpoint > nums[midpoint - 1] && valueAtMidpoint > nums[midpoint + 1]`
    * If this condition returns `true` then we have found a peak and we return the midpoint index, or `midpoint`
  * We also need an `else if` condition for the case where one of the neighbours is greater than the midpoint element and one neighbour is smaller. Let's say, `else if valueAtMidpoint < nums[midpoint + 1]`. This condition will return `true` for each of the following cases: where the value at the midpoint is larger than `nums[midpoint - 1]` and for when it is smaller.
    *  If this condition returns `true`, then we change our `left` endpoint index to equal `midpoint + 1`
  * The final `else` condition will cover the case when `valueAtMidpoint < nums[midpoint - 1]` and `valueAtMidpoint > nums[midpoint + 1]`
    * In this case, we change our `right` endpoint index to equal `midpoint - 1`.

---

#### Code

```go
func isPeak(midpoint int, nums []int) bool {
	switch {
	case midpoint == 0:
		return nums[midpoint] > nums[midpoint+1]
	case midpoint == len(nums)-1:
		return nums[midpoint] > nums[midpoint-1]
	default:
		return nums[midpoint] > nums[midpoint-1] && nums[midpoint] > nums[midpoint+1]
	}
}

func findPeakElement(nums []int) int {
	if len(nums) <= 1 {
		return 0
	}

	left := 0
	right := len(nums) - 1

	for left <= right {
		midpoint := (left + right) / 2
		valueAtMidpoint := nums[midpoint]

		if isPeak(midpoint, nums) {
			return midpoint
		} else if valueAtMidpoint < nums[midpoint+1] {
			left = midpoint + 1
		} else {
			right = midpoint - 1
		}
	}

	return -1
}
```

