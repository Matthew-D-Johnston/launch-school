package main

import (
	"fmt"
	"strings"
)

func simplifyPath(path string) string {
	stack := make([]string, 0)

	pathArr := strings.Split(path, "/")

	for _, elem := range pathArr {
		switch {
		case elem == "" || elem == ".":
			continue
		case elem == "..":
			if len(stack) > 0 {
				stack = stack[0 : len(stack)-1]
			}
		default:
			stack = append(stack, elem)
		}
	}

	return "/" + strings.Join(stack, "/")
}

func main() {
	fmt.Println(simplifyPath("/home//foo/"))
	fmt.Println(simplifyPath("/home/../foo/"))
	fmt.Println(simplifyPath("/../"))
}
