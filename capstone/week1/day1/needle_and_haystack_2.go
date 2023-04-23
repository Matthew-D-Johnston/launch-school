package main

import "fmt"

func NeedleInTheHaystack2(haystack string, needle string) int {

	for haystackIndex := 0; haystackIndex <= len(haystack)-len(needle); haystackIndex++ {
		startIndex := haystackIndex
		endIndex := haystackIndex + len(needle)
		slice := haystack[startIndex:endIndex]

		if slice == needle {
			return haystackIndex
		}
	}

	return -1
}

func main() {
	fmt.Println(NeedleInTheHaystack2("sydbutsad", "sad"))
	fmt.Println(NeedleInTheHaystack2("leetcode", "leeto"))
	fmt.Println(NeedleInTheHaystack2("sadbutsad", "but"))
	fmt.Println(NeedleInTheHaystack2("mississippi", "issip"))
	fmt.Println(NeedleInTheHaystack2("aaa", "aaaaa"))
}
