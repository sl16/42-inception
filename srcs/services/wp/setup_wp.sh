#!bin/bash

# Ensure MariaDB has enough time to start up
sleep 10

# Setup the Wordpress page, connect it to MariaDB, setup users
if [ ! -e /var/www/wordpress/wp-config.php ]; then

	wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USER \
						--dbpass=$DB_PASS \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

	sleep 2

	wp core install		--url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$WP_ADMIN \
						--admin_password=$WP_ADMINPASS \
						--admin_email=$WP_ADMINEMAIL \
						--allow-root \
						--path='/var/www/wordpress'

	sleep 2
	
	wp user create		--allow-root \
						--role=author $WP_USER $WP_USEREMAIL \
						--user_pass=$WP_USERPASS \
						--path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
	mkdir ./run/php
fi

# Start PHP-FPM in the foreground
/usr/sbin/php-fpm7.4 -F