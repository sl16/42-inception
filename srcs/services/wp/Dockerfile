# Load the penultimate stable Debian release
FROM debian:bullseye

# Install dependencies for the installation of Wordpress (wget, php, php-fpm, MariaDB client)
RUN apt update && apt upgrade && apt install -y \
	wget \
	php\
	php-fpm\
	php-mysql\
	mariadb-client

# Download Wordpress into /var/www
RUN wget https://wordpress.org/latest.tar.gz -P /var/www

# Extract the tar
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

# Ensure the root user has owner permissions
RUN chown -R root:root /var/www/wordpress

# Copy custom .php configuration
COPY ./php.conf /etc/php/7.4/fpm/pool.d/www.conf

# # Download and setup the command-line interface for WordPress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp-cli.phar

# Copy custom WP setup script into the container
COPY ./setup_wp.sh setup_wp.sh

# Launch the setup script
ENTRYPOINT ["bash", "setup_wp.sh"]