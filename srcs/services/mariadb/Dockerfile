# Load the penultimate stable Debian release
FROM debian:bullseye

# Install mariadb
RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y

# Copy custom mariadb config file into the container
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy custom mariadb setup script into the container
COPY tools/setup_mariadb.sh /usr/local/bin/setup_mariadb.sh

# Ensure the custom mariadb setup script is executable
RUN chmod +x /usr/local/bin/setup_mariadb.sh

# Expose the default MySQL port
EXPOSE 3306

# Copy entrypoint script
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start the mariadb service
CMD ["mysqld_safe"]