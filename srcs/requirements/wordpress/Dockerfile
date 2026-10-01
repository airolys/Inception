FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysql mariadb-client netcat

COPY ./conf/wp_setup.sh /wp_setup.sh

RUN  chmod +x wp_setup.sh

ENTRYPOINT ["./wp_setup.sh"]