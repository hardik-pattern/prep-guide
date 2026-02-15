package main

import "fmt"

const LOGIN_TOKEN = "SOME_LOGIN_TOKEN"

func main() {
	var username string = "Hardik"
	fmt.Println(username)
	fmt.Printf("I am variable of type %T", username)

	var isLoggedIn bool = true
	fmt.Println(isLoggedIn)

	var integer int = 200
	fmt.Print(integer)

	var smallFloat float32 = 2.2222
	fmt.Println(smallFloat)

	// implicit type

	var implicit = "learnsomething"
	fmt.Println(implicit)

	// no var type
	no_var := "Something"
	fmt.Println(no_var)

	fmt.Println(LOGIN_TOKEN)
}
