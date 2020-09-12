package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"time"
)

/*
	USAGE
	$ NOMAD_ADDR_http=localhost:8989 API_HOST=http://localhost:8990 go run src/server/*.go
*/

var client = &http.Client{
	Timeout: 3 * time.Second, // tcp ttl
}

func main() {
	addr := os.Getenv("NOMAD_ADDR_http")
	host := os.Getenv("API_HOST")
	if addr == "" || host == "" {
		log.Fatal("Error reading env vars")
	}
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(200)
	})
	http.HandleFunc("/api", func(w http.ResponseWriter, r *http.Request) {
		res, err := client.Get(fmt.Sprintf("%s/api", host))
		if err != nil {
			http.Error(w, fmt.Sprintf("Error calling api", err.Error()), 500)
			return
		}
		defer res.Body.Close()
		_, err = io.Copy(w, res.Body)
		if err != nil {
			http.Error(w, fmt.Sprintf("Error copying bytes", err.Error()), 500)
			return
		}
	})
	log.Printf("About to listen on %s\n", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
