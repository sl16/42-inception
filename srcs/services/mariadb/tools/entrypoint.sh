#!/bin/bash
set -e

# Start the MariaDB service
service mariadb start

# Run the custom MariaDB setup script
/usr/local/bin/setup_mariadb.sh

# Keep the container running
exec "$@"