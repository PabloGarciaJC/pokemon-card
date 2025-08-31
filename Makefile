## ---------------------------------------------------------
## Comando base para docker-compose
## ---------------------------------------------------------

DOCKER_COMPOSE = docker compose -f ./.docker/docker-compose.yml

## ---------------------------------------------------------
## Inicialización de la Aplicación
## ---------------------------------------------------------

.PHONY: init-app
init-app: | copy-env create-symlink up print-urls

.PHONY: copy-env
copy-env:
	@ [ ! -f .env ] && cp .env.example .env || true

.PHONY: create-symlink
create-symlink:
	@ [ -L .docker/.env ] || ln -s ../.env .docker/.env

.PHONY: print-urls
print-urls:
	@echo "## Acceso a la Aplicación:   http://localhost:8081/"
	@echo "## Acceso a PhpMyAdmin:      http://localhost:8082/"

## ---------------------------------------------------------
## Gestión de Contenedores
## ---------------------------------------------------------

.PHONY: up
up:
	$(DOCKER_COMPOSE) up -d

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: restart
restart:
	$(DOCKER_COMPOSE) restart

.PHONY: ps
ps:
	$(DOCKER_COMPOSE) ps

.PHONY: logs
logs:
	$(DOCKER_COMPOSE) logs

.PHONY: build
build:
	$(DOCKER_COMPOSE) build

.PHONY: stop
stop:
	$(DOCKER_COMPOSE) stop

.PHONY: install-dependencies
install-dependencies:
	$(DOCKER_COMPOSE) exec pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec pokemon-card composer require monolog/monolog
	$(DOCKER_COMPOSE) exec pokemon-card composer require --dev phpunit/phpunit ^11

.PHONY: prepare-tests
prepare-tests:
	$(DOCKER_COMPOSE) exec pokemon-card mv /usr/local/bin/phpunit /var/www/html/tests/phpunit.phar
	$(DOCKER_COMPOSE) exec pokemon-card chmod +x /var/www/html/tests/phpunit.phar
	$(DOCKER_COMPOSE) exec pokemon-card chown -R 1000:1000 /var/www/html/tests

.PHONY: clean-docker
clean-docker:
	sudo docker rmi -f $$(sudo docker images -q) || true
	sudo docker volume rm $$(sudo docker volume ls -q) || true
	sudo docker network prune -f || true

.PHONY: init-tes
init-tes:
	$(DOCKER_COMPOSE) exec pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec pokemon-card ./tests/phpunit.phar --configuration ./tests/phpunit.xml --testdox

.PHONY: shell
shell:
	$(DOCKER_COMPOSE) exec --user pablogarciajc pokemon-card  /bin/sh -c "cd /var/www/html/; exec bash -l"

## ---------------------------------------------------------
## Inicializar npm y crear package.json
## ---------------------------------------------------------

.PHONY: npm-init
npm-init:
	$(DOCKER_COMPOSE) exec pokemon-card npm init -y

## ---------------------------------------------------------
## Instalar dependencias de npm
## ---------------------------------------------------------

.PHONY: npm-install
npm-install:
	$(DOCKER_COMPOSE) exec pokemon-card npm install






