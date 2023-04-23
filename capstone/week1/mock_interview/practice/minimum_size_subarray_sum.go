package main

func minSubArrayLen(target int, nums []int) int {
	a, r := 0, 0
	max := len(nums) + 1
	currentSum := 0
	for r < len(nums) {
		currentSum += nums[r]
		for currentSum >= target {
			curLen := r - a + 1
			if curLen == 1 {
				return 1
			}
			if curLen < max {
				max = curLen
			}
			currentSum -= nums[a]
			a++
		}
		r++
	}
	if max == len(nums)+1 {
		return 0
	}
	return max
}
