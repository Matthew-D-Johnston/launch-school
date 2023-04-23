package main

import "fmt"

// O(N^2) approach:

// func twoSum(nums []int, target int) []int {

// 	for outIDX, outNUM := range nums {
// 		for inIDX, inNUM := range nums {
// 			if outIDX != inIDX && outNUM+inNUM == target {
// 				return []int{outIDX, inIDX}
// 			}
// 		}
// 	}

// 	return make([]int, 0)
// }

// O(N) approach

func twoSum(nums []int, target int) []int {
	numIDXs := make(map[int]int)

	for idx, num := range nums {
		numIDXs[num] = idx
	}

	for idx, num := range nums {
		counterpart := target - num

		if _, ok := numIDXs[counterpart]; ok && idx != numIDXs[counterpart] {
			return []int{idx, numIDXs[counterpart]}
		}
	}

	return []int{}
}

func main() {
	nums := []int{2, 7, 11, 15}
	fmt.Println(twoSum(nums, 9))
	nums = []int{3, 2, 4}
	fmt.Println(twoSum(nums, 6))
	nums = []int{3, 3}
	fmt.Println(twoSum(nums, 6))
}
