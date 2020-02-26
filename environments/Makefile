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
	@make stop
	@make up

# docker-compose down
.PHONY: down
down:
	docker-compose down

# Remove container, network, volumes, images
.PHONY: destroy
destroy:
	docker-compose down --rmi all --volumes

# Install laravel project from dependencies and initialize environments.
.PHONY: install
install:
	cp .env.example .env
	docker-compose up -d --build
	@make composer-install
	@make yarn-intall
	docker-compose exec app php artisan key:generate
	@make migrate
	@make restart
	@echo Install ${APP_NAME} successfully finished!

# Reinstall laravel peoject.
.PHONY: reinstall
reinstall:
	@make down
	@make install

# Update dependencies.
.PHONY: update
update:
	@make composer-install
	@make yarn-install
	@make db-fresh
	@make restart

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

# Exec composer install
.PHONY: composer-install
composer-install:
	docker run --rm -it -v ${PWD}:/app 708u/composer:1.9.3 composer install

# Exec yarn install
.PHONY: yarn-install
yarn-install:
	docker-compose exec node yarn

# Exec migrate.
.PHONY: migrate
migrate:
	docker-compose exec app php artisan migrate --seed

# Exec fresh db with seeding.
.PHONY: db-fresh
db-fresh:
	docker-compose exec app php artisan migrate:fresh --seed

# Clear all cache.
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

# Run dusk tests
.PHONY: dusk
dusk:
	docker-compose exec app php artisan dusk
