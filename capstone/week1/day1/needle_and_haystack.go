package main

import "fmt"

func NeedleInTheHaystack(haystack string, needle string) int {
	needleIndex := 0
	haystackIndex := 0

	for _, char := range haystack {
		if string(char) == string(needle[needleIndex]) {
			if needleIndex+1 == len(needle) {
				return haystackIndex - (len(needle) - 1)
			} else {
				needleIndex++
			}
		} else {
			haystackIndex -= needleIndex
			needleIndex = 0
		}
		fmt.Println(haystackIndex)
		haystackIndex++
	}

	return -1
}

func main() {
	fmt.Println(NeedleInTheHaystack("sadbutsad", "sad"))
	fmt.Println(NeedleInTheHaystack("leetcode", "leeto"))
	fmt.Println(NeedleInTheHaystack("sadbutsad", "but"))
	fmt.Println(NeedleInTheHaystack("mississippi", "issip"))
}
