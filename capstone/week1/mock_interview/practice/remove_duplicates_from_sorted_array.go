package main

import "fmt"

func removeDuplicates(nums []int) int {
	length := len(nums)
	ptr := 0

	for ptr < length-1 {
		if nums[ptr] == nums[ptr+1] {
			toDelete := nums[ptr+1]
			nums = append(nums[0:ptr+1], nums[ptr+2:]...)
			nums = append(nums, toDelete)
			length--
		} else {
			ptr++
		}
	}

	return length
}

func main() {
	fmt.Println(removeDuplicates([]int{1, 1, 2}))
	fmt.Println(removeDuplicates([]int{1, 1, 2, 3, 3}))
	fmt.Println(removeDuplicates([]int{0, 0, 1, 1, 1, 2, 2, 3, 3, 4}))
}
