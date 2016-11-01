BUILD_VERSION = 0.0.3
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: build

build:
	docker build -t matthodge/ansible:latest -t matthodge/ansible:$(BUILD_VERSION) .

clean:
	docker stop ansible
	docker rm ansible

run:
	docker run --rm -ti matthodge/ansible ansible --version
