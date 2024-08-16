# Load the base image - using Alpine because it's lightweight
FROM alpine:3.20

# Update the package index, upgrade installed packages, and install php
RUN apk update && apk upgrade && apk add php php-fpm

# Run Php-Fpm in the foreground - if ran in the background, the container halts (explanation: https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting)
CMD ["/usr/sbin/php-fpm8", "-F"]