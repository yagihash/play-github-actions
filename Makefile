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

.PHONY: vet
vet:
	@ go vet ./...

.PHONY: test
test: vet
	@ go test -v -cover -race ./...

.PHONY: coverage
coverage:
	@ go test -v -race -coverprofile=/tmp/profile -covermode=atomic ./...
	@ go tool cover -html=/tmp/profile

.PHONY: validate-codecov-config
validate-codecov-config:
	@ curl --data-binary @codecov.yml https://codecov.io/validate
