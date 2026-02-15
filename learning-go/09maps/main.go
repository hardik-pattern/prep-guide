package main

import "fmt"

func main() {
	var maps = make(map[string]string)
	maps["JS"] = "javascript"
	maps["PY"] = "Python"
	maps["RB"] = "Ruby"
	maps["GO"] = "Go"

	fmt.Println("maps", maps)
	delete(maps, "PY")
	fmt.Println("maps", maps)

	for k, v := range maps {
		fmt.Printf("The Key is %v and value is %v\n", k, v)
	}
}
