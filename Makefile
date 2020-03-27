# Create new laravel application. Do Not execute this command if you've already created it in this directory.
WORKDIR=src
ifdef v
  VERSION = =${v}
  WORKDIR=v${v}
endif
up:
	docker run --rm -v ${PWD}:/app 708u/composer:1.9.3 composer create-project --prefer-dist laravel/laravel${VERSION} ${WORKDIR}
	cp environments/docker-compose.yml ${WORKDIR} \
		&& cp environments/public/.gitignore ${WORKDIR}/public \
		&& cp environments/config/dusk.php ${WORKDIR}/config \
		&& cp -R environments/docker ${WORKDIR} \
		&& cp -R environments/.github ${WORKDIR} \
		&& cp environments/Makefile ${WORKDIR}
	cat environments/.env.example >> ${WORKDIR}/.env.example
	@echo new application succsessfully created in ${WORKDIR}.
