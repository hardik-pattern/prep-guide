package main

import (
	"fmt"
	"time"
)

// Year	2006 ; 06
// Month	Jan ; January ; 01 ; 1
// Day	02 ; 2 ; _2 (For preceding 0)
// Weekday	Mon ; Monday
// Hour	15 ( 24 hour time format ) ; 3 ; 03 (AM or PM)
// Minute	04 ; 4
// Second	05 ; 5
// AM/PM Mark	PM
// Day of Year	002 ; __2

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
