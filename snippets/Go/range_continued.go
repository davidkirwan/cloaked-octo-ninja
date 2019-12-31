/*
Range continued

You can skip the index or value by assigning to _.
If you only want the index, drop the , value entirely.
*/
package main

import "fmt"

func main() {
	pow := make([]int, 10)
	fmt.Println(pow)
	for i := range pow {
	  pow[i] = 1 << uint(i) // == 2**i
	}
	for _, value := range pow {
		fmt.Printf("%d\n", value)
	}
}
