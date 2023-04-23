package main

import "fmt"

func binarySearch(nums []int, target int) int {
	lowerBound := 0
	upperBound := len(nums) - 1

	for lowerBound <= upperBound {
		midpoint := (lowerBound + upperBound) / 2
		valueAtMidpoint := nums[midpoint]

		if valueAtMidpoint == target {
			return midpoint
		} else if valueAtMidpoint < target {
			lowerBound = midpoint + 1
		} else if valueAtMidpoint > target {
			upperBound = midpoint - 1
		}
	}

	return -1
}

func main() {
	nums := []int{3, 17, 22, 75, 80, 202}
	fmt.Println(binarySearch(nums, 202))
}
