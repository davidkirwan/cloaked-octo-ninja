/*
Defer

A defer statement defers the execution of a function until the surrounding function
returns. The deferred call's arguments are evaluated immediately, but the function
call is not executed until the surrounding function returns.
*/

package main

import "fmt"

func main() {
	defer fmt.Println("1")
	fmt.Println("2")
	defer fmt.Println("3")
	fmt.Println("4")
	defer fmt.Println("5")
	fmt.Println("6")
	defer fmt.Println("7")
	fmt.Println("8")
	defer fmt.Println("9")
	fmt.Println("10")
	defer fmt.Println("11")
	fmt.Println("12")
	defer fmt.Println("13")
	fmt.Println("14")
}
