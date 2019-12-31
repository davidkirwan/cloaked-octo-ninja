// https://yourbasic.org/golang/public-private/
// Public vs Private
// A package is the smallest unit of private encap­sulation in Go.
//
// All identifiers defined within a package are visible throughout that package.
// When importing a package you can access only its exported identifiers.
// An identifier is exported if it begins with a capital letter.
package main

import "stuff/public_vs_private/timer"

func main() {
    clock := new(timer.StopWatch)
    clock.Start()
    if clock.running { // ILLEGAL
        // …
    }
}
