
DOCKER_COMPOSE = srcs/docker-compose.yml

all: net up

net:
	@sudo hostsed add 127.0.0.1 acharra.42.fr


up:
	@if [ ! -d "/home/acharra/data" ]; then mkdir "/home/acharra/data"; fi
	@if [ ! -d "/home/acharra/data/wordpress" ]; then mkdir "/home/acharra/data/wordpress"; fi
	@if [ ! -d "/home/acharra/data/mariadb" ]; then mkdir "/home/acharra/data/mariadb"; fi
	@docker-compose -f $(DOCKER_COMPOSE) up -d

down:
	@docker-compose -f $(DOCKER_COMPOSE) down

re-img:
	@docker-compose -f $(DOCKER_COMPOSE) up -d --build

clear:
	@docker system prune -a -f

status:
	@docker ps --format "table {{.Names}}:\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Mounts}}"

re : down clear up
