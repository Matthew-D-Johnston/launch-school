package main

import "fmt"

func canJump(nums []int) bool {
	if len(nums) == 1 {
		return true
	}

	a := len(nums) - 1
	r := a - 1

	for r >= 0 {
		if nums[r] >= a-r {
			a = r
		}
		r--
	}

	if a == 0 {
		return true
	}

	return false
}

func main() {
	fmt.Println(canJump([]int{2, 3, 1, 1, 4}))
	fmt.Println(canJump([]int{3, 2, 1, 0, 4}))
}
