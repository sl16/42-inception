#!bin/bash

# Ensure MariaDB has enough time to start up
echo "Entering WP script"
sleep 10

# Read secrets
DB_PASS=$(cat /run/secrets/db_pass)
WP_ADMINPASS=$(cat /run/secrets/wp_adminpass)
WP_USERPASS=$(cat /run/secrets/wp_userpass)

# Setup the Wordpress page, connect it to MariaDB, setup users
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	echo "Creating WP config"
	wp-cli.phar config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USER \
						--dbpass=$DB_PASS \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

	sleep 2

	echo "Installing WP site"
	wp-cli.phar core install		--allow-root \
						--url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$WP_ADMIN \
						--admin_password=$WP_ADMINPASS \
						--admin_email=$WP_ADMINEMAIL \
						--path='/var/www/wordpress'

	sleep 2
	
	echo "Creating WP user"
	wp-cli.phar user create		--allow-root \
						--role=author $WP_USER $WP_USEREMAIL \
						--user_pass=$WP_USERPASS \
						--path='/var/www/wordpress' >> /log.txt

    wget -O /var/www/wordpress/wp-content/uploads/cat.gif https://media.tenor.com/zlKoX5HPPu8AAAAM/cat-annoyed.gif
    wp-cli.phar media import /var/www/wordpress/wp-content/uploads/cat.gif --allow-root --path='/var/www/wordpress'
    IMAGE_ID=$(wp-cli.phar post list --post_type=attachment --post_status=inherit --format=ids --allow-root --path='/var/www/wordpress')
    wp-cli.phar post create --post_type=page --post_title='Home' --post_status=publish --post_content='<img src="/wp-content/uploads/cat.gif" />' --allow-root --path='/var/www/wordpress'
    PAGE_ID=$(wp-cli.phar post list --post_type=page --post_title='Home' --format=ids --allow-root --path='/var/www/wordpress')
    wp-cli.phar option update show_on_front 'page' --allow-root --path='/var/www/wordpress'
    wp-cli.phar option update page_on_front $PAGE_ID --allow-root --path='/var/www/wordpress'
fi

if [ ! -d /run/php ]; then
	mkdir ./run/php
fi

# Start PHP-FPM in the foreground
echo "Starting php-fpm"
/usr/sbin/php-fpm7.4 -F
