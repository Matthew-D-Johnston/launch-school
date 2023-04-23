package main

import "fmt"

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

func main() {
	fmt.Println(findPeakElement([]int{1, 2, 3, 1}))
	fmt.Println(findPeakElement([]int{1, 2, 1, 3, 5, 6, 4}))
	fmt.Println(findPeakElement([]int{1, 2, 3, 4, 5, 6}))
	fmt.Println(findPeakElement([]int{1, 2, 3, 4, 7, 8, 9, 6}))
}
