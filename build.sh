#!/bin/bash

# build for linux
GOOS=linux GOARCH=amd64 go build -o bin/linux/http-server
# zip it
zip bin/linux/http-server.zip bin/linux/http-server
