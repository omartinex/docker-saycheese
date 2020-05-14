WORKDIR=$(shell pwd)
IMAGE=saycheese
STORAGE=images

all:
	@echo "make build:  creates a docker image (${IMAGE})"
	@echo "make run:    starts saycheese"
	@echo "make shell:  opens a shell in the container"

build:
	docker build -t ${IMAGE} .

run:
	@mkdir -p ${STORAGE}
	@docker run -ti --rm --network=host -v ${WORKDIR}/${STORAGE}:/app/saycheese/images ${IMAGE}

shell:
	@mkdir -p ${STORAGE}
	@docker run -ti --rm -v ${WORKDIR}/${STORAGE}:/app/saycheese/images ${IMAGE} /bin/bash

clean:
	docker rmi ${IMAGE}
