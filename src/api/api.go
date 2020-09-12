package main

import (
	"log"
	"net/http"
	"os"
)

/*
	USAGE
	$ NOMAD_ADDR_http=localhost:8990 go run src/api/*.go
*/

func main() {
	addr := os.Getenv("NOMAD_ADDR_http")
	if addr == "" {
		log.Fatal("ERR: unable to fetch addr from NOMAD_ADDR_http")
	}
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(200)
	})
	http.HandleFunc("/api", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("hello from api!"))
	})
	log.Printf("About to listen on %s\n", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
