package main

import (
	"net/http"
	"log"
	"os"
)

/*
	USAGE
	$ NOMAD_ADDR_http=<ip>:<port> go run main.go
*/

func main() {
	addr := os.Getenv("NOMAD_ADDR_http")
	if addr == "" {
		log.Fatal("ERR: unable to fetch addr from NOMAD_ADDR_http")
	}
	http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("hello man!"))
	})
	log.Println("server starting")
	log.Fatal(http.ListenAndServe(addr, nil))
}
