# Load the penultimate stable Debian release
FROM debian:bullseye

# Install mariadb
RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y

# Copy custom mariadb config file into the container
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy custom mariadb setup script into the container
COPY ./setup_mariadb.sh /setup_mariadb.sh

# Expose the default MySQL port
EXPOSE 3306

# Launch the setup script
ENTRYPOINT ["bash", "setup_mariadb.sh"]