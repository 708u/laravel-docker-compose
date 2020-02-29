# Create new laravel application. Do Not execute this command if you've already created it in this directory.
up:
	docker run --rm -v ${PWD}:/app 708u/composer:1.9.3 composer create-project --prefer-dist laravel/laravel src
	cp environments/docker-compose.yml src/ && cp -R environments/docker src/ && cp environments/Makefile src/
	@echo COMPOSE_PROJECT_NAME=laravel_app >> src/.env.example
	@echo DUSK_HOST=http://nginx >> src/.env.example
	@echo new application succsessfully created in src/.
