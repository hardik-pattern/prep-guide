package main

import (
	"fmt"
)

func main() {
	// fmt.Println("Hello from hardik")
	// name := "Hardik"
	// age := 010

	// fmt.Println(fmt.Sprintf("Welcome to my party, %s %d", name, age))

	log := "❗ recommended search product 🔍"

	for _, char := range log {
		fmt.Println(fmt.Sprintf("%U", char))
	}
}
