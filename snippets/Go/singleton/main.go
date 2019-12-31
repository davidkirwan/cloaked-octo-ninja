package main

import (
        "stuff/singleton/statemanager"
	"fmt"
      )

func main() {
  singleton := statemanager.GetStateManager()
  singleton.SetState("x", "david")
  state := singleton.GetState("x")
  fmt.Printf("x = %v\n", state)
}
