package main

import "fmt"

func minimumTotal(triangle [][]int) int {
	row, idx := 0, 0
	cache := make(map[[2]int]int)
	return helper(triangle, row, idx, cache)
}

func helper(triangle [][]int, row int, idx int, cache map[[2]int]int) int {
	if len(triangle)-1 == row {
		return triangle[row][idx]
	}

	total1, ok1 := cache[[2]int{row + 1, idx}]
	total2, ok2 := cache[[2]int{row + 1, idx + 1}]

	if !ok1 {
		cache[[2]int{row + 1, idx}] = helper(triangle, row+1, idx, cache)
		total1 = cache[[2]int{row + 1, idx}]
	}

	if !ok2 {
		cache[[2]int{row + 1, idx + 1}] = helper(triangle, row+1, idx+1, cache)
		total2 = cache[[2]int{row + 1, idx + 1}]
	}

	return triangle[row][idx] + min(total1, total2)
}

func min(val1, val2 int) int {
	if val1 < val2 {
		return val1
	}
	return val2
}

func main() {
	triangle := [][]int{{2}, {3, 4}, {6, 5, 7}, {4, 1, 8, 3}}
	fmt.Println(minimumTotal(triangle))
}
