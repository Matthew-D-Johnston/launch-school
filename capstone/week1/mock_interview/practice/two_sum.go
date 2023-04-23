package main

import "fmt"

func twoSum(nums []int, target int) []int {
	intIndexes := make(map[int]int)

	for ptr := 0; ptr < len(nums); ptr++ {
		val, ok := intIndexes[target-nums[ptr]]

		if ok {
			return []int{val, ptr}
		} else {
			intIndexes[nums[ptr]] = ptr
		}
	}

	return []int{}
}

func main() {
	fmt.Println(twoSum([]int{2, 7, 11, 15}, 9))
	fmt.Println(twoSum([]int{3, 2, 4}, 6))
	fmt.Println(twoSum([]int{3, 3}, 6))
}
