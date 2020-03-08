# Create new laravel application. Do Not execute this command if you've already created it in this directory.
WORKDIR=src
ifdef v
  VERSION = =${v}
  WORKDIR=v${v}
endif
up:
	docker run --rm -v ${PWD}:/app 708u/composer:1.9.3 composer create-project --prefer-dist laravel/laravel${VERSION} ${WORKDIR}
	cp environments/docker-compose.yml ${WORKDIR} \
		&& cp -R environments/docker ${WORKDIR} \
		&& cp -R environments/.github ${WORKDIR} \
		&& cp environments/Makefile ${WORKDIR}
	@echo COMPOSE_PROJECT_NAME=laravel_app >> ${WORKDIR}/.env.example
	@echo DUSK_BASE_URL=http://nginx >> ${WORKDIR}/.env.example
	@echo CHROME_DRIVER_HOST=http://selenium:4444/wd/hub >> ${WORKDIR}/.env.example
	@echo '# For CI testing' >> ${WORKDIR}/.env.example
	@echo '# DUSK_BASE_URL=http://localhost:8000' >> ${WORKDIR}/.env.example
	@echo '# CHROME_DRIVER_HOST=http://localhost:9515' >> ${WORKDIR}/.env.example
	@echo new application succsessfully created in ${WORKDIR}.
