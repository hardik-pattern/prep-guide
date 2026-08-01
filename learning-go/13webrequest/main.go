package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
)

type Post struct {
	UserID int    `json:"userId"`
	ID     int    `json:"id"`
	Title  string `json:"title"`
	Body   string `json:"body"`
}

func main() {
	fmt.Println("Learning handling of the web request")

	response, err := http.Get("https://jsonplaceholder.typicode.com/posts")

	if err != nil {
		panic(err)
	}

	defer response.Body.Close()

	body, err := io.ReadAll(response.Body)

	if err != nil {
		panic(err)
	}

	var posts []Post
	if err := json.Unmarshal(body, &posts); err != nil {
		panic(err)
	}

	for _, p := range posts {
		fmt.Printf("ID: %d | UserID: %d | Title: %s\n", p.ID, p.UserID, p.Title)
	}

	urlParse, _ := url.Parse("https://localhose:3000/posts?postId=1&userId=2")
	fmt.Println("URL scheme is ", urlParse.Scheme)
	fmt.Println("params are ", urlParse.RawQuery)
	fmt.Println(urlParse.Query())
}
