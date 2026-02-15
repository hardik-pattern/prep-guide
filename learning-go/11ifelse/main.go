package main

import "fmt"

func main() {
	fmt.Println("Welcome to if-else in golang")

	number := 10
	if number > 10 {
		fmt.Println("Number is greater than 10")
	} else if number < 10 {
		fmt.Println("Number is less than 10")
	} else {
		fmt.Println("Number is equal to 10")
	}
}
