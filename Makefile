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
