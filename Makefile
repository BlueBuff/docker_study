.PHONY: run

IMAGE_TAG = $(tag)

build:
	@mvn clean package -Dmaven.test.skip=true

docker: build
	@echo "docker build ... docker_demo:$(IMAGE_TAG)"
	@docker build -t docker_demo:$(IMAGE_TAG) .

run: docker
	@echo "docker run ... "
	@docker run --name=docker_demo -d -p 8080:8080 docker_demo:$(IMAGE_TAG)
	@echo "http://127.0.0.1:8080/helloWorld/test?msg=hello!"

delete:
	@echo "delete docker container ... "
	@docker rm docker_demo

query:
	@echo "query docker container ... "
	@docker ps -f name=docker_demo

start:
	@echo "start docker container ... "
	@docker start docker_demo
	@echo "http://127.0.0.1:8080/helloWorld/test?msg=hello!"

stop:
	@echo "stop docker container ... "
	@docker stop docker_demo

console:
	@echo "docker console log ... "
	@docker logs -f docker_demo