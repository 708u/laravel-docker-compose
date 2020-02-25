.PHONY: ps
ps:
	docker-compose ps

.PHONY: restart
restart:
	docker-compose restart

.PHONY: down
down:
	docker-compose down
