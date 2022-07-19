PATH_THIS:=$(realpath $(dir $(lastword ${MAKEFILE_LIST})))
DIR:=$(PATH_THIS)
BIN_DIR:=$(DIR)/bin
DOC_DIR:=$(DIR)/docs

include .env
VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' .env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))

help:
	@echo "    You can apply a specific environment with .env file"
	@echo ""
	@echo "    build"
	@echo "        Build all files in cmd directory"
	@echo "    run"
	@echo "        Run cmd/<CMD>/main.go"
	@echo "        For example: make run CMD=server"
	@echo "    verify"
	@echo "        Check go library dependencies"
	@echo "    test"
	@echo "        Run tests"
	@echo "    clean"
	@echo "        Remove all build outputs"


.PHONY: test
test:
	go test ./...

verify:
	hack/verify.sh

run:
	go run cmd/$(CMD)/main.go

build: verify
	@echo "Building..."
	@cd $(DIR)
	@BIN_DIR=$(BIN_DIR) hack/build.sh
	@echo "Completed"

all: build

clean:
	@echo "Cleaning..."
	rm -rf $(BIN_DIR)
	rm -rf $(DOC_DIR)
	@echo "Completed"
