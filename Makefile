BIN := server
JOB ?= build

export GO111MODULE := on

.PHONY: download
download:
	@ go mod download

.PHONY: run
run:
	@ go run cmd/$(BIN)/main.go

.PHONY: build
build:
	@ go build -o bin/$(BIN) cmd/$(BIN)/main.go

.PHONY: setup
setup:
	@ go get -u github.com/kyoh86/richgo

.PHONY: vet
vet:
	@ go vet ./...

.PHONY: test
test: vet
	@ richgo test -v -cover -race ./...

.PHONY: coverage
coverage:
	@ richgo test -v -race -coverprofile=/tmp/profile -covermode=atomic ./...
	@ go tool cover -html=/tmp/profile

.PHONY: validate-codecov-config
validate-codecov-config:
	@ curl --data-binary @codecov.yml https://codecov.io/validate
