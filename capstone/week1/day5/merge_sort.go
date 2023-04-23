package main

import "fmt"

func merge(left, right []int) []int {
	result := []int{}

	ptr1, ptr2 := 0, 0

	for ptr1 < len(left) && ptr2 < len(right) {
		if left[ptr1] <= right[ptr2] {
			result = append(result, left[ptr1])
			ptr1++
		} else {
			result = append(result, right[ptr2])
			ptr2++
		}
	}

	if ptr1 != len(left) {
		result = append(result, left[ptr1:]...)
	} else if ptr2 != len(right) {
		result = append(result, right[ptr2:]...)
	}

	return result
}

func mergeSort(array []int) []int {
	if len(array) == 1 {
		return array
	}

	mid := len(array) / 2
	left := mergeSort(array[0:mid])
	right := mergeSort(array[mid:])
	return merge(left, right)
}

func main() {
	fmt.Println(mergeSort([]int{4, 2, 7, 3, 8, 6, 11, 10}))
	// fmt.Println(merge([]int{1, 4, 6, 7, 15}, []int{2, 5, 9, 11}))
}
