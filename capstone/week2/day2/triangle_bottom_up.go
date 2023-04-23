package main

import "fmt"

func minimumTotal(triangle [][]int) int {
	if len(triangle) == 1 {
		return triangle[0][0]
	}
	cache := make(map[[2]int]int)
	bottomOfTriangle := triangle[len(triangle)-1]

	for idx, val := range bottomOfTriangle {
		cache[[2]int{len(triangle) - 1, idx}] = val
	}

	for r := len(triangle) - 2; r >= 0; r-- {
		for idx, val := range triangle[r] {
			cache[[2]int{r, idx}] = (min(cache[[2]int{r + 1, idx}], cache[[2]int{r + 1, idx + 1}]) + val)
		}
	}

	return cache[[2]int{0, 0}]
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func main() {
	triangle := [][]int{{2}, {3, 4}, {6, 5, 7}, {4, 1, 8, 3}}
	fmt.Println(minimumTotal(triangle))
}
