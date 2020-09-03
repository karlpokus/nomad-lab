#!/bin/bash

# build for linux
GOOS=linux GOARCH=amd64 go build -o bin/linux/http-server
