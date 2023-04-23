package main

import "fmt"

func reverseString(str []string) []string {
	startPointer := 0
	endPointer := len(str) - 1

	for startPointer < endPointer {
		str[startPointer], str[endPointer] = str[endPointer], str[startPointer]
		startPointer++
		endPointer--
	}

	return str
}

func main() {
	fmt.Println(reverseString([]string{"h", "e", "l", "l", "o"}))
	fmt.Println(reverseString([]string{"H", "a", "n", "n", "a", "h"}))
	fmt.Println(reverseString([]string{"x"}))
	fmt.Println(reverseString([]string{"x", "o"}))
}
