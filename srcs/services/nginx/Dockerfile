# Load the base image - using Alpine because it's lightweight
# FROM alpine:3.20
FROM debian:12

# Update the package index, upgrade installed packages, and install Nginx
# RUN apk update && apk upgrade && apk add nginx
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx

# # Copy custom Nginx configuration file
COPY default.conf /etc/nginx/sites-available/.

# Expose ports (this directive is actually purely for documentation, as it does not publish the ports)
EXPOSE 80
EXPOSE 443

# Run Nginx in the foreground - if ran in the background, the container halts (explanation: https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting)
CMD ["nginx", "-g", "daemon off;"]