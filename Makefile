# docker-compose up -d
.PHONY: up
ps:
	docker-compose up -d

# docker-compose ps
.PHONY: ps
ps:
	docker-compose ps

# docker-compose restart
.PHONY: restart
restart:
	docker-compose restart

# docker-compose down
.PHONY: down
down:
	docker-compose down

# Create new laravel application. Do Not execute this command if you've already created it this directory.
.PHONY: create-laravel-app
laravel-app:
	docker run --rm -v ${PWD}:/app 708u/composer:1.9.3 composer create-project --prefer-dist laravel/laravel src
	cp docker-compose.yml src/ && cp -R docker src/ && cp Makefile src/
