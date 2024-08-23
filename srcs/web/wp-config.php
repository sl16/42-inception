<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '$8;^BVvJ+^a(>5=^F;iMO&cZ@?4)pxT=p@dDPQV,c}ou7OC>?<JyH1%q.BBy$n@f' );
define( 'SECURE_AUTH_KEY',   'R_3(0s?H _iY;q.-zv$K&89FI={~YAbaGM:{05B{9Ed }-<)WG))hI:M=WG:WUg8' );
define( 'LOGGED_IN_KEY',     'z#YR=+?H^+0|CA#7T=pWnqjJ8}pvkYRUW]fhL&F)iH461QH8QT)7+z+;,5nlcEE$' );
define( 'NONCE_KEY',         '^8}{@H2H=vU4@>%wR7GEM(!K5;X-M-H@T8;&vW*/>$1-{|R^x iW=iX4<r~?s4aB' );
define( 'AUTH_SALT',         '21f@9(Sag`NF _AxZ-+V>Uqwmx<#[3e#AghS`bQSfHP9g7Yos#6U6=v<z.)[5 Fh' );
define( 'SECURE_AUTH_SALT',  'cQ hu2qRv%9pF>~oN$SM%k 7M`A~@wB3-@0[Wg4L$X@!?(IJ(w3-nv~&ru6O7N!!' );
define( 'LOGGED_IN_SALT',    'n:UG7,9tE+G+F#f{WX&Z,e]2& _&:-;l}`qSL{I0n9DEB]Bi~GkvAruTx*;+Q=pT' );
define( 'NONCE_SALT',        'GorT}z9S-0`u0Nm-zhf]]^;p(Nq=.^q}7wN)x2/hX48uWn_ dU5;7ZWe_&NSMked' );
define( 'WP_CACHE_KEY_SALT', 'bcZu);/?U~3i*+aiwdieD(QnI9>BP`9ekjcMLg-f$HrTo+fyXU@-0<t2~$>DUe3!' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
