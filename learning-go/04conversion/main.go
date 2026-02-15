package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	greet := "Welcome to our hotel"
	fmt.Println(greet)

	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')

	fmt.Println("Thanks of rating our pizza, ", input)

	numRating, err := strconv.ParseFloat(strings.TrimSpace(input), 64)

	if err != nil {
		fmt.Println("Something went wrong, ", err)
	} else {
		fmt.Println("Added 1 to the raitng ", numRating+1)
	}

}
