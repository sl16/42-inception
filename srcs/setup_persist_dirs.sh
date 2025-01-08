#!/bin/bash

# Ensure the base directory exists
if [ ! -d "/home/${USER}/data" ]; then
	mkdir -p /home/${USER}/data
fi

# Ensure the WordPress directory exists
if [ ! -d "/home/${USER}/data/volume-wp" ]; then
	mkdir -p /home/${USER}/data/volume-wp
fi

# Ensure the MariaDB directory exists
if [ ! -d "/home/${USER}/data/volume-db" ]; then
	mkdir -p /home/${USER}/data/volume-db
fi

# Set the correct permissions
sudo chown -R $(whoami):$(whoami) /home/${USER}/data