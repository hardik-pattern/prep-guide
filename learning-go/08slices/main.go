package main

import (
	"fmt"
	"sort"
)

func main() {
	var fruitList = []string{}
	fruitList = append(fruitList, "Mango")
	fruitList = append(fruitList, "Banana")
	fruitList = append(fruitList, "Papaya")

	fmt.Println("The list of fruits are here", fruitList)

	fruitList = append(fruitList[2:])
	fmt.Println(fruitList)

	highScore := make([]int, 4)
	highScore[0] = 1
	highScore[1] = 2
	highScore[2] = 3
	highScore[3] = 4

	fmt.Println("The highScore is ", highScore)

	highScore = append(highScore, 1, 2, 3)
	fmt.Println(highScore)

	fmt.Println(sort.IntsAreSorted(highScore))
	sort.Ints(highScore)
	fmt.Println("HighScore", highScore)
	fmt.Println(sort.IntsAreSorted(highScore))

	// How to remove value from slices?
	courses := []string{"reactjs", "python", "javascript", "ruby", "go"}
	fmt.Println(courses)
	var indexToRemove = 2

	courses = append(courses[:indexToRemove], courses[indexToRemove+1:]...)
	fmt.Println(courses)
}
