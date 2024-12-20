# PROJECT ---------------------------------- #

NAME			= Inception

# COLOURS ---------------------------------- #

GREEN			= \033[0;32m
RED				= \033[0;31m
RESET			= \033[0m

# RULES ------------------------------------ #

all:
	@echo "$(GREEN)Launching project $(NAME)...$(RESET) (docker-compose up)"
# @bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@echo "$(GREEN)Building & launching project $(NAME)...$(RESET) (docker-compose up --build)"
# @bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@echo "$(RED)Stopping project $(NAME)...$(RESET) (docker-compose down)"
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@echo "$(RED)Removing built files of $(NAME)...$(RESET) (docker system prune)"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

re: clean build

fclean:
	@echo "$(RED)Removing ALL $(NAME)-related files...$(RESET) (docker prune)"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean