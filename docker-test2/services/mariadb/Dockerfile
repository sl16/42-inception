FROM debian:12

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY init.sql /etc/mysql/init.sql

COPY install-mdb.sh .

RUN mkdir /run/mysqld && chmod +x install-mdb.sh

CMD ["./install-mdb.sh"]