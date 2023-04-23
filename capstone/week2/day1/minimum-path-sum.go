/*
https://leetcode.com/problems/minimum-path-sum/

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example 1:
Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
Output: 7
Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

Example 2:
Input: grid = [[1,2,3],[4,5,6]]
Output: 12
*/

package main

import "fmt"

func min(a, b int) int {
	if a < b {
		return a
	} else {
		return b
	}
}

// non-cached
// func helper(grid [][]int, r, c int) int {
// 	currentVal, lastRow, lastCol := grid[r][c], len(grid)-1, len(grid[0])-1

// 	if r == lastRow && c == lastCol {
// 		return currentVal
// 	}

// 	if r == lastRow && c < lastCol {
// 		return currentVal + helper(grid, r, c+1)
// 	} else if r < lastRow && c == lastCol {
// 		return currentVal + helper(grid, r+1, c)
// 	}

// 	return currentVal + min(helper(grid, r+1, c), helper(grid, r, c+1))
// }

// func minPathSum(grid [][]int) int {
// 	r, c := 0, 0

// 	return helper(grid, r, c)
// }

// cached
func helper(grid [][]int, r, c int, cache map[[2]int]int) int {
	currentVal, lastRow, lastCol := grid[r][c], len(grid)-1, len(grid[0])-1

	if r == lastRow && c == lastCol {
		return currentVal
	}

	if r == lastRow && c < lastCol {
		if next, ok := cache[[2]int{r, c + 1}]; ok {
			return currentVal + next
		} else {
			next = helper(grid, r, c+1, cache)
			cache[[2]int{r, c + 1}] = next
			return currentVal + next
		}
	} else if r < lastRow && c == lastCol {
		if next, ok := cache[[2]int{r + 1, c}]; ok {
			return currentVal + next
		} else {
			next = helper(grid, r+1, c, cache)
			cache[[2]int{r + 1, c}] = next
			return currentVal + next
		}
	}

	var next1, next2 int

	if val, ok := cache[[2]int{r, c + 1}]; ok {
		next1 = val
	} else {
		next1 = helper(grid, r, c+1, cache)
		cache[[2]int{r, c + 1}] = next1
	}

	if val, ok := cache[[2]int{r + 1, c}]; ok {
		next2 = val
	} else {
		next2 = helper(grid, r+1, c, cache)
		cache[[2]int{r + 1, c}] = next2
	}

	return currentVal + min(next1, next2)
}

func minPathSum(grid [][]int) int {
	r, c := 0, 0
	cache := make(map[[2]int]int)

	return helper(grid, r, c, cache)
}

func main() {
	fmt.Println(minPathSum([][]int{{1, 3, 1}, {1, 5, 1}, {4, 2, 1}}) == 7)
	fmt.Println(minPathSum([][]int{{1, 2, 3}, {4, 5, 6}}) == 12)
	fmt.Println(minPathSum([][]int{{1, 4, 8, 6, 2, 2, 1, 7}, {4, 7, 3, 1, 4, 5, 5, 1}, {8, 8, 2, 1, 1, 8, 0, 1}, {8, 9, 2, 9, 8, 0, 8, 9}, {5, 7, 5, 7, 1, 8, 5, 5}, {7, 0, 9, 4, 5, 6, 5, 6}, {4, 9, 9, 7, 9, 1, 9, 0}}) == 47)
}
