package main

// Version 1

// func minPathSum(grid [][]int) int {
// 	rows := len(grid)
// 	columns := len(grid[0])

// 	cache := make(map[[2]int]int)

// 	return helper(grid, rows, columns, cache)

// 	// if rows == 1 {
// 	// 	return sumRow(grid)
// 	// }

// 	// if columns == 1 {
// 	// 	return sumColumn(grid)
// 	// }

// 	// sum1 := grid[0][0] + minPathSum(shrinkGridBy(grid, "row"))
// 	// sum2 := grid[0][0] + minPathSum(shrinkGridBy(grid, "column"))

// 	// return min(sum1, sum2)
// }

// func helper(grid [][]int, rows int, columns int, cache map[[2]int]int) int {
// 	if rows == 1 {
// 		return sumRow(grid)
// 	}

// 	if columns == 1 {
// 		return sumColumn(grid)
// 	}

// 	sum, ok := cache[[2]int{rows, columns}]

// 	if ok {
// 		return sum
// 	}

// 	sum1 := grid[0][0] + helper(shrinkGridBy(grid, "row"), rows-1, columns, cache)
// 	sum2 := grid[0][0] + helper(shrinkGridBy(grid, "column"), rows, columns-1, cache)

// 	cache[[2]int{rows, columns}] = min(sum1, sum2)

// 	return cache[[2]int{rows, columns}]
// }

// func shrinkGridBy(grid [][]int, dimension string) [][]int {
// 	if dimension == "row" {
// 		return grid[1:]
// 	} else {
// 		newGrid := make([][]int, 0)

// 		for _, row := range grid {
// 			newGrid = append(newGrid, row[1:])
// 		}

// 		return newGrid
// 	}
// }

// func min(val1, val2 int) int {
// 	if val1 < val2 {
// 		return val1
// 	}
// 	return val2
// }

// func sumRow(grid [][]int) int {
// 	sum := 0

// 	for _, num := range grid[0] {
// 		sum += num
// 	}

// 	return sum
// }

// func sumColumn(grid [][]int) int {
// 	sum := 0

// 	for _, row := range grid {
// 		sum += row[0]
// 	}

// 	return sum
// }

// func main() {
// 	grid := [][]int{{1, 3, 1}, {1, 5, 1}, {4, 2, 1}}
// 	fmt.Println(minPathSum(grid))

// 	grid = [][]int{{1, 2, 3}, {4, 5, 6}}
// 	fmt.Println(minPathSum(grid))
// }

// Version 2

func min(a, b int) int {
	if a < b {
		return a
	} else {
		return b
	}
}

func helper(grid [][]int, r, c int) int {
	//last cell (bottom right)
	if r == len(grid)-1 && c == len(grid[0])-1 {
		return grid[r][c]
	}

	//(last row, non last column)
	if r == len(grid)-1 && c < len(grid[0])-1 {
		//you can't move further down the row
		return grid[r][c] + helper(grid, r, c+1)
		//(non last row, last column)
	} else if r < len(grid)-1 && c == len(grid[0])-1 {
		//you can't move further to the right
		return grid[r][c] + helper(grid, r+1, c)
	}

	return grid[r][c] + min(helper(grid, r+1, c), helper(grid, r, c+1))
}

func minPathSum(grid [][]int) int {
	r, c := 0, 0

	return helper(grid, r, c)
}

// Version 3

// func min(a, b int) int {
//   if a < b {
//     return a
//   } else {
//     return b
//   }
// }

// func helper(grid [][]int, r, c int, cache map[[2]int]int) int {
// 	//last cell (bottom right)
//   if r == len(grid)-1 && c == len(grid[0])-1 {
//     return grid[r][c]
//   }

// 	sum1, ok1 := cache[[2]int{r, c+1}]
// 	sum2, ok2 := cache[[2]int{r+1, c}]

// 	//(last row, non last column)
//   if r == len(grid)-1 && c < len(grid[0])-1 {
// 		//you can't move further down the row
//     // return grid[r][c] + helper(grid, r, c+1)
// 		if ok1 {
// 			return grid[r][c] + sum1
// 		}

// 		cache[[2]int{r, c+1}] = helper(grid, r, c+1, cache)

// 		return grid[r][c] + cache[[2]int{r, c+1}]
// 	//(non last row, last column)
//   } else if r < len(grid)-1 && c == len(grid[0])-1 {
// 		//you can't move further to the right
//     // return grid[r][c] + helper(grid, r+1, c)

// 		if ok2 {
//       return grid[r][c] + sum2
//     }

//     cache[[2]int{r+1, c}] = helper(grid, r+1, c, cache)

//     return grid[r][c] + cache[[2]int{r+1, c}]
//   }

// 	var minSum1 int
// 	var minSum2 int

// 	if ok1 {
// 		minSum1 = sum1
// 	} else {
// 		minSum1 = helper(grid, r, c+1, cache)
// 		cache[[2]int{r, c+1}] = minSum1
// 	}

// 	if ok2 {
//     minSum2 = sum2
//   } else {
//     minSum2 = helper(grid, r+1, c, cache)
// 		cache[[2]int{r+1, c}] = minSum2
//   }

//   return grid[r][c] + min(minSum1, minSum2)
// }

// func minPathSum(grid [][]int) int {
//   r, c := 0, 0
// 	cache := make(map[[2]int]int)

//   return helper(grid, r, c, cache)
// }
