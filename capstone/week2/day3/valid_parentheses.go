package main

import "fmt"

func isValid(s string) bool {
	hash := map[rune]rune{
		')': '(',
		'}': '{',
		']': '[',
	}

	stack := make([]rune, 0)

	for _, char := range s {
		if char == '(' || char == '{' || char == '[' {
			stack = append(stack, char)
		} else {
			if len(stack) == 0 {
				return false
			}

			lastElement := stack[len(stack)-1]
			if hash[char] == lastElement {
				stack = stack[0 : len(stack)-1]
			} else {
				return false
			}
		}
	}

	if len(stack) == 0 {
		return true
	}

	return false
}

func main() {
	fmt.Println(isValid("()") == true)
	fmt.Println(isValid("()[]{}") == true)
	fmt.Println(isValid("(]") == false)
	fmt.Println(isValid("([{}])") == true)
	fmt.Println(isValid("({[}])") == false)
}
