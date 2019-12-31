/*
If

Go's if statements are like its for loops; the expression need not be
surrounded by parentheses ( ) but the braces { } are required.
*/
package main

import (
	"fmt"
	"math"
)

func sqrt(x float64) string {
	if x < 0 {
		return sqrt(-x) + "i"
	}
	return fmt.Sprint(math.Sqrt(x))
}

func main() {
	fmt.Println(sqrt(2), sqrt(-4))
}
