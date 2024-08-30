FROM debian:12

RUN apt update && apt upgrade && apt install -y php-fpm php-mysqli curl

COPY www.conf /etc/php/8.2/fpm/pool.d/.

COPY install-wp.sh .

RUN chmod +x install-wp.sh

CMD ["./install-wp.sh"]