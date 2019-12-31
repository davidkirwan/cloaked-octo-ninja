package main

// WIP

import "fmt"

// fibonacci is a function that returns
// a function that returns an int.
func fibonacci() func(int) int {
  val := 0
  return func(x int) int {
    val += x
    return val
  }
}

func main() {
  f := fibonacci()
  for i := 0; i < 10; i++ {
    fmt.Println(f(i))
  }
}

