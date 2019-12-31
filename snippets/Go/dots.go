/*
https://yourbasic.org/golang/three-dots-ellipsis/
Arguments to variadic functions
Array literals
The go command
*/

package main

import "fmt"

/*
Variadic function parameters
If the last parameter of a function has type ...T, it can be called with any number of trailing arguments of type T. The actual type of ...T inside the function is []T.
This example function can be called with, for instance, Sum(1, 2, 3) or Sum().
*/
func Sum(nums ...int) int {
    res := 0
    for _, n := range nums {
        res += n
    }
    return res
}

func main() {
  fmt.Println(Sum(1, 2, 3))

  /*
    You can pass a slice s directly to a variadic function if you unpack it with the s... notation. In this case no new slice is created.
    In this example, we pass a slice to the Sum function. 
  */
  primes := []int{2, 3, 5, 7}
  fmt.Println(Sum(primes...))

  /*
    Array literals
    In an array literal, the ... notation specifies a length equal to the number of elements in the literal.
  */
  stooges := [...]string{"Moe", "Larry", "Curly"}
  fmt.Println(len(stooges) == 3)

  /*
    The go command
    Three dots are used by the go command as a wildcard when describing package lists.
    This command tests all packages in the current directory and its subdirectories. eg:
    $ go test ./...
  */

}



