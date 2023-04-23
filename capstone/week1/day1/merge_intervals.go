package main

import "fmt"

func merge(intervals [][]int) [][]int {
	if len(intervals) < 2 {
		return intervals
	}

	merged := make([][]int, 0)
	interval1 := intervals[0]
	interval2 := intervals[1]

	if interval1[1] >= interval2[0] {
		mergedInterval := []int{interval1[0], interval2[1]}
		merged = append(merged, mergedInterval)
	} else {
		merged = append(merged, interval1)
		merged = append(merged, interval2)
	}

	for idx := 2; idx < len(intervals); idx++ {
		interval1 = merged[len(merged)-1]
		interval2 = intervals[idx]

		if interval1[1] >= interval2[0] {
			mergedInterval := []int{interval1[0], interval2[1]}
			merged[len(merged)-1] = mergedInterval
		} else {
			merged = append(merged, interval2)
		}
	}

	return merged
}

func main() {
	intervals := [][]int{[]int{1, 3}, []int{2, 6}, []int{8, 10}, []int{15, 18}}
	fmt.Println(merge(intervals))
	intervals = [][]int{[]int{1, 4}, []int{4, 5}}
	fmt.Println(merge(intervals))
}
