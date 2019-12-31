/*
Slice literals

A slice literal is like an array literal without the length.

This is an array literal:
[3]bool{true, true, false}

And this creates the same array as above, then builds a slice that references it:
[]bool{true, true, false}
*/
package main

import "fmt"

func main() {
	q := []int{2, 3, 5, 7, 11, 13}
	fmt.Println(q)

	r := []bool{true, false, true, true, false, true}
	fmt.Println(r)

	s := []struct {
		i int
		b bool
	}{
		{2, true},
		{3, false},
		{5, true},
		{7, true},
		{11, false},
		{13, true},
	}
	fmt.Println(s)
}
