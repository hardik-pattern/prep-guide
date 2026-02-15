package main

import "fmt"

func main() {
	fmt.Println("Welcome to understand the struct in go lang")
	user := User{"Hardik", 12, "hardik.jade@gmail.com", true}

	fmt.Println("The user struct is here", user)
	fmt.Printf("The user has name %v and age is %v\n", user.Name, user.Age)
}

type User struct {
	Name     string
	Age      int
	Email    string
	verified bool
}
