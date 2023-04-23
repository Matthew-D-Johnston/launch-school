package main

func subsets(nums []int) [][]int {
	var results [][]int
	var candidate []int
	backtrack(nums, candidate, &results)
	return results
}

func backtrack(list []int, candidate []int, results *[][]int) {
	copyCandidate := make([]int, len(candidate))
	copy(copyCandidate, candidate)
	*results = append(*results, copyCandidate)

	for i := 0; i < len(list); i++ {
		candidate = append(candidate, list[i])    // take
		backtrack(list[i+1:], candidate, results) // explore
		candidate = candidate[:len(candidate)-1]  // clean up
	}
}
