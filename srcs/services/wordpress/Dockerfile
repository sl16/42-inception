# Load the base image - using Alpine because it's lightweight
# FROM alpine:3.20
FROM debian:12

# Update the package index, upgrade installed packages, and install php
# RUN apk update && apk upgrade && apk add php8 php8-fpm
RUN apt update && apt upgrade && apt install -y php-fpm

# Copy config file into container
COPY www.conf /etc/php/8.2/fpm/pool.d/.

# Run Php-Fpm in the foreground - if ran in the background, the container halts (explanation: https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting)
CMD ["php-fpm8.2", "-F"]