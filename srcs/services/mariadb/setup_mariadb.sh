#!/bin/bash

# Start MariaDB in safe mode in the background
mysqld_safe &

# Wait for MariaDB to start
sleep 5

# Read secrets
DB_ROOTPASS=$(cat /run/secrets/db_rootpass)
DB_PASS=$(cat /run/secrets/db_pass)

# Set the root password if it is not already set
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOTPASS}';"

# Create the database if it does not exist
mysql -u root -p$DB_ROOTPASS -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it does not exist and set the password
mysql -u root -p$DB_ROOTPASS -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"

# Grant all privileges on the database to the user from any host
mysql -u root -p$DB_ROOTPASS -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"

# Reload the privilege tables to ensure all changes take effect
mysql -u root -p$DB_ROOTPASS -e "FLUSH PRIVILEGES;"

# List all users to verify
mysql -u root -p$DB_ROOTPASS -e "SELECT User, Host FROM mysql.user;"

# Shut down the MariaDB service to ensure that all configuration changes are applied
mysqladmin -u root -p$DB_ROOTPASS shutdown

# Start the MariaDB service in the foreground
exec mysqld_safe