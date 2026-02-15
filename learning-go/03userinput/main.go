package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	greet := "Welcome to our hotel"
	fmt.Println(greet)

	fmt.Println("Please provide rating for our pizza")
	reader := bufio.NewReader(os.Stdin)

	input, _ := reader.ReadString('\n')
	fmt.Println("Thank You for rating ", input, "To our pizza")
}
