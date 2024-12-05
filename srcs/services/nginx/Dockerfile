# Load the penultimate stable Debian release
FROM debian:bullseye

# Install nginx
RUN apt update && apt upgrade && apt install nginx -y

# Create necessary folders
RUN mkdir -p /etc/nginx/ssl && mkdir -p /var/run/nginx

# Install certification authority
RUN apt install openssl -y && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CZ/ST=Prague/L=Prague/O=42/OU=42Prague/CN=vbartos.42.fr/UID=vbartos"

# Copy custom nginx config file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Ensure rights to properly run the service
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

# Expose port 443 for HTTPS
EXPOSE 443

# Launch Nginx in the foreground so the container doesn't exit immediately
CMD [ "nginx", "-g", "daemon off;" ]