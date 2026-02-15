package main

import "fmt"

func main() {
	var array [4]string
	array[0] = "Apple"
	array[1] = "Banana"
	array[2] = "Peach"
	array[3] = "Pineapple"
	fmt.Println("Fruit Array is, ", array)
	fmt.Println("len of Fruit Array is, ", len(array))

	var vegArray = [4]string{"Beans", "okra", "potato"}
	fmt.Println("The veg array is, ", vegArray)
}
