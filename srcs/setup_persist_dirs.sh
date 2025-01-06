#!/bin/bash

# Ensure the base directory exists
if [ ! -d "/home/${USER}/inception-persist" ]; then
	mkdir -p /home/${USER}/inception-persist
fi

# Ensure the WordPress directory exists
if [ ! -d "/home/${USER}/inception-persist/wp" ]; then
	mkdir -p /home/${USER}/inception-persist/wp
fi

# Ensure the MariaDB directory exists
if [ ! -d "/home/${USER}/inception-persist/db" ]; then
	mkdir -p /home/${USER}/inception-persist/db
fi

# Set the correct permissions
sudo chown -R $(whoami):$(whoami) /home/${USER}/inception-persist