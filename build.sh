#!/bin/bash

# build for linux
# will overwrite previous build

echo start build

echo building server
GOOS=linux GOARCH=amd64 go build -o bin/linux/http-server ./src/server/*.go
zip bin/linux/http-server.zip bin/linux/http-server

echo building api
GOOS=linux GOARCH=amd64 go build -o bin/linux/http-api ./src/api/*.go
zip bin/linux/http-api.zip bin/linux/http-api

echo done
