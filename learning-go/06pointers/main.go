package main

import "fmt"

func main() {
	someNumber := 10
	var pointer *int
	fmt.Println("The value of pointer is ", pointer)

	pointer = &someNumber
	fmt.Println("The value of pointer is ", *pointer)

	*pointer = *pointer * 10
	fmt.Println("The value of pointer is ", *pointer)
}
