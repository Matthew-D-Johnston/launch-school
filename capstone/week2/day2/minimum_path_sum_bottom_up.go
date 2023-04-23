package main

import "fmt"

func minPathSum(grid [][]int) int {
	rows := len(grid)
	columns := len(grid[0])
	cache := make(map[[2]int]int)

	cache[[2]int{0, 0}] = grid[0][0]

	for r := 0; r < rows; r++ {
		for c := 0; c < columns; c++ {
			if r == 0 && c == 0 {
				continue
			}

			currVal := grid[r][c]

			if r == 0 {
				cache[[2]int{r, c}] += (cache[[2]int{r, c - 1}] + currVal)
			} else if c == 0 {
				cache[[2]int{r, c}] += (cache[[2]int{r - 1, c}] + currVal)
			} else {
				cache[[2]int{r, c}] += (min(cache[[2]int{r, c - 1}], cache[[2]int{r - 1, c}]) + currVal)
			}

		}
	}

	return cache[[2]int{rows - 1, columns - 1}]
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func main() {
	grid := [][]int{{1, 3, 1}, {1, 5, 1}, {4, 2, 1}}
	fmt.Println(minPathSum(grid))
	grid = [][]int{{1, 2, 3}, {4, 5, 6}}
	fmt.Println(minPathSum(grid))
}
