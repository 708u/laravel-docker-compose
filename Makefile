# docker-compose up -d
.PHONY: up
up:
	docker-compose up -d

# docker-compose ps
.PHONY: ps
ps:
	docker-compose ps

# docker-compose stop
.PHONY: stop
stop:
	docker-compose stop

# docker-compose restart
.PHONY: restart
restart:
	docker-compose restart

# docker-compose down
.PHONY: down
down:
	docker-compose down

# Remove container, network, volumes, images
.PHONY: destroy
destroy:
	docker-compose down --rmi all --volumes

# Create new laravel application. Do Not execute this command if you've already created it in this directory.
.PHONY: create-laravel-app
create-laravel-app:
	docker run --rm -v ${PWD}:/app 708u/composer:1.9.3 composer create-project --prefer-dist laravel/laravel src
	cp docker-compose.yml src/ && cp -R docker src/ && cp Makefile src/

# Install laravel project from dependencies and initialize environments.
.PHONY: install
install:
	docker-compose up -d app node
	cp .env.example .env
	docker run --rm -v ${PWD}:/app 708u/composer:1.9.3 composer install
	docker-compose exec node yarn install --force
	docker-compose exec app php artisan key:generate
	docker-compose up -d mysql
	@make db-fresh
	@make up

# Reinstall laravel peoject.
.PHONY: reinstall
reinstall:
	@make down
	@make install

# Attach an app container.
.PHONY: app
app:
	docker-compose exec app bash

# Attach a node container.
.PHONY: node
node:
	docker-compose exec node sh

# Attach a composer container.
.PHONY: composer
composer:
	docker run --rm -it -v ${PWD}:/app 708u/composer:1.9.3 bash

# Exec fresh db with seeding.
.PHONY: db-fresh
db-fresh:
	docker-compose exec app php artisan migrate:fresh --seed

# Crear all cache.
.PHONY: opt-clear
opt-clear:
	docker-compose exec app php artisan optimize:clear

# Open tinker interface.
.PHONY: tinker
tinker:
	docker-compose exec app php artisan tinker

# Run tests.
.PHONY: test
test:
	docker-compose exec app vendor/bin/phpunit
