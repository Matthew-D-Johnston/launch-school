package main

import "fmt"

func canJump(nums []int) bool {
	cache := make(map[[2]int]bool)

	return helper(nums, cache)
	// if len(nums) == 1 {
	// 	return true
	// }

	// elem := nums[0]

	// if elem == 0 {
	// 	return false
	// }

	// for i := 1; i <= elem; i++ {
	// 	if canJump(nums[i:]) {
	// 		return canJump(nums[i:])
	// 	}
	// }

	// return false
}

func helper(nums []int, cache map[[2]int]bool) bool {
	if len(nums) == 1 {
		return true
	}

	elem := nums[0]

	if elem == 0 {
		return false
	}

	for i := 1; i <= elem; i++ {
		slice := nums[i:]
		length := len(slice)

		val, ok := cache[[2]int{i, length}]

		if ok {
			if val {
				return val
			}
		} else {
			cache[[2]int{i, length}] = helper(slice, cache)

			if cache[[2]int{i, length}] {
				return cache[[2]int{i, length}]
			}
		}

		// if canJump(nums[i:]) {
		// 	return canJump(nums[i:])
		// }
	}

	return false
}

func main() {
	fmt.Println(canJump([]int{2, 3, 1, 1, 4}))
	fmt.Println(canJump([]int{3, 2, 1, 0, 4}))
}
