TAG=messa/duplicity

default:
	@echo "Run 'make build' to build Docker image"

build:
	docker build --tag $(TAG) .
	make check

build-nc:
	docker build --no-cache --pull --tag $(TAG) .
	make check

check:
	docker run --rm $(TAG) duplicity -V

push: check
	docker push $(TAG)
