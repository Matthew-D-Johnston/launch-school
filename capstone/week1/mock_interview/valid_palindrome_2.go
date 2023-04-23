package main

import "fmt"

// func validPalindrome(s string) bool {
// 	start := 0
// 	end := len(s) - 1
// 	deletionRemaining := true

// 	for start <= end {
// 		if s[start] == s[end] {
// 			start++
// 			end--
// 		} else {
// 			if deletionRemaining {
// 				if s[start+1] == s[end] {
// 					start++
// 					deletionRemaining = false
// 				} else if s[end-1] == s[start] {
// 					end--
// 					deletionRemaining = false
// 				} else {
// 					return false
// 				}
// 			} else {
// 				return false
// 			}

// 			start++
// 			end--
// 		}
// 	}

// 	return true
// }

// func validPalindrome(s string) bool {
// 	start := 0
// 	end := len(s) - 1
// 	deletionRemaining := true

// 	for start <= end {
// 		if s[start] == s[end] {
// 			start++
// 			end--
// 		} else {
// 			if deletionRemaining {
// 				if checkPalindrome(s[start+1 : end+1]) {
// 					start++
// 					deletionRemaining = false
// 				} else if checkPalindrome(s[start:end]) {
// 					end--
// 					deletionRemaining = false
// 				} else {
// 					return false
// 				}
// 			} else {
// 				return false
// 			}

// 			start++
// 			end--
// 		}
// 	}

// 	return true
// }

func validPalindrome(s string) bool {
	start := 0
	end := len(s) - 1
	deletionRemaining := true

	for start <= end {
		if s[start] == s[end] {
			start++
			end--
		} else {
			if deletionRemaining {
				if checkPalindrome(s[start+1 : end+1]) {
					return checkPalindrome(s[start+1 : end+1])
				} else if checkPalindrome(s[start:end]) {
					return checkPalindrome(s[start:end])
				} else {
					return false
				}
			} else {
				return false
			}
		}
	}

	return true
}

func checkPalindrome(s string) bool {
	start := 0
	end := len(s) - 1

	for start < end {
		if s[start] == s[end] {
			start++
			end--
		} else {
			return false
		}
	}

	return true
}

func main() {
	fmt.Println(validPalindrome("aba") == true)
	fmt.Println(validPalindrome("abca") == true)
	fmt.Println(validPalindrome("abc") == false)
	fmt.Println(validPalindrome("abecba") == true)
	fmt.Println(validPalindrome("abecdcba") == true)
	fmt.Println(validPalindrome("abecfba") == false)
	fmt.Println(validPalindrome("abecbaf") == false)
	fmt.Println(validPalindrome("aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga") == true)
	// fmt.Println(checkPalindrome("cupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmvgsymdjgpfdhooxfuupuc"))
	// fmt.Println(checkPalindrome("abcdcba"[1:5]))
}
