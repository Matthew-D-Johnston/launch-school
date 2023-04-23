package main

import "fmt"

func isPerfectSquare(num int) bool {
	left, right := 0, num

	for left <= right {
		midpoint := left + ((right - left) / 2)

		if midpoint*midpoint == num {
			return true
		} else if midpoint*midpoint > num {
			right = midpoint - 1
		} else {
			left = midpoint + 1
		}
	}

	return false
}

func main() {
	fmt.Println(isPerfectSquare(16))
	fmt.Println(isPerfectSquare(14))
}
