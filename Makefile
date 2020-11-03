# Create new laravel application. Do Not execute this command if you've already created it in this directory.
WORKDIR=src
ifdef v
  VERSION = =${v}
  WORKDIR=v${v}
endif
up:
	docker run --rm -v ${PWD}:/app composer:latest composer create-project --prefer-dist laravel/laravel${VERSION} ${WORKDIR}
	cp -f environments/docker-compose.yml ${WORKDIR} \
		&& cp -f environments/public/.gitignore ${WORKDIR}/public \
		&& cp -f environments/config/dusk.php ${WORKDIR}/config \
		&& cp -f environments/Makefile ${WORKDIR} \
		&& cp -fR environments/docker ${WORKDIR} \
		&& cp -fR environments/.github ${WORKDIR}
	cat environments/.env.example >> ${WORKDIR}/.env.example
	sed \
		-e 's/DB_HOST=127.0.0.1/DB_HOST=mysql/g' \
		-e 's/DB_PASSWORD=/DB_PASSWORD=root/' \
		-e 's/CACHE_DRIVER=file/CACHE_DRIVER=redis/g' \
		-e 's/QUEUE_CONNECTION=sync/QUEUE_CONNECTION=redis/g' \
		-e 's/SESSION_DRIVER=file/SESSION_DRIVER=redis/g' \
		-e 's/REDIS_HOST=127.0.0.1/REDIS_HOST=redis/g' \
		${WORKDIR}/.env.example > tmp.env.example
	cp -f tmp.env.example ${WORKDIR}/.env.example
	rm tmp.env.example
	@echo new application succsessfully created in ${WORKDIR} !
