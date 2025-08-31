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
	$(DOCKER_COMPOSE) exec packages-pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec packages-pokemon-card composer require monolog/monolog
	$(DOCKER_COMPOSE) exec packages-pokemon-card composer require --dev phpunit/phpunit ^11

.PHONY: prepare-tests
prepare-tests:
	$(DOCKER_COMPOSE) exec packages-pokemon-card mv /usr/local/bin/phpunit /var/www/html/tests/phpunit.phar
	$(DOCKER_COMPOSE) exec packages-pokemon-card chmod +x /var/www/html/tests/phpunit.phar
	$(DOCKER_COMPOSE) exec packages-pokemon-card chown -R 1000:1000 /var/www/html/tests

.PHONY: clean-docker
clean-docker:
	sudo docker rmi -f $$(sudo docker images -q) || true
	sudo docker volume rm $$(sudo docker volume ls -q) || true
	sudo docker network prune -f || true

.PHONY: init-tes
init-tes:
	$(DOCKER_COMPOSE) exec packages-pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec packages-pokemon-card ./tests/phpunit.phar --configuration ./tests/phpunit.xml --testdox

.PHONY: shell
shell:
	$(DOCKER_COMPOSE) exec --user pablogarciajc packages-pokemon-card /bin/sh -c "cd /var/www/html/; exec bash -l"

## ---------------------------------------------------------
## Inicializar npm y crear package.json
## ---------------------------------------------------------

.PHONY: npm-init
npm-init:
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm init -y

## ---------------------------------------------------------
## Instalar dependencias de npm
## ---------------------------------------------------------

.PHONY: npm-install
npm-install:
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm install

## ---------------------------------------------------------
## Vincular paquete local para probarlo en otros proyectos
## ---------------------------------------------------------

.PHONY: npm-link
npm-link:
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm link

## ---------------------------------------------------------
## Desenlazar paquete de proyecto local
## ---------------------------------------------------------

.PHONY: npm-unlink
npm-unlink:
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm unlink

## ---------------------------------------------------------
## Publicar paquete en npm
## ---------------------------------------------------------

.PHONY: npm-login
npm-login:
	@echo "Iniciando sesión en npm dentro del contenedor..."
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm login

.PHONY: npm-publish
npm-publish:
	@echo "Publicando paquete en npm..."
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm publish --access public

## ---------------------------------------------------------
## Versionado y publicación automática con safe.directory
## ---------------------------------------------------------

.PHONY: npm-version
npm-version:
	@echo "Configurando safe.directory y aumentando versión patch..."
	$(DOCKER_COMPOSE) exec packages-pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm version patch

.PHONY: npm-publish-patch
npm-publish-patch: npm-version npm-publish
	@echo "Paquete publicado con nueva versión patch."

.PHONY: npm-publish-minor
npm-publish-minor:
	@echo "Configurando safe.directory y aumentando versión minor..."
	$(DOCKER_COMPOSE) exec packages-pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm version minor
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm publish --access public

.PHONY: npm-publish-major
npm-publish-major:
	@echo "Configurando safe.directory y aumentando versión major..."
	$(DOCKER_COMPOSE) exec packages-pokemon-card git config --global --add safe.directory /var/www/html
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm version major
	$(DOCKER_COMPOSE) exec packages-pokemon-card npm publish --access public
