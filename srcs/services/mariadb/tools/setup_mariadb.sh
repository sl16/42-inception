#!/bin/bash

# Create the database if it does not exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it does not exist and set the password
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASS}';"

# Grant all privileges on the database to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"

# Change the root user's password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';"

# Reload the privilege tables to ensure all changes take effect
mysql -e "FLUSH PRIVILEGES;"

# Shut down the MariaDB service
mysqladmin -u root -p$DB_ROOT shutdown