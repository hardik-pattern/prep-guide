package main

import (
	"fmt"
	"math/rand"
)

func main() {
	fmt.Println("Welcome to dice game to understand the switch case in go lang")

	number := rand.Intn(6) + 1

	fmt.Println("Your dice number is ", number)

	switch number {
	case 1:
		fmt.Println("You get 1")
	case 2:
		fmt.Println("You get 2")
	case 3:
		fmt.Println("You get 3")
	case 4:
		fmt.Println("You get 4")
		fallthrough
	case 5:
		fmt.Println("You get 5")
	case 6:
		fmt.Println("You get 6")
	default:
		fmt.Println("Invalid case")
	}
}
