/*
Nil slices

The zero value of a slice is nil.
A nil slice has a length and capacity of 0 and has no underlying array.
*/
package main

import "fmt"

func main() {
	var s []int
	fmt.Println(s, len(s), cap(s))
	if s == nil {
		fmt.Println("nil!")
	}
}
