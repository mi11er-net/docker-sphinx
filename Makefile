.PHONY: build tag push

build:
	docker build -t sphinx:test .

tag: build
	docker tag sphinx:test mi11er/sphinx:latest
	docker tag sphinx:test mi11er/sphinx:1.0.0

push: tag
	docker push mi11er/sphinx:latest
	docker push mi11er/sphinx:1.0.0
