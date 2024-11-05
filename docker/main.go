package main

import (
	"html/template"
	"log"
	"net/http"
)

type PageVariables struct {
	Title string
	Body  string
}

func handler(w http.ResponseWriter, r *http.Request) {
	pageVariables := PageVariables{
		Title: "Welcome to Go Web Development",
		Body:  "This is a simple Go web application that uses HTML templates.",
	}

	tmpl, err := template.New("index").Parse(`
	<!DOCTYPE html>
	<html>
	<head>
		<title>{{.Title}}</title>
	</head>
	<body>
		<h1>{{.Title}}</h1>
		<p>{{.Body}}</p>
	</body>
	</html>
	`)
	if err != nil {
		log.Fatal(err)
	}

	err = tmpl.Execute(w, pageVariables)
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	http.HandleFunc("/", handler)

	log.Println("Starting web server on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
