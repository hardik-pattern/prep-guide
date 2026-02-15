package main

import (
	"fmt"
	"time"
)

func main() {
	greet := "Welcome to learn date and time in go"
	fmt.Println(greet)

	timeNow := time.Now()

	fmt.Println(timeNow)

	// remember this format for date & time
	fmt.Println(timeNow.Format("02-01-2006 15:04:05 Monday"))

	createdDate := time.Date(2000, time.August, 28, 02, 10, 9, 0, time.UTC)
	fmt.Println(createdDate.Format("02-01-2006 15:04:05 Monday"))
}
